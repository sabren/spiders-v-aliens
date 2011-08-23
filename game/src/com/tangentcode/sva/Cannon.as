package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Cannon extends Machine 
	{
		override public function imgClass():Class { return SvA.ImgCannon; }
	
		public function Cannon(x:Number=0, y:Number=0) 
		{
			super(x, y);
			this.contentClass = Bullet;
		}
		
		override protected function dispense(direction:int):FlxSprite 
		{
			var b:Bullet = super.dispense(direction) as Bullet;
			if (b != null)
			{
				switch (direction)
				{
					case SvA.N: b.velocity.y = -75; break;
					case SvA.S: b.velocity.y =  75; break;
					case SvA.E: b.velocity.x =  75; break;
					case SvA.W: b.velocity.x = -75; break;
				}
			}
			return b;
		}
	}
}