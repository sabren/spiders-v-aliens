package com.tangentcode.sva
{
	import org.flixel.*;
	[SWF(width="640", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="com.tangentcode.sva.Preloader")]

	public class EscapeGame extends FlxGame
	{
		public function EscapeGame()
		{
			super(320,240,MenuState,2);
		}
	}	
}
