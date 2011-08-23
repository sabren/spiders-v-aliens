package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Powered extends FlxSprite 
	{
		/**
		 * time (in seconds) to recycle
		 */
		public var rebootLength:Number = 0.5;
		public var rebootCount:Number = 0;
		public var hasPower:Boolean;
		
		public var sendPowerTo:Array = [];
		
		public function imgClass():Class { return ImgDefault; }
		public function startPowered():Boolean { return true; }		
		
		public function Powered(x:Number = 0, y:Number=0 ) 
		{
			super(x, y);
			loadGraphic(imgClass(), false, false, SvA.CellW, SvA.CellH);
			startPowered() ? addPower() : cutPower();
		}
		
		override public function update():void 
		{
			if (rebootCount > 0 && ! this.hasPower)
			{
				rebootCount -= FlxG.elapsed;
				if (rebootCount <= 0)
				{
					addPower();
				}
			}
			super.update();
		}
		
		public function addPower():void
		{
			this.hasPower = true;
			this.frame = 1;
			for each (var p:Powered in sendPowerTo)
			{
				p.addPower();
			}
		}
		
		public function cutPower():void
		{
			this.hasPower = false;
			this.frame = 0;
			for each (var p:Powered in sendPowerTo)
			{
				p.cutPower();
			}
		}
		
		public function reboot():void
		{
			cutPower();
			this.rebootCount = this.rebootLength;
		}
		
	}

}