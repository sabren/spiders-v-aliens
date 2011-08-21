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
		
		public function Grabber(direction:int, X:Number=0, Y:Number=0)
		{
			super(X, Y);
			loadGraphic(SvA.ImgGrabbers, true, true, SvA.CellW, SvA.CellH);
			
			this.frame = direction;
			if (direction == SvA.N || direction == SvA.S)
			{
				this.height = 4;
				this.width = 12;
			}
			else
			{
				this.width = 4;
				this.height = 12;
			}
			this.centerOffsets();
		}
		
		
		public function reposition():void
		{
			SvA.position(this, this.frame, this.owner, 2);
			if (content && this.exists)
				this.owner.velocity.copyTo(this.content.velocity);
		}
		
		public function grab(thing:FlxSprite):void
		{
			this.content = thing;
			this.reposition();

		}
		
		
		public static function makeGrabbers(forWhom:FlxSprite, group:FlxGroup):Array
		{
			var g:Grabber;
			var res:Array = new Array();
			for (var i:int = 0; i < 4; ++i)
			{
				g = res[i] = new Grabber(i, 0, 0);
				g.owner = forWhom;
				group.add(g);
			}
			return res;
		}
		
	}

}