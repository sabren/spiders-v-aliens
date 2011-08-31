package com.tangentcode.sva
{
	import org.flixel.*;

	public class MenuState extends BaseState
	{
		
		override public function create():void
		{
			var cy:Number = FlxG.height / 2;
			addText(cy - 70, 12, "Ernie Goldsmile, Attorney at Law");
			addText(cy-50, 12, "in:");
			addText(cy - 30, 16, "Spiders v. Aliens", 0xffffffff);
			
			addText(cy + 10, 12, "Use arrow keys to move,");
			addText(cy + 30, 12, "[WASD] or [,AOE] grab and drag objects");
			
			addText(FlxG.height - 20, 14, "press space to begin.", 0xffffffff);
		}
		
		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new Opening01State());
			}
		}
	}

}
