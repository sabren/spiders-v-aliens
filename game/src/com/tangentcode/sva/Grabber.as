package com.tangentcode.sva 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Grabber extends FlxSprite 
	{
		public static const kNFrame:int = 0;
		public static const kSFrame:int = 1;
		public static const kWFrame:int = 2;
		public static const kEFrame:int = 3;
		
		public var owner:FlxSprite;
		public var content:FlxSprite;
		
		public function Grabber(X:Number=0, Y:Number=0)
		{
			super(X, Y);
			loadGraphic(SvA.ImgGrabbers, true, true, SvA.CellW, SvA.CellH);
		}
		
		
		override public function update():void
		{
			super.update();
			this.x = owner.x;
			this.y = owner.y;
			
			switch (this.frame)
			{
				case kNFrame:
					this.y = owner.y - this.height;
					break;
				case kSFrame:
					this.y = owner.y + owner.height;
					break;
				case kWFrame:
					this.x = owner.x - this.width;
					break;
				case kEFrame:
					this.x = owner.x + owner.width;
					break;
				default:
					break;
			}
			
			if (this.content != null)
			{
				this.content.x = this.x;
				this.content.y = this.y;
				
				// and for when we let go:
				this.owner.velocity.copyTo(this.content.velocity);
			}
			
		}
		
		
		public static function makeGrabbers(forWhom:FlxSprite, group:FlxGroup):Array
		{
			var g:Grabber;
			var res:Array = new Array();
			for (var i:int = 0; i < 4; ++i)
			{
				g = res[i] = new Grabber(0, 0);
				g.owner = forWhom;
				g.frame = i;
				group.add(g);
			}
			return res;
		}
		
	}

}