package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class HeartBox extends Machine 
	{
		override public function imgClass():Class { return SvA.ImgHeartBox; }
	
		public function HeartBox(x:Number=0, y:Number=0) 
		{
			super(x, y);
			this.contentClass = Heart;
		}
		
	}
}