//Code generated with DAME. http://www.dambots.com

package com.tangentcode.sva.dame
{
	import org.flixel.*;
	// Custom imports:
import com.tangentcode.sva.*;
	public class Level_AlienShip extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../../../../assets/mapCSV_AlienShip_Outside.csv", mimeType="application/octet-stream")] public var CSV_Outside:Class;
		[Embed(source="../../../../assets/images/startiles.png")] public var Img_Outside:Class;
		[Embed(source="../../../../assets/mapCSV_AlienShip_Environment.csv", mimeType="application/octet-stream")] public var CSV_Environment:Class;
		[Embed(source="../../../../assets/images/environment.png")] public var Img_Environment:Class;
		[Embed(source="../../../../assets/mapCSV_AlienShip_Decorations.csv", mimeType="application/octet-stream")] public var CSV_Decorations:Class;
		[Embed(source="../../../../assets/images/railings.png")] public var Img_Decorations:Class;

		//Tilemaps
		public var layerOutside:FlxTilemap;
		public var layerEnvironment:FlxTilemap;
		public var layerDecorations:FlxTilemap;

		//Sprites
		public var MobilesGroup:FlxGroup = new FlxGroup;
		public var MachineryGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_AlienShip(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( null );
			layerOutside = addTilemap( CSV_Outside, Img_Outside, -400.000, -500.000, 40, 50, 0.250, 0.250, false, 100, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerEnvironment = addTilemap( CSV_Environment, Img_Environment, 0.000, 0.000, 16, 20, 1.000, 1.000, false, 16, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerDecorations = addTilemap( CSV_Decorations, Img_Decorations, 0.000, 0.000, 16, 20, 1.000, 1.000, false, 50, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerOutside);
			masterLayer.add(layerEnvironment);
			masterLayer.add(MobilesGroup);
			masterLayer.add(MachineryGroup);
			masterLayer.add(layerDecorations);

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 3840;
			boundsMaxY = 1500;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null):void
		{
			addSpritesForLayerMobiles(onAddCallback);
			addSpritesForLayerMachinery(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addSpritesForLayerMobiles(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 1260.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 1260.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Hero, MobilesGroup , 496.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Spider, MobilesGroup , 432.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 1280.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 128.000, 1260.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 1280.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 128.000, 1280.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 1300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 1300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 128.000, 1300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 992.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1008.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1040.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1056.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 368.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 336.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 352.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 80.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1104.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1104.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1104.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1392.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1392.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1392.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1360.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1328.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1344.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1344.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1328.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1344.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Alien, MobilesGroup , 1376.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1184.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1280.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1232.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1328.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1216.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1184.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1248.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1184.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1248.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 864.000, 580.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 592.000, 580.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 720.000, 500.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 736.000, 500.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 928.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 528.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 352.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Spider, MobilesGroup , 288.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 240.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 192.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 144.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 96.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 48.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 48.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 96.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 144.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 192.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 240.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 288.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Avatar, MobilesGroup , 608.000, 460.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Avatar"
			addSpriteToLayer(null, Alien, MobilesGroup , 464.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:true }, null ), onAddCallback );//"Alien-Dead"
			addSpriteToLayer(null, Alien, MobilesGroup , 512.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:true }, null ), onAddCallback );//"Alien-Dead"
			addSpriteToLayer(null, Alien, MobilesGroup , 560.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:true }, null ), onAddCallback );//"Alien-Dead"
			addSpriteToLayer(null, Alien, MobilesGroup , 496.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:true }, null ), onAddCallback );//"Alien-Dead"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1120.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1136.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1152.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1168.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1184.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Spider, MobilesGroup , 1344.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1360.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Box, MobilesGroup , 1296.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1280.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 1120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1328.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1296.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1280.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1296.000, 1120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Alien, MobilesGroup , 1280.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1312.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1344.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1376.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1408.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Key, MobilesGroup , 928.000, 1320.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Key"
			addSpriteToLayer(null, Key, MobilesGroup , 992.000, 1320.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Key"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 80.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 80.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 336.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 352.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 368.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 368.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 336.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Heart, MobilesGroup , 208.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Alien, MobilesGroup , 64.000, 1080.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 64.000, 1180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 304.000, 1080.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Spider, MobilesGroup , 96.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Heart, MobilesGroup , 880.000, 440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
		}

		public function addSpritesForLayerMachinery(onAddCallback:Function = null):void
		{
			linkedObjectDictionary[8] = addSpriteToLayer(null, SwitchBox, MachineryGroup , 464.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"SwitchBox"
			addSpriteToLayer(null, Exit, MachineryGroup , 432.000, 1160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Exit"
			addSpriteToLayer(null, HeroShip, MachineryGroup , 464.000, 1040.000, 270.200, 1, 1, false, 3.000, 2.800, generateProperties( null ), onAddCallback );//"HeroShip"
			linkedObjectDictionary[0] = addSpriteToLayer(null, Portal, MachineryGroup , 400.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:1 }, { name:"portalTo", value:2 }, { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			linkedObjectDictionary[1] = addSpriteToLayer(null, Portal, MachineryGroup , 336.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:2 }, { name:"portalTo", value:1 }, { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			linkedObjectDictionary[4] = addSpriteToLayer(null, Portal, MachineryGroup , 1056.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:6 }, { name:"portalTo", value:0 }, { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			linkedObjectDictionary[5] = addSpriteToLayer(null, Portal, MachineryGroup , 1120.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:5 }, { name:"portalTo", value:0 }, { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			addSpriteToLayer(null, AvatarBox, MachineryGroup , 832.000, 440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"AvatarBox"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1136.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Cannon"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1120.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Cannon"
			linkedObjectDictionary[9] = addSpriteToLayer(null, SwitchBox, MachineryGroup , 864.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"SwitchBox"
			linkedObjectDictionary[2] = addSpriteToLayer(null, Portal, MachineryGroup , 336.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:3 }, { name:"portalTo", value:4 }, { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[3] = addSpriteToLayer(null, Portal, MachineryGroup , 400.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:4 }, { name:"portalTo", value:3 }, { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[6] = addSpriteToLayer(null, Portal, MachineryGroup , 592.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:8 }, { name:"portalTo", value:7 }, { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[7] = addSpriteToLayer(null, Portal, MachineryGroup , 864.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"portalId", value:7 }, { name:"portalTo", value:8 }, { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1120.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Cannon"
			addSpriteToLayer(null, Box, MachineryGroup , 1136.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1152.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1168.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1184.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1200.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1216.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1232.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1248.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1136.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1152.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1168.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1184.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1200.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1216.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1264.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1264.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1264.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1264.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1232.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1248.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1216.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1232.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1264.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1248.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1312.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1312.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1312.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1328.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1344.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1360.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1376.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 1376.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Alien, MachineryGroup , 1248.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
			createLink(linkedObjectDictionary[0], linkedObjectDictionary[1], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[2], linkedObjectDictionary[3], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[4], linkedObjectDictionary[5], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[6], linkedObjectDictionary[7], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[8], linkedObjectDictionary[3], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[8], linkedObjectDictionary[2], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[9], linkedObjectDictionary[7], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[9], linkedObjectDictionary[6], onAddCallback, generateProperties( null ) );
		}

	}
}
