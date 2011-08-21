package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Machine extends FlxSprite 
	{
		
		public function Machine(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgCannon, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}