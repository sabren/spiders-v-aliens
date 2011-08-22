package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class SwitchBox extends Machine 
	{

		override public function imgClass():Class
		{
			return SvA.ImgSwitch;
		}
		override public function startPowered():Boolean 
		{
			return false;
		}
		
		public function SwitchBox(x:Number=0, y:Number=0) 
		{
			super(x, y);			
		}
		
		override public function activate(direction:int, byWhom:FlxSprite=null):FlxSprite 
		{
			hasPower ? cutPower() : addPower();
			return null;
		}
		
	}

}