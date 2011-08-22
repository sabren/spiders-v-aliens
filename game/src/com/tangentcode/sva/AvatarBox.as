package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class AvatarBox extends Machine 
	{
		override public function imgClass():Class { return SvA.ImgHeartBox; }
	
		public function AvatarBox(x:Number=0, y:Number=0) 
		{
			super(x, y);
			this.contentClass = Avatar;
		}
		
	}
}