package com.tangentcode.sva
{
	import flash.events.Event;
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="com.tangentcode.sva.Preloader")]

	public class EscapeGame extends FlxGame
	{
		public function EscapeGame()
		{
			super(640, 480, MenuState, 1.0);
//			super(640, 480, DeathState, 1.0);
		}
		
		
		// disable pause for screenshots :)
		// http://producerism.com/blog/how-to-disable-automatic-pausing-in-flixel-2-5/
		 override protected function create(FlashEvent:Event):void
        {
            super.create(FlashEvent);
            stage.removeEventListener(Event.DEACTIVATE, onFocusLost);
            stage.removeEventListener(Event.ACTIVATE, onFocus);
        }
	}	
}
