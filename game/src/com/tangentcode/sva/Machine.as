package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Machine extends Powered 
	{
		public var contentClass:Class = FlxSprite;
		override public function startPowered():Boolean 
		{
			return true;
		}
				
		public function Machine(x:Number = 0, y:Number=0) 
		{
			super(x, y);
			this.solid = true;
			this.immovable = true;
			
			this.mass = Number.MAX_VALUE;
			this.mass = Number.MAX_VALUE;
			this.maxVelocity.x = 0;
			this.maxVelocity.y = 0;
			this.drag.x = Number.MAX_VALUE;
			this.drag.y = Number.MAX_VALUE;
		}
		
		/**
		 * override this to do neat things
		 * Activation happens from "behind": if the player
		 * is to the east, then direction is west.
		 */
		public function activate(direction:int, byWhom:FlxSprite=null):FlxSprite
		{
			return dispense(direction);
		}
		
		protected function dispense(direction:int):FlxSprite
		{
			if (hasPower)
			{
				var s:FlxSprite = new contentClass as FlxSprite;
				SvA.position(s, direction, this);
				reboot();
				return s;
			}
			else
			{
				return null;
			}
		}
		
	}

}