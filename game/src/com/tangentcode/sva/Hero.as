package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Hero extends FlxSprite 
	{		
		
		public var wasHurt:Boolean = false;
		public const maxHealth:Number = 4;
		
		private var mGrabbers:Array;
		public var grabbers:FlxGroup = new FlxGroup();
		public var stunCount:int = 0;
		
		public function Hero(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgHero, true, true, SvA.CellW, SvA.CellH);
			
			width = SvA.CellW;
			height = SvA.CellH;
			
			this.health = maxHealth;
			
			this.maxVelocity.x = 100;
			this.maxVelocity.y = 100;
			this.drag.x = 750;
			this.drag.y = 750;
			
			mGrabbers = Grabber.makeGrabbers(this, this.grabbers);
		}
		
		override public function hurt(Damage:Number):void 
		{
			this.stunCount = 12;
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
				stunCount--;
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
		
		public function grab(direction:int, cond:Boolean):Boolean
		{
			var g:Grabber = this.mGrabbers[direction] as Grabber;
			g.exists = cond;
			if (!cond) { g.content = null; }
			return cond;
		}
		
	}

}