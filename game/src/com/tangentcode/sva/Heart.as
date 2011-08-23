package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Heart extends Pickup 
	{
		
		public function Heart(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgHeart, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}