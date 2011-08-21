package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Portal extends FlxSprite 
	{
		
		public function Portal(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgPortal, true, true, SvA.CellW, SvA.CellH);
			solid = false;
		}
		
	}

}