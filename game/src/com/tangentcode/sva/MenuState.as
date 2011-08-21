package com.tangentcode.sva
{
	import org.flixel.*;

	public class MenuState extends FlxState
	{
		
		private function addText(y:Number, size:int, text:String, color:uint=0xffcccccc):void
		{
			var t:FlxText = new FlxText(0, y, FlxG.width, text);
			t.size = size;
			t.color = color;
			t.alignment = "center";
			add(t);
		}
		
		override public function create():void
		{
			var cy:Number = FlxG.height / 2;
			addText(cy-70, 12, "Howie Goldsmile, Attorney at Law");
			addText(cy-50, 12, "in:");
			addText(cy-30, 16, "Spiders v. Aliens", 0xffffffff);

			addText(cy+10, 12, "use arrow keys to move");
			addText(cy+30, 12, "[WASD] or [,AOE] to interact");
			
			addText(FlxG.height - 20, 14, "press space to begin.", 0xffffffff);
		}
		
		override public function update():void
		{
			super.update();
			if(FlxG.keys.SPACE)
			{
				FlxG.switchState(new PlayState());
			}
		}
	}

}

