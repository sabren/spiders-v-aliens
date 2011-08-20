package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Box extends FlxSprite 
	{
		
		public function Box(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgBox, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}