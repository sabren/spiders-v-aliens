package com.tangentcode.sva
{
	import org.flixel.*;

	public class Opening01State extends BaseState
	{
		
		override public function create():void
		{
			var bottom:Number = FlxG.height;
			
			var img:FlxSprite = new FlxSprite((640 - 270) / 2, 64, SvA.ImgOpening01);
			add(img);
			
			addType(32, bottom - 120, 12,
				"The Dentists grabbed me outside the Rushmore spaceport.\n" +
				"They had me on their table. I should have been a dead man.\n" +
				"\n" +
				"But then...");
			addText(bottom - 20, 14, "press space to continue.", 0xffffffff);
		}
		
		override public function update():void
		{
			super.update();
			if(FlxG.keys.justPressed("SPACE"))
			{
				FlxG.switchState(new Opening02State());
			}
		}
	}

}

