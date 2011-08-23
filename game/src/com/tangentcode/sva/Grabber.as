package com.tangentcode.sva 
{
	import org.flixel.*;
	
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
		
		/**
		 * am I done grabbing for this frame?
		 * (prevents portal loops)
		 */
		public var done:Boolean = false;	
		
		public function Grabber(direction:int, X:Number=0, Y:Number=0)
		{
			super(X, Y);
			loadGraphic(SvA.ImgGrabbers, true, true, SvA.CellW, SvA.CellH);
			
			this.frame = direction;
		}
		
		
		public function reposition():void
		{
			var oldx:Number = x;
			var oldy:Number = y;
			SvA.position(this, this.frame, this.owner);
			// content may be null OR it may have disappeared (ex: a key into a lock)
			if (content && content.exists)
			{
				SvA.moveTo(content, content.x + x - oldx, content.y + y - oldy);		  
			}
		}
		
		public function grab(thing:FlxSprite):void
		{
			if (thing == null)
			{
				// release the captive:
				if (content is Capturable) { (content as Capturable).captive = false; }
				// sling effect:
				if (content != null) { content.velocity.copyFrom(owner.velocity); }
			}
			else
			{
				if (thing is Capturable) { (thing as Capturable).captive = true; }
			}
			content = thing;
		}
		
		
		public static function makeGrabbers(forWhom:FlxSprite, group:FlxGroup):Array
		{
			var g:Grabber;
			var res:Array = new Array();
			for (var i:int = 0; i < 4; ++i)
			{
				g = res[i] = new Grabber(i, 0, 0);
				g.owner = forWhom;
				SvA.position(g, i, forWhom);
				group.add(g);
			}
			return res;
		}
		
	}

}