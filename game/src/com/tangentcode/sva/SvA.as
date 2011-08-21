package com.tangentcode.sva 
{
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class SvA 
	{
		public static const CellW:int = 16;
		public static const CellH:int = 20;
		
		
		// sprite assets (hopefully in alphabetical order...)
		
		[Embed(source = "../../../assets/images/alien.png")]
		public static var ImgAlien:Class;
		
		[Embed(source = "../../../assets/images/avatar.png")]
		public static var ImgAvatar:Class;
		
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
		
		[Embed(source = "../../../assets/images/grabbers.png")]
		public static var ImgGrabbers:Class;
		
		[Embed(source = "../../../assets/images/heart.png")]
		public static var ImgHeart:Class;

		[Embed(source = "../../../assets/images/hero.png")]
		public static var ImgHero:Class;
		
		[Embed(source = "../../../assets/images/portal.png")]
		public static var ImgPortal:Class;
		
		[Embed(source = "../../../assets/images/railings.png")]
		public static var ImgRailings:Class;
		
		[Embed(source = "../../../assets/images/spider.png")]
		public static var ImgSpider:Class;
		
		[Embed(source = "../../../assets/images/switch.png")]
		public static var ImgSwitch:Class;
		
		[Embed(source = "../../../assets/images/tractor.png")]
		public static var ImgTractor:Class;
		
		[Embed(source = "../../../assets/images/trap.png")]
		public static var ImgTrap:Class;
		
		public function SvA() 
		{
		}
		
		public static function assert(expression:Boolean):void
		{
			if (!expression) throw new Error("Assertion failed!");
		}
	}

}