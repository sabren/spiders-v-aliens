package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Avatar extends FlxSprite 
	{
		
		public function Avatar(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgAvatar, true, true, SvA.CellW, SvA.CellH);
		}
		
	}

}