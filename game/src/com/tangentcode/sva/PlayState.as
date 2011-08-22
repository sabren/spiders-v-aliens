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
		protected var mTractors:FlxGroup = new FlxGroup();
		protected var mPortals:FlxGroup = new FlxGroup();
		
		// these only get added to the map when certain things happen:
		protected var mBullets:FlxGroup = new FlxGroup();
		protected var mGrabbers:FlxGroup = new FlxGroup();		

		// these two are supersets for bullets and portals/pushers, respectively:
		protected var mOrganics:FlxGroup = new FlxGroup();
		protected var mMobiles:FlxGroup = new FlxGroup();
		
		override public function create():void
		{
			
			// load the map and all the objects therein
			mShip = new Level_AlienShip(true, onSpriteAdded);
			
			// that should get us a hero:
			SvA.assert(mHero != null);
			FlxG.camera.follow(mHero);
			mGrabbers.add(mHero.grabbers);
			add(mGrabbers);
			
			// add the lower stuff to the bigger groups:
			mOrganics.add(mHero);
			mOrganics.add(mAliens);
			mOrganics.add(mSpiders);
			
			// TODO: mMobiles.add(mAvatar);
			mMobiles.add(mHero);
			mMobiles.add(mAliens);
			mMobiles.add(mSpiders);
			mMobiles.add(mBoxes);
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
			
			
		}
		
		private var screenshotcheat:Boolean = false;
		


		private function chasePlayer(group:FlxGroup, thresh:int, speed:int):void
		{
			for each (var s:FlxSprite in group.members)
			{
				if (s.alive && FlxU.getDistance(mHero.last, s.last) < thresh)
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
		
		override public function update():void 
		{
			// do grab stuff first since it screws other things up:
			mHero.grab(SvA.N, FlxG.keys.W || FlxG.keys.COMMA);
			mHero.grab(SvA.S, FlxG.keys.S || FlxG.keys.O);			
			mHero.grab(SvA.W, FlxG.keys.A);
			mHero.grab(SvA.E, FlxG.keys.D || FlxG.keys.E); // || screenshotcheat);
			mGrabbers.callAll("reposition");
			FlxG.overlap(mGrabbers, mMobiles, onGrabMobile);
			FlxG.overlap(mGrabbers, mMachines, onGrabMachine);
			
			
			chasePlayer(mAliens,  400,   5);
			chasePlayer(mSpiders, 100, -25);
			
			mHero.acceleration.x = 0;
			mHero.acceleration.y = 0;
			
			if (FlxG.keys.UP)       mHero.moveN();
			if (FlxG.keys.LEFT)		mHero.moveW();
			if (FlxG.keys.DOWN)     mHero.moveS();
			if (FlxG.keys.RIGHT)    mHero.moveE();
			
			if (FlxG.keys.TAB) screenshotcheat = true;
			
			
			FlxG.overlap(mHero, mExit, onReachExit);
			FlxG.overlap(mPortals, mMobiles, onPortMobile);
			
			FlxG.collide(mAliens, mHero, onAlienVsHero);
			FlxG.collide(mSpiders, mAliens, onSpiderVsAlien);
			FlxG.collide(mBullets, mOrganics, onBulletVsOrganic);
			FlxG.collide(mTractors, mMobiles, onTractorVsMobile);

			FlxG.collide(mShip.masterLayer, mMobiles);
			FlxG.collide(mMobiles, mHero);
			FlxG.collide(mMachines, mMobiles);
			FlxG.collide(mMobiles, mMobiles);
			FlxG.collide(mShip.masterLayer, mHero);
			
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
		
		
		private function onSpriteAdded(sprite:Object, group:FlxGroup, level:BaseLevel, scrollX:Number, scrollY:Number, properties:Array):void
		{
			if (sprite is FlxSprite && sprite.drag.x == 0)
			{
				sprite.drag.x = 50;
				sprite.drag.y = 50;
			}
			
			
			var startDead:Boolean = false;
			var startOff:Boolean = false;
			if ( properties )
			{
			    var i:uint = properties.length;
			    while(i--)
			    {
					if ( properties[i].name == "startDead" )
					{
						startDead = properties[i].value;
					}
				}
			}

			
			
			
			
			if (sprite is Hero)
			{
				mHero = sprite as Hero;
			}
			else if (sprite is Exit)
			{
				mExit = sprite as Exit;
			}
			else if (sprite is Spider)
			{
				mSpiders.add(sprite as Spider);
			}
			else if (sprite is Alien)
			{
				var a:Alien = sprite as Alien;
				mAliens.add(a);
				if (startDead) { a.hurt(1); }
			}			
			else if (sprite is Machine)
			{
				var m:Machine = sprite as Machine;
				mMachines.add(sprite as Machine);
				if (m is Portal) // || m is SwitchBox || m is CheckPoint
					m.cutPower();
			}
			else if (sprite is Box)
			{
				mBoxes.add(sprite as Box);
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
		
		private function onPortMobile(portal:FlxSprite, mobile:FlxSprite):void
		{
			
		}

		private function onGrabMobile(grabber:Grabber, mobile:FlxSprite):void
		{
			if (grabber.exists && grabber.content == null && mobile != mHero)
			{
				if (mobile is Alien && grabber.owner == mHero)
					mHero.hurt(1);
				grabber.grab(mobile);
			}
		}
				
		private function onGrabMachine(grabber:Grabber, machine:Machine):void
		{
			if (grabber.exists && grabber.content == null)
			{
				var dispensed:FlxSprite = machine.activate(grabber.frame);
				if (dispensed) 
				{
					SvA.position(dispensed, grabber.frame, machine);
					add(dispensed);
				}
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

