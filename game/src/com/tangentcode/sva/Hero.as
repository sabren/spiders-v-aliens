package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Hero extends Avatar 
	{		
		
		public var wasHurt:Boolean = false;
		public const maxHealth:Number = 5;
		
		public var stunLength:Number = 2.5; // seconds
		public var stunCount:Number = 0;
		
		public function Hero(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgHero, true, true, SvA.CellW, SvA.CellH);
			this.health = maxHealth;			
		}
		
		override public function hurt(Damage:Number):void 
		{
			this.stunCount = stunLength;
			this.wasHurt = true;
			super.hurt(Damage);
			if (! this.alive)
			{
				FlxG.switchState(new DeathState());
			}
		}
		
		override public function update():void 
		{
			super.update();
			if (stunCount > 0)
				stunCount -= FlxG.elapsed;
			if (stunCount < 0)
				stunCount = 0;
		}
				
	}

}