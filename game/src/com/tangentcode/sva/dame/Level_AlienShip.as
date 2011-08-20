//Code generated with DAME. http://www.dambots.com

package com.tangentcode.sva.dame
{
	import org.flixel.*;
	// Custom imports:
import com.tangentcode.sva.*;
	public class Level_AlienShip extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../../../../assets/mapCSV_Ship_Environment.csv", mimeType="application/octet-stream")] public var CSV_ShipEnvironment:Class;
		[Embed(source="../../../../assets/images/environment.png")] public var Img_ShipEnvironment:Class;

		//Tilemaps
		public var layerShipEnvironment:FlxTilemap;

		//Sprites
		public var ShipLayer2Group:FlxGroup = new FlxGroup;


		public function Level_AlienShip(addToStage:Boolean = true, onAddSpritesCallback:Function = null)
		{
			// Generate maps.
			layerShipEnvironment = new FlxTilemap;
			layerShipEnvironment.loadMap( new CSV_ShipEnvironment, Img_ShipEnvironment, 16,20, FlxTilemap.OFF, 0, 1, 20 );
			layerShipEnvironment.x = 0.000000;
			layerShipEnvironment.y = 0.000000;
			layerShipEnvironment.scrollFactor.x = 1.000000;
			layerShipEnvironment.scrollFactor.y = 1.000000;

			//Add layers to the master group in correct order.
			masterLayer.add(layerShipEnvironment);
			masterLayer.add(ShipLayer2Group);


			if ( addToStage )
			{
				addSpritesForLayerShipLayer2(onAddSpritesCallback);
				FlxG.state.add(masterLayer);
			}

			mainLayer = layerShipEnvironment;

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 640;
			boundsMaxY = 500;

		}

		override public function addSpritesForLayerShipLayer2(onAddCallback:Function = null):void
		{
			addSpriteToLayer(Alien, ShipLayer2Group , 80.000, 120.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Exit, ShipLayer2Group , 560.000, 20.000, 0.000, false, 1, 1, onAddCallback );//"Exit"
			addSpriteToLayer(Box, ShipLayer2Group , 384.000, 340.000, 0.000, false, 1, 1, onAddCallback );//"Box"
			addSpriteToLayer(Box, ShipLayer2Group , 384.000, 340.000, 0.000, false, 1, 1, onAddCallback );//"Box"
			addSpriteToLayer(Box, ShipLayer2Group , 384.000, 360.000, 0.000, false, 1, 1, onAddCallback );//"Box"
			addSpriteToLayer(Box, ShipLayer2Group , 352.000, 340.000, 0.000, false, 1, 1, onAddCallback );//"Box"
			addSpriteToLayer(Box, ShipLayer2Group , 352.000, 360.000, 0.000, false, 1, 1, onAddCallback );//"Box"
			addSpriteToLayer(Hero, ShipLayer2Group , 496.000, 360.000, 0.000, false, 1, 1, onAddCallback );//"Hero"
			addSpriteToLayer(Alien, ShipLayer2Group , 480.000, 400.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Alien, ShipLayer2Group , 512.000, 400.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Alien, ShipLayer2Group , 480.000, 320.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Alien, ShipLayer2Group , 512.000, 320.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Alien, ShipLayer2Group , 496.000, 400.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Alien, ShipLayer2Group , 496.000, 320.000, 0.000, false, 1, 1, onAddCallback );//"Alien"
			addSpriteToLayer(Spider, ShipLayer2Group , 480.000, 360.000, 0.000, false, 1, 1, onAddCallback );//"Spider"
			addSpriteToLayer(Spider, ShipLayer2Group , 512.000, 360.000, 0.000, false, 1, 1, onAddCallback );//"Spider"
		}


	}
}
