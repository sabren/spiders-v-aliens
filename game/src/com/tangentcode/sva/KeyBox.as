package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class KeyBox extends Machine 
	{

		override public function imgClass():Class
		{
			return SvA.ImgKeyBox;
		}
		override public function startPowered():Boolean 
		{
			return false;
		}
		
		public function KeyBox(x:Number=0, y:Number=0) 
		{
			super(x, y);			
		}
		
		override public function activate(direction:int, byWhom:FlxSprite=null):FlxSprite 
		{
			return null;
		}
		
	}

}