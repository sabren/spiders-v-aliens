package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Key extends FlxSprite 
	{
		
		public function Key(x:Number=0, y:Number=0) 
		{
			super(x, y);
			loadGraphic(SvA.ImgKey, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}