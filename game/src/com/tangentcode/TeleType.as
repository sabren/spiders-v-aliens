package com.tangentcode 
{
	import org.flixel.FlxText;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class TeleType extends FlxText 
	{
		
		private var mFullText:String;
		private var mCounter:int = 0;
		private var mFinished:Boolean = false;
		
		public function TeleType(X:Number, Y:Number, Width:uint, Text:String=null, EmbeddedFont:Boolean=true) 
		{
			super(X, Y, Width, "", EmbeddedFont);
			this.fullText = Text;
		}
		
		override public function update():void 
		{
			super.update();
			if (!mFinished)
			{
				this.text = mFullText.substr(0, mCounter++);
				mFinished = mCounter > mFullText.length;
			}
		}
		
		public function set fullText(newText:String):void
		{
			this.text = "";
			mCounter = 0;
			mFullText = newText;
			mFinished = (mFullText.length == 0);
		}
	}

}