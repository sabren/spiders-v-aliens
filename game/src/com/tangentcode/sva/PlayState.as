package com.tangentcode.sva
{
	import flash.text.engine.BreakOpportunity;
	import org.flixel.*;
	import com.tangentcode.sva.dame.*;
	
	public class PlayState extends FlxState
	{
		protected var mShip:BaseLevel;
		
		protected var mHero:Hero;
		protected var mExit:Exit;
		protected var mAvatar:FlxSprite;
		
		protected var mHearts:Array = new Array();
		
		// groups
		protected var mSpiders:FlxGroup = new FlxGroup();
		protected var mAliens:FlxGroup = new FlxGroup();
		
		protected var mMachines:FlxGroup = new FlxGroup();
		protected var mBoxes:FlxGroup = new FlxGroup();
		
		// these only get added to the map when certain things happen:
		protected var mBullets:FlxGroup = new FlxGroup();
		protected var mGrabbers:FlxGroup = new FlxGroup();		

		// these two are supersets for bullets and portals/pushers, respectively:
		protected var mOrganics:FlxGroup = new FlxGroup();
		protected var mDraggable:FlxGroup = new FlxGroup();
		protected var mMobile:FlxGroup = new FlxGroup();
		
		override public function create():void
		{
			
			// load the map and all the objects therein
			mShip = new Level_AlienShip(true, onAddObject);
			
			// that should get us a hero:
			SvA.assert(mHero != null);
			FlxG.camera.follow(mHero);
			mGrabbers.add(mHero.grabbers);
			add(mGrabbers);
			mGrabbers.callAll("reposition");
			
			// add the lower stuff to the bigger groups:
			mOrganics.add(mHero);
			mOrganics.add(mAliens);
			mOrganics.add(mSpiders);
			
			// TODO: mMobiles.add(mAvatar);
			mDraggable.add(mAliens);
			mDraggable.add(mSpiders);
			mDraggable.add(mBoxes);
			
			mMobile.add(mHero);
			mMobile.add(mDraggable);
			
			// mMobiles.add(mTractors);
			// mMobiles.add(mBullets); // hearts?			
			
			// camera bounds
			FlxG.camera.setBounds(0, 0, SvA.CellW * 40 * 4, SvA.CellH * 25 * 4,
								  // updates world bounds too:
								  true);
								  
								  
			// heart display:
			var h:Heart;
			mHero.health = 4;
			for (var i:int = 0; i < mHero.maxHealth; ++i)
			{
				h = mHearts[i] = new Heart(FlxG.width - (mHero.maxHealth + 0.5 - i) * SvA.CellW, 4);
				h.scrollFactor.x = 0;
				h.scrollFactor.y = 0;
				add(h);
			}
			
			
			FlxG.watch(mHero.mGrabbers[SvA.N], "content", "N");
			FlxG.watch(mHero.mGrabbers[SvA.W], "content", "W");
			FlxG.watch(mHero.mGrabbers[SvA.S], "content", "S");
			FlxG.watch(mHero.mGrabbers[SvA.E], "content", "E");
			
		}
		
		private var screenshotcheat:Boolean = false;		


		private function chasePlayer(group:FlxGroup, thresh:int, speed:int):void
		{
			for each (var s:Capturable in group.members)
			{
				if (s.alive && (!s.captive) && FlxU.getDistance(mHero.last, s.last) < thresh)
				{
					s.acceleration.x = SvA.sgn(mHero.x - s.x) * speed;
					s.acceleration.y = SvA.sgn(mHero.y - s.y) * speed;
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
			
			mGrabKeys[SvA.N] = FlxG.keys.W || FlxG.keys.COMMA;
			mGrabKeys[SvA.W] = FlxG.keys.A;
			mGrabKeys[SvA.S] = FlxG.keys.S || FlxG.keys.O
			mGrabKeys[SvA.E] = FlxG.keys.D || FlxG.keys.E; // || screenshotcheat
			
			var g:Grabber;
			for (var dir:int = 0; dir < 4; ++dir)
			{
				g = mHero.mGrabbers[dir];
				
				// always follow the owner, possibly dragging something along:
				g.reposition();

				if (mGrabKeys[dir])
				{
					g.active = true; // exists = true;
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
					//g.exists = false;
					g.active = false;
					g.grab(null);
				}
				mGrabLast[dir] = mGrabKeys[dir];
			}
			
			chasePlayer(mAliens,  400,   5);
			chasePlayer(mSpiders, 100, -25);
			
			mHero.acceleration.x = 0;
			mHero.acceleration.y = 0;
			
			if (FlxG.keys.UP)    mHero.moveN();
			if (FlxG.keys.LEFT)	 mHero.moveW();
			if (FlxG.keys.DOWN)  mHero.moveS();
			if (FlxG.keys.RIGHT) mHero.moveE();
			
			
			FlxG.overlap(mHero, mExit, onReachExit);
			//FlxG.collide(mMobiles, mMobiles);
			FlxG.collide(mShip.masterLayer, mMobile);
			
//			FlxG.collide(mAliens, mHero, onAlienVsHero);
//			FlxG.collide(mSpiders, mAliens, onSpiderVsAlien);
//			FlxG.collide(mBullets, mOrganics, onBulletVsOrganic);
//			FlxG.collide(mTractors, mMobiles, onTractorVsMobile);
			
//			FlxG.collide(mShip.masterLayer, mMobiles);
			
			//FlxG.collide(mMobiles, mHero);
			//FlxG.collide(mMachines, mMobiles);
			//FlxG.collide(mMobiles, mMobiles);
			//FlxG.collide(mShip.masterLayer, mHero);
			
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
				h = mHearts[i];
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
			
			}
			else if (obj is Hero)
			{
				mHero = obj as Hero;
			}
			else if (obj is Exit)
			{
				mExit = obj as Exit;
			}
			else if (obj is Spider)
			{
				mSpiders.add(obj as Spider);
			}
			else if (obj is Alien)
			{
				var a:Alien = obj as Alien;
				mAliens.add(a);
				if (startDead) { a.hurt(1); }
			}			
			else if (obj is Machine)
			{
				var m:Machine = obj as Machine;
				mMachines.add(obj as Machine);
				hasPower ? m.addPower() : m.cutPower();
			}
			else if (obj is Box)
			{
				mBoxes.add(obj as Box);
			}
		}
		
		private function onReachExit(exit:FlxSprite, hero:FlxSprite):void
		{
			FlxG.switchState(new WinState());
			FlxG.log("you won!");
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
			alien.hurt(1);
		}

		private function onBulletVsOrganic(spider:FlxSprite, hero:FlxSprite):void
		{
		}

		private function onGrabDraggable(grabber:Grabber, thing:FlxSprite):void
		{
			grabber.grab(thing);
			if (thing is Alien && thing.alive && grabber.owner == mHero)
				mHero.hurt(1);
		}
				
		private function onGrabMachine(grabber:Grabber, machine:Machine):void
		{
			if (! grabber.done)
			{
				var dispensed:FlxSprite = machine.activate(grabber.frame, grabber.owner);
				if (dispensed) 
				{
					SvA.position(dispensed, grabber.frame, machine);
					add(dispensed);
				}
				grabber.done = true;
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

