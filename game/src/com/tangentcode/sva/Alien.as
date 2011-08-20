package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Alien extends FlxSprite 
	{
		
		public function Alien(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgAlien, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}