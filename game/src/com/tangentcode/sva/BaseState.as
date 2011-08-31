package com.tangentcode.sva
{
	import com.tangentcode.TeleType;
	import org.flixel.*;

	public class BaseState extends FlxState
	{
		
		protected function addText(y:Number, size:int, text:String, color:uint=0xffcccccc):void
		{
			var t:FlxText = new FlxText(0, y, FlxG.width, text);
			t.size = size;
			t.color = color;
			t.alignment = "center";
			add(t);
		}
		
		protected function addType(x:Number, y:Number, size:int, text:String, color:uint=0xffcccccc):void
		{
			var t:TeleType = new TeleType(x, y, FlxG.width, text);
			t.size = size;
			t.color = color;
			add(t);
		}
		
	}

}

