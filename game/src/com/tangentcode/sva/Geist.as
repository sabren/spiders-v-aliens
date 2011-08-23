package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Geist extends Avatar 
	{		
		public function Geist(X:Number=0, Y:Number=0) 
		{
			super(X, Y);
			loadGraphic(SvA.ImgGeist, true, true, SvA.CellW, SvA.CellH);

			this.solid = false;
		}
		
	}

}