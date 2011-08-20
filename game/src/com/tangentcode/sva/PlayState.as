package com.tangentcode.sva
{
	import org.flixel.*;
	import com.tangentcode.sva.dame.*;
	
	public class PlayState extends FlxState
	{
		protected var mShip:BaseLevel;
		protected var mHero:Hero;
		
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
		}
		
		override public function update():void 
		{
			mHero.acceleration.x = 0;
			mHero.acceleration.y = 0;
			
			if (FlxG.keys.RIGHT)    mHero.moveE();
			if (FlxG.keys.LEFT)		mHero.moveW();
			if (FlxG.keys.UP)       mHero.moveN();
			if (FlxG.keys.DOWN)     mHero.moveS();
			
			FlxG.collide(mShip.mainLayer, mHero);
			
			super.update();
		}
		
		public function onSpriteAdded(sprite:FlxSprite, group:FlxGroup):void
		{
			if (sprite is Hero)
			{
				mHero = sprite as Hero;
			}
		}
		
	}
}

