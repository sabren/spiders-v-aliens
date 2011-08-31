package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class SvA 
	{
		public static const CellW:int = 16;
		public static const CellH:int = 20;
		
		public static const N:int = 0;
		public static const S:int = 1;
		public static const W:int = 2;
		public static const E:int = 3;
		
		public static const ON:int = 1;
		public static const OFF:int = 0;
		
		
		// sprite assets (hopefully in alphabetical order...)
		
		[Embed(source = "../../../assets/images/alien.png")]
		public static var ImgAlien:Class;
		
		[Embed(source = "../../../assets/images/avatarbox.png")]
		public static var ImgAvatarBox:Class;
		
		[Embed(source = "../../../assets/images/box.png")]
		public static var ImgBox:Class;
		
		[Embed(source = "../../../assets/images/bullet.png")]
		public static var ImgBullet:Class;
		
		[Embed(source = "../../../assets/images/cannon.png")]
		public static var ImgCannon:Class;
		
		[Embed(source = "../../../assets/images/checkpoint.png")]
		public static var ImgCheckpoint:Class;
		
		[Embed(source = "../../../assets/images/exit.png")]
		public static var ImgExit:Class;
		
		[Embed(source = "../../../assets/images/geist.png")]
		public static var ImgGeist:Class;
		
		[Embed(source = "../../../assets/images/grabbers.png")]
		public static var ImgGrabbers:Class;
		
		[Embed(source = "../../../assets/images/heart.png")]
		public static var ImgHeart:Class;
		
		[Embed(source = "../../../assets/images/heartbox.png")]
		public static var ImgHeartBox:Class;
		
		[Embed(source = "../../../assets/images/hero.png")]
		public static var ImgHero:Class;
		
		[Embed(source = "../../../assets/images/key.png")]
		public static var ImgKey:Class;
		
		[Embed(source = "../../../assets/images/keybox.png")]
		public static var ImgKeyBox:Class;		
		
		[Embed(source = "../../../assets/images/ship.png")]
		public static var ImgHeroShip:Class;
		
		[Embed(source = "../../../assets/images/opening-01.png")]
		public static var ImgOpening01:Class;
		
		[Embed(source = "../../../assets/images/opening-02.png")]
		public static var ImgOpening02:Class;
		
		[Embed(source = "../../../assets/images/portal.png")]
		public static var ImgPortal:Class;
		
		[Embed(source = "../../../assets/images/railings.png")]
		public static var ImgRailings:Class;
		
		[Embed(source = "../../../assets/images/spider.png")]
		public static var ImgSpider:Class;
		
		[Embed(source = "../../../assets/images/switchbox.png")]
		public static var ImgSwitchBox:Class;
		
		[Embed(source = "../../../assets/images/tractor.png")]
		public static var ImgTractor:Class;
		
		[Embed(source = "../../../assets/images/trap.png")]
		public static var ImgTrap:Class;
		
		
		// music
		[Embed(source = "../../../assets/sounds/sva-music.mp3")]
		public static var SndMusic:Class;
		
				
		public static function assert(expression:Boolean):void
		{
			if (!expression) throw new Error("Assertion failed!");
		}
		
		public static function sgn(a:Number):int
		{
			if (a < 0) return -1;
			if (a > 0) return 1;
			return 0;
		}

		public static function position(what:FlxSprite, direction:int, relativeTo:FlxSprite):void
		{
			var cx:Number = relativeTo.x + relativeTo.width / 2 - what.width / 2;
			var cy:Number = relativeTo.y + relativeTo.height / 2 - what.height / 2;
			
			switch (direction)
			{
				case SvA.N:
					moveTo(what, cx, relativeTo.y - what.height);
					break;
				case SvA.S:
					moveTo(what, cx, relativeTo.y + relativeTo.height);
					break;
				case SvA.W:
					moveTo(what, relativeTo.x - what.width, cy);
					break;
				case SvA.E:
					moveTo(what, relativeTo.x + relativeTo.width, cy);
					break;
				default:
					break;
			}
			
		}

		/**
		 * Move object without screwing up velocity.
		 * Like what.reset(), but only for location.
		 * @param	what
		 * @param	x
		 * @param	y
		 */
		public static function moveTo(what:FlxSprite, x:Number, y:Number):void
		{
			what.x = x;
			what.y = y;
			what.last.x = x;
			what.last.y = y;
		}
		
		public static function across(dir:int):int
		{
			switch(dir)
			{
				case SvA.N: return SvA.S;
				case SvA.W: return SvA.E;
				case SvA.S: return SvA.N;
				case SvA.E: return SvA.W;
				default: return dir;
			}
		}
		
	}

}