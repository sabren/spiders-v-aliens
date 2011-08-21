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
			mShip = new Level_AlienShip(true, onSpriteAdded);
			SvA.assert(mHero != null);
			FlxG.camera.follow(mHero);
			
			// camera bounds
			FlxG.camera.setBounds(mShip.boundsMinX, mShip.boundsMinY,
								  mShip.boundsMaxX - mShip.boundsMinX,
								  mShip.boundsMaxY - mShip.boundsMinY,
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
		
		override public function update():void 
		{
			mHero.acceleration.x = 0;
			mHero.acceleration.y = 0;
			
			if (FlxG.keys.RIGHT)    mHero.moveE();
			if (FlxG.keys.LEFT)		mHero.moveW();
			if (FlxG.keys.UP)       mHero.moveN();
			if (FlxG.keys.DOWN)     mHero.moveS();
			
			FlxG.overlap(mHero, mExit, onReachExit);
			FlxG.overlap(mGrabbers, mMobiles, onGrabMobile);
			FlxG.overlap(mGrabbers, mMachines, onGrabMachine);
			FlxG.overlap(mPortals, mMobiles, onPortMobile);
			
			FlxG.collide(mAliens, mHero, onAlienVsHero);
			FlxG.collide(mSpiders, mAliens, onSpiderVsAlien);
			FlxG.collide(mBullets, mOrganics, onBulletVsOrganic);
			FlxG.collide(mTractors, mMobiles, onTractorVsMobile);

			FlxG.collide(mShip.mainLayer, mHero);
			
			if (mHero.wasHurt)
			{
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
		
		
		private function onSpriteAdded(sprite:FlxSprite, group:FlxGroup):void
		{
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
				mSpiders.add(sprite);
			}
			else if (sprite is Alien)
			{
				mAliens.add(sprite);
			}			
			else if (sprite is Machine)
			{
				mBoxes.add(sprite);
			}
			else if (sprite is Box)
			{
				mBoxes.add(sprite);
			}
		}
		
		private function onReachExit(exit:FlxSprite, hero:FlxSprite):void
		{
			FlxG.switchState(new WinState());
			FlxG.log("you won!");
		}
				
		private function onAlienVsHero(alien:FlxSprite, hero:FlxSprite):void
		{
			if (alien.alive && ! mHero.wasHurt)
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

		private function onGrabMobile(grabber:FlxSprite, mobile:FlxSprite):void
		{
		}
				
		private function onGrabMachine(grabber:FlxSprite, machine:FlxSprite):void
		{	
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

