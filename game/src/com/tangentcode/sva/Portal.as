package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Portal extends Powered
	{
		override public function imgClass():Class 
		{
			return SvA.ImgPortal;
		}
		
		
		public function Portal(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgPortal, true, true, SvA.CellW, SvA.CellH);
			solid = false;
		}
		
	}

}