package com.tangentcode.sva 
{
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Powered extends FlxSprite 
	{
		/**
		 * time (in frames) to recycle
		 */
		public var rebootLength:int = 12;
		public var rebootCount:int = 0;
		public var hasPower:Boolean;
		
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
				if (rebootCount-- == 0)
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
		}
		
		public function cutPower():void
		{
			this.hasPower = false;
			this.frame = 0;
		}
		
		public function reboot():void
		{
			cutPower();
			this.rebootCount = this.rebootLength;
		}
		
	}

}