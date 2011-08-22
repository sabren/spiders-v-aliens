package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class HeroShip extends FlxSprite 
	{
		
		public function HeroShip(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgHeroShip, true, true,80, 50);
		}
		
	}

}