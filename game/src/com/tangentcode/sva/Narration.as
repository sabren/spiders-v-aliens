package com.tangentcode.sva 
{
	import com.tangentcode.sva.dame.TextData;
	import org.flixel.FlxSprite;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class Narration extends FlxSprite 
	{
		public var text:String;
		
		public function Narration(t:TextData) 
		{
			super(t.x, t.y);
			makeGraphic(t.width, t.height, 0x99ff99cc);
			this.text = t.text;
		}
		
	}

}