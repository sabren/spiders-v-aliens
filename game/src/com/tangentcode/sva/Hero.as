package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Hero extends FlxSprite 
	{		
		public function Hero(X:Number=0, Y:Number=0, SimpleGraphic:Class=null) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgHero, true, true, SvA.CellW, SvA.CellH);
			
			width = SvA.CellW;
			height = SvA.CellH;
			this.maxVelocity.x = 300;
			this.maxVelocity.y = 300;
			this.drag.x = 500;
			this.drag.y = 500;
		}
		
		public function moveN():void
		{
			this.acceleration.y = -200;
		}
		public function moveE():void
		{
			this.acceleration.x = 200;
		}
		public function moveS():void
		{
			this.acceleration.y = 200;
		}
		public function moveW():void
		{
			this.acceleration.x = -200;
		}
		
	}

}