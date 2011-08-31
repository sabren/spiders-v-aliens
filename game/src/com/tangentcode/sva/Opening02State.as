package com.tangentcode.sva
{
	import org.flixel.*;

	public class Opening02State extends BaseState
	{
		
		override public function create():void
		{
			var bottom:Number = FlxG.height;
			
			var img:FlxSprite = new FlxSprite((640 - 270) / 2, 64, SvA.ImgOpening02);
			add(img);
			
			addType(32, bottom - 120, 12,
				"Turns out Dentists don't much care for Arnaxian spider venom.\n" +
				"Gut spiders. Sick. All this time I thought it was acid reflux.\n" +
				"\n" +
				"I crack a smile as the anesthesia finally takes control.\n" +
				"The world goes dark...");
			
			addText(bottom - 20, 14, "press space to continue.", 0xffffffff);
		}
		
		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new PlayState());
			}
		}
	}

}

