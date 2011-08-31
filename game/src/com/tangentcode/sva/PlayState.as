package com.tangentcode.sva
{
	import com.tangentcode.TeleType;
	import flash.display.DisplayObject;
	import flash.geom.Point;
	import flash.text.engine.BreakOpportunity;
	import org.flixel.*;
	import com.tangentcode.sva.dame.*;
	
	public class PlayState extends FlxState
	{
		protected var mShip:Level_AlienShip;
		
		protected var mHero:Hero;
		protected var mExit:Exit;
		protected var mGeist:Geist;
		
		protected var mHudHearts:Array = new Array();
		protected var mHudText:TeleType;
		
		protected var mNarration:FlxGroup = new FlxGroup();
		
		// groups
		protected var mSpiders:FlxGroup = new FlxGroup();
		protected var mAliens:FlxGroup = new FlxGroup();
		
		protected var mMachines:FlxGroup = new FlxGroup();
		protected var mKeys:FlxGroup = new FlxGroup();
		protected var mBoxes:FlxGroup = new FlxGroup();
		protected var mPickups:FlxGroup = new FlxGroup();
		
		// these only get added to the map when certain things happen:
		protected var mBullets:FlxGroup = new FlxGroup();
		protected var mGrabbers:FlxGroup = new FlxGroup();
	
		
		// these two are supersets for bullets and portals/pushers, respectively:
		protected var mOrganics:FlxGroup = new FlxGroup();
		protected var mDraggable:FlxGroup = new FlxGroup();
		protected var mMobiles:FlxGroup = new FlxGroup();
		protected var mWeapons:FlxGroup = new FlxGroup();
		
		private var mAvatars:FlxGroup = new FlxGroup();
		
		private var mToggleCam:Boolean = false;
		
		override public function create():void
		{
			
			// load the map and all the objects therein
			mShip = new Level_AlienShip(true, onAddObject);
			mShip.layerGeistWall.visible = false;
			
			// that should get us a hero and a mimeogeist:
			SvA.assert(mHero != null);
			SvA.assert(mGeist != null);
			mAvatars.add(mHero);
			mAvatars.add(mGeist);
			mGrabbers.add(mHero.grabbers);
			mGrabbers.add(mGeist.grabbers);
			add(mGrabbers);
			mGrabbers.callAll("reposition");
			
			FlxG.camera.follow(mHero);
			
			// add the lower stuff to the bigger groups:
			mOrganics.add(mHero);
			mOrganics.add(mAliens);
			mOrganics.add(mSpiders);
			
			mDraggable.add(mBoxes);
			mDraggable.add(mKeys);
			mDraggable.add(mSpiders);
			mDraggable.add(mAliens);
			
			// TODO: mMobiles.add(mAvatar);
			mMobiles.add(mHero);
			mMobiles.add(mDraggable);
			
			mWeapons.add(mSpiders);
			mWeapons.add(mBullets);
			
			// mMobiles.add(mTractors);
			// mMobiles.add(mBullets); // hearts?
			
			// narration boxes collide, but ought to be invisible:
			mNarration.visible = false;
			add(mNarration);
			
			// camera bounds
			FlxG.camera.setBounds(0, 0, SvA.CellW * 40 * 4, SvA.CellH * 25 * 4,
								  // updates world bounds too:
								  true);
								  
			// build the HUD:
			var hudHeight:int = 64;
			var hudPadding:int = 4;
			var hud:FlxSprite = new FlxSprite(0, FlxG.height - hudHeight);
			var noScroll:FlxPoint = new FlxPoint(0, 0);
			
			// background:
			hud.makeGraphic(FlxG.width, hudHeight, 0xee000000);
			hud.scrollFactor = noScroll;
			add(hud);
			
			// heart display:
			var h:Heart;
			mHero.health = mHero.maxHealth;
			for (var i:int = 0; i < mHero.maxHealth; ++i)
			{
				h = mHudHearts[i] = new Heart(FlxG.width - hudPadding - (mHero.maxHealth + 0.5 - i) * SvA.CellW,
											  FlxG.height - hudHeight  + hudPadding);
				h.scrollFactor = noScroll;
				add(h);
			}
			
			mHudText = new TeleType(hudPadding, FlxG.height - hudHeight + hudPadding * 2, FlxG.width * 0.75, "");
			mHudText.size = 14;
			mHudText.scrollFactor = noScroll;
			add(mHudText);
			
			
			FlxG.watch(mHero.mGrabbers[SvA.N], "content", "N");
			FlxG.watch(mHero.mGrabbers[SvA.W], "content", "W");
			FlxG.watch(mHero.mGrabbers[SvA.S], "content", "S");
			FlxG.watch(mHero.mGrabbers[SvA.E], "content", "E");
			
			
			FlxG.playMusic(SvA.SndMusic);
		}
				
		private var chasePointHero:FlxPoint = new FlxPoint();
		private var chasePointOther:FlxPoint = new FlxPoint();
		private function chaseHero(group:FlxGroup, speed:int, tooClose:int=0):void
		{
			chasePointHero.x = mHero.x;
			chasePointHero.y = mHero.y;
			
			for each (var s:Capturable in group.members)
			{
				chasePointOther.x = s.x;
				chasePointOther.y = s.y;
				
				// alive, uncaptured, and clear line of sight:
				if (s.alive && (!s.captive) && (mShip.layerEnvironment.ray(chasePointOther, chasePointHero)))
				{
					if (tooClose > 0 && FlxU.getDistance(mHero.last, s.last) < tooClose)
					{
						// dart away
						s.acceleration.x = SvA.sgn(mHero.x - s.x) * speed * (-2);
						s.acceleration.y = SvA.sgn(mHero.y - s.y) * speed * (-2);					
					}
					else
					{
						s.acceleration.x = SvA.sgn(mHero.x - s.x) * speed;
						s.acceleration.y = SvA.sgn(mHero.y - s.y) * speed;
					}
				}
				else
				{
					s.acceleration.x = 0;
					s.acceleration.y = 0;
				}
			}
		}
		
		private var mGrabKeys:Array = [false, false, false, false];
		private var mGrabLast:Array = [false, false, false, false];

		override public function update():void 
		{
			// if (FlxG.keys.TAB) screenshotcheat = true;
			
			// wasd or dvorak equivalents:
			mGrabKeys[SvA.N] = FlxG.keys.W || FlxG.keys.COMMA;
			mGrabKeys[SvA.W] = FlxG.keys.A;
			mGrabKeys[SvA.S] = FlxG.keys.S || FlxG.keys.O
			mGrabKeys[SvA.E] = FlxG.keys.D || FlxG.keys.E; // || screenshotcheat
			
			var g:Grabber;
			for (var dir:int = 0; dir < 4; ++dir)
			{
				for each (var avatar:Avatar in mAvatars.members)
				{
					g = avatar.mGrabbers[dir];
					
					// always follow the owner, possibly dragging something along:
					g.reposition();
					
					if (mGrabKeys[dir])
					{
						g.exists = true;
						g.done = false;
						
						// grab something new:
						if (! mGrabLast[dir])
						{
							FlxG.overlap(g, mMachines, onGrabMachine);
							FlxG.overlap(g, mDraggable, onGrabDraggable);
						}
					}
					else
					{
						g.exists = false;
						g.grab(null);
					}
				}
				mGrabLast[dir] = mGrabKeys[dir];
			}
			
			chaseHero(mAliens,  50);
			chaseHero(mSpiders, 15, 25);
			
			mAvatars.callAll("clearAcceleration");
			
			if (FlxG.keys.UP)    mAvatars.callAll("moveN");
			if (FlxG.keys.LEFT)	 mAvatars.callAll("moveW");
			if (FlxG.keys.DOWN)  mAvatars.callAll("moveS");
			if (FlxG.keys.RIGHT) mAvatars.callAll("moveE");
			
			// helper cam to see what the geist is up to
			if (FlxG.keys.justPressed("G"))
			{
				mToggleCam = !mToggleCam;
				FlxG.camera.follow(mToggleCam ? mGeist : mHero );
				FlxG.camera.focusOn(mToggleCam ? mGeist.last : mHero.last );
			}
			
			mGeist.solid = true;
			FlxG.collide(mShip.layerGeistWall, mGeist);
			mGeist.solid = false;
			
			FlxG.overlap(mHero, mExit, onReachExit);
			FlxG.overlap(mHero, mPickups, onPickup);
			FlxG.overlap(mKeys, mMachines, onKeyVsMachine);
			FlxG.collide(mShip.masterLayer, mMobiles, onCollide);
			FlxG.overlap(mWeapons, mAliens, onKillAlien);
			FlxG.collide(mBullets, mShip.masterLayer, onBulletVsAnything);
			
			narrate();			
			
			if (mHero.wasHurt)
			{
				FlxG.shake(0.02, 0.5);
				updateHearts();
				mHero.wasHurt = false;
			}
			
			super.update();
		}
		
		
		private function updateHearts():void
		{
			var h:Heart;
			for (var i:int = 0; i < mHero.maxHealth; ++i)
			{
				h = mHudHearts[i];
				h.frame = (i + 1 > mHero.health) ? 1 : 0;
			}
		}
				
		private function onAddObject(obj:Object, group:FlxGroup, level:BaseLevel, scrollX:Number, scrollY:Number, properties:Array):void
		{
			if (obj is FlxSprite && obj.drag.x == 0)
			{
				obj.drag.x = 50;
				obj.drag.y = 50;
			}	
			
			var startDead:Boolean = false;
			var hasPower:Boolean = false;
			if ( properties )
			{
			    var i:uint = properties.length;
			    while(i--)
			    {
					var name:String = properties[i].name;
					var value:Object = properties[i].value;
					if (name == "startDead")
					{
						startDead = value;
					}
					else if (name == "hasPower")
					{
						hasPower = value;
					}
				}
			}
			
			if (obj is ObjectLink)
			{
				var link:ObjectLink = obj as ObjectLink;
				if (link.fromObject is Portal)
				{
					var p1:Portal = link.fromObject as Portal;
					var p2:Portal = link.toObject as Portal;
					p1.otherSide = p2;
					p2.otherSide = p1;
				}
				else if (link.fromObject is Powered)
				{
					var pow1:Powered = link.fromObject as Powered;
					var pow2:Powered = link.toObject as Powered;
					pow1.sendPowerTo.push(pow2);
				}
			}
			
			else if (obj is TextData)
			{
				mNarration.add(new Narration(obj as TextData));
			}
			
			else if (obj is Alien)
			{
				var a:Alien = obj as Alien;
				mAliens.add(a);
				if (startDead) { a.hurt(1); }
			}			
			else if (obj is Box)
			{
				mBoxes.add(obj as Box);
			}
			else if (obj is Exit)
			{
				mExit = obj as Exit;
			}
			else if (obj is Hero)
			{
				mHero = obj as Hero;
			}
			else if (obj is Geist)
			{
				mGeist = obj as Geist;
			}
			else if (obj is Key)
			{
				mKeys.add(obj as Key);
			}
			else if (obj is Machine)
			{
				var m:Machine = obj as Machine;
				mMachines.add(obj as Machine);
				hasPower ? m.addPower() : m.cutPower();
			}
			else if (obj is Pickup)
			{
				mPickups.add(obj as Pickup);
			}
			else if (obj is Spider)
			{
				mSpiders.add(obj as Spider);
			}
		}
		
		private function onReachExit(exit:FlxSprite, hero:FlxSprite):void
		{
			FlxG.switchState(new WinState());
			FlxG.log("you won!");
		}
		
		
		private var mOldText:String = "";
		private var mNewText:String = "";
		private function narrate():void
		{
			mNewText = "";
			FlxG.overlap(mHero, mNarration, onNarration);
			if (mNewText != mOldText)
			{
				mOldText = mNewText;
				mHudText.fullText = mNewText;
			}
		}
		
		
		private function onNarration(hero:FlxSprite, narration:Narration):void
		{
			mNewText = narration.text;
		}
		
		private function onCollide(o1:FlxObject, o2:FlxObject):void
		{
			if (o1 is FlxSprite && o2 is FlxSprite)
			{
				var a:FlxSprite;
				var b:FlxSprite;
				
				// put a,b in alphabetical order
				if (typeof(o1) < typeof(o2))
				{
					a = o1 as FlxSprite;
					b = o2 as FlxSprite;
				}
				else
				{
					a = o2 as FlxSprite;
					b = o1 as FlxSprite;
				}
				
				     if (a is Alien && b is Hero) { onAlienVsHero(a, b); }
				else if (a is Alien && b is Spider) { onSpiderVsAlien(b, a); }
				else if (a is Alien && b is Bullet) { onBulletVsAnything(b, a); }
				else if (a is Key && b is SwitchBox) { onKeyVsMachine(a as Key, b as SwitchBox); }
				
			}
		}
				
		private function onAlienVsHero(alien:FlxSprite, hero:FlxSprite):void
		{
			if (alien.alive && mHero.stunCount == 0)
			{
				mHero.hurt(1);
				mHero.velocity.x = -mHero.velocity.x;
				mHero.velocity.y = -mHero.velocity.y;
			}
		}
		
		private function onSpiderVsAlien(spider:FlxSprite, alien:FlxSprite):void
		{
			if (alien.alive)
			{
				alien.hurt(1);
				spider.kill();
			}
		}

		private function onPickup(hero:Hero, thing:Pickup):void
		{
			if (thing is Heart)
			{
				mHero.hurt( -1);
			}
			thing.kill();
		}		
		
		private function onKillAlien(weapon:FlxSprite, alien:FlxObject):void
		{
			if (weapon is Bullet)
				onBulletVsAnything(weapon, alien);
			else if (weapon is Spider)
				onSpiderVsAlien(weapon, alien as FlxSprite);
		}
		
		private function onBulletVsAnything(bullet:FlxSprite, organic:FlxObject):void
		{
			if (organic is Alien && ! organic.alive)
				organic.exists = false; // clean up dead bodies
			else if (organic is Capturable || organic is Hero)
			{
				organic.hurt(1);
			}
			bullet.kill();
		}
		
		private function onGrabDraggable(grabber:Grabber, thing:FlxSprite):void
		{
			if (! grabber.done)
			{
				grabber.grab(thing);
				if (thing is Alien && thing.alive && grabber.owner == mHero)
					mHero.hurt(1);
			}
		}
				
		private function onGrabMachine(grabber:Grabber, machine:Machine):void
		{
			if (! grabber.done)
			{
				var dispensed:FlxSprite = machine.activate(grabber.frame, grabber.owner);
				if (dispensed) 
				{
					SvA.position(dispensed, grabber.frame, machine);
					add(dispensed); // so we can see it
					if (dispensed is Bullet)
						mBullets.add(dispensed); // so we can feel it :)
					// FlxG.log("vel " + (typeof dispensed) + " = (" + dispensed.velocity.x.toString() + "," + dispensed.velocity.x.toString() + ")");
				}
				grabber.done = true;
			}
		}
		
		private function onKeyVsMachine(key:Key, machine:Machine):void
		{
			if (machine is KeyBox && !machine.hasPower)
			{
				machine.addPower();
				key.kill();
			}
		}
		
		private function onTractorVsMobile(pusher:FlxSprite, mobile:FlxSprite):void
		{
		}
		
		// !! not sure about this one yet...
		private function onMobileCollide(pusher:FlxSprite, mobile:FlxSprite):void
		{
		}
		
	}
}

