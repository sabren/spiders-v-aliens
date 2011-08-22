package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Capturable extends FlxSprite 
	{
		
		public var captive:Boolean = false;
		
		public function Capturable(x:Number=0, y:Number=0) 
		{
			super(x, y);	
		}
		
	}

}