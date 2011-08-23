package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Avatar extends FlxSprite 
	{
		
		public var mGrabbers:Array;
		public var grabbers:FlxGroup = new FlxGroup();
			
		public function Avatar(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
	
			this.maxVelocity.x = 100;
			this.maxVelocity.y = 100;
			this.drag.x = 750;
			this.drag.y = 750;
			
			mGrabbers = Grabber.makeGrabbers(this, this.grabbers);
		
		}

		
		public function clearAcceleration():void
		{
			acceleration.x = 0;
			acceleration.y = 0;
		}
		
		public function accelerate(x:Number, y:Number):void
		{
			this.acceleration.x += x;
			this.acceleration.y += y;
		}
		
		
		public function moveN():void
		{
			this.accelerate(0, -200);
		}
		public function moveE():void
		{
			this.accelerate(200, 0);
		}
		public function moveS():void
		{
			this.accelerate(0, 200);
		}
		public function moveW():void
		{
			this.accelerate( -200, 0);
		}		
	}

}