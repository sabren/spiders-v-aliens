package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Bullet extends FlxSprite 
	{
		
		public function Bullet(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgBullet, true, true, SvA.CellW, SvA.CellH);
		}
		
		override public function update():void 
		{
			super.update();
		}
		
	}

}