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
		
		[Embed(source = "../../../assets/images/hero.png")]
		public static var ImgHero:Class;
		
		[Embed(source = "../../../assets/images/alien-w.png")]
		public static var ImgAlien:Class;
		
		[Embed(source = "../../../assets/images/spider.png")]
		public static var ImgSpider:Class;
		
		[Embed(source = "../../../assets/images/box.png")]
		public static var ImgBox:Class;
		
		[Embed(source = "../../../assets/images/exit.png")]
		public static var ImgExit:Class;
				
		public function SvA() 
		{
			
		}
		
		public static function assert(expression:Boolean):void
		{
			if (!expression) throw new Error("Assertion failed!");
		}
	}

}