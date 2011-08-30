package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Alien extends Capturable
	{
		
		public function Alien(x:Number=0, y:Number=0) 
		{
			super(x, y);
			loadGraphic(SvA.ImgAlien, true, true, SvA.CellW, SvA.CellH);
			maxVelocity.x = 75;
			maxVelocity.y = 75;
			drag.x = 500;
			drag.y = 500;
		}
		
		override public function hurt(Damage:Number):void 
		{
			if (this.alive)
			{
				this.alive = false;
				this.frame = 1;
			}
		}
		
	}

}