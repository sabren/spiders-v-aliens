package com.tangentcode.sva 
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Michal J Wallace
	 */
	public class DeathState extends FlxState 
	{
		
		override public function create():void
		{
			var t:FlxText;
			t = new FlxText(0,FlxG.height/2-10,FlxG.width,"GAME OVER");
			t.size = 16;
			t.alignment = "center";
			add(t);
			
			t = new FlxText(0,FlxG.height-20,FlxG.width,"press space to restart.");
			t.size = 14;
			t.alignment = "center";
			add(t);
		}

		override public function update():void
		{
			super.update();
			if(FlxG.keys.SPACE)
			{
				FlxG.switchState(new MenuState());
			}
		}

	}

}