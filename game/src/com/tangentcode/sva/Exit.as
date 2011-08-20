package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Exit extends FlxSprite 
	{
		
		public function Exit(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgExit, true, true, SvA.CellW, SvA.CellH);
			
		}
		
	}

}