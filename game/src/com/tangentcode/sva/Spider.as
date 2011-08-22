package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Spider extends Capturable 
	{
		
		
		public function Spider(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			loadGraphic(SvA.ImgSpider, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}