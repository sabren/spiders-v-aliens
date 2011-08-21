package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Box extends FlxSprite 
	{
		
		public function Box(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgBox, true, true, SvA.CellW, SvA.CellH);
			this.solid = true;
			this.drag.x = 150;
			this.drag.y = 150;
		}
		
	}

}