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
		[Embed(source="../../../../assets/mapCSV_AlienShip_GeistWall.csv", mimeType="application/octet-stream")] public var CSV_GeistWall:Class;
		[Embed(source="../../../../assets/images/geistwall.png")] public var Img_GeistWall:Class;

		//Tilemaps
		public var layerOutside:FlxTilemap;
		public var layerEnvironment:FlxTilemap;
		public var layerDecorations:FlxTilemap;
		public var layerGeistWall:FlxTilemap;

		//Sprites
		public var MobilesGroup:FlxGroup = new FlxGroup;
		public var MachineryGroup:FlxGroup = new FlxGroup;

		//Shapes
		public var NarrationGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_AlienShip(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( null );
			layerOutside = addTilemap( CSV_Outside, Img_Outside, -400.000, -500.000, 40, 50, 0.250, 0.250, false, 100, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerEnvironment = addTilemap( CSV_Environment, Img_Environment, -32.000, 160.000, 16, 20, 1.000, 1.000, false, 16, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerDecorations = addTilemap( CSV_Decorations, Img_Decorations, 0.000, 0.000, 16, 20, 1.000, 1.000, false, 50, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerGeistWall = addTilemap( CSV_GeistWall, Img_GeistWall, -32.000, 80.000, 16, 20, 1.000, 1.000, false, 1, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerOutside);
			masterLayer.add(layerEnvironment);
			masterLayer.add(MobilesGroup);
			masterLayer.add(MachineryGroup);
			masterLayer.add(layerDecorations);
			masterLayer.add(layerGeistWall);
			masterLayer.add(NarrationGroup);

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = -32;
			boundsMinY = 0;
			boundsMaxX = 3840;
			boundsMaxY = 1660;
			bgColor = 0xff000000;
		}

		override public function createObjects(onAddCallback:Function = null):void
		{
			addShapesForLayerNarration(onAddCallback);
			addSpritesForLayerMobiles(onAddCallback);
			addSpritesForLayerMachinery(onAddCallback);
			generateObjectLinks(onAddCallback);
			FlxG.state.add(masterLayer);
		}

		public function addShapesForLayerNarration(onAddCallback:Function = null):void
		{
			var obj:Object;

			callbackNewData(new TextData(464.000, 1320.000, 80.000, 100.000, 0.000, "When I come to, the Dentists are dead. Good riddance.\rI can see my ship outside. Now's my chance to escape!","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(560.000, 1320.000, 64.000, 60.000, 0.000, "This is a portal.\rIt's locked from the other side.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(384.000, 1380.000, 64.000, 60.000, 0.000, "This is a Portal.\rI can grab it to teleport to the other side.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(528.000, 1280.000, 80.000, 30.000, 0.000, "I can see my spaceship docked outside.\rI call her the Consolas. Isn't she a beauty?","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(400.000, 1280.000, 80.000, 30.000, 0.000, "I can see the airlock leading to my ship.\rBut how am I supposed to get in there?","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(304.000, 1360.000, 64.000, 100.000, 0.000, "Arnaxian gut spiders. They can't hurt me.\rLooks like the Dentists trapped them all in here.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(96.000, 1320.000, 48.000, 60.000, 0.000, "The Dentists blockaded the hallway.\rI'll have to drag those boxes out of the way.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(272.000, 920.000, 48.000, 60.000, 0.000, "Those heart-shaped things are medical equipment.\rThey'll come in handy if I get injured.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(320.000, 1140.000, 48.000, 100.000, 0.000, "This portal is controlled by a lock on the other side.\rI'll need a key to turn it back on.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(96.000, 1260.000, 48.000, 60.000, 0.000, "Uh-oh. More Dentists, and they don't look happy.\rI'd better find some kind of weapon.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(496.000, 800.000, 80.000, 60.000, 0.000, "I can grab the switch to turn this portal on and off.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(544.000, 600.000, 144.000, 50.000, 0.000, "They've trapped the mimeogeist in some kind of cage.\rI should let the poor thing out.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(704.000, 600.000, 64.000, 50.000, 0.000, "What the heck? Is that...?\rWhat are Dentists doing with a mimeogeist?!","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(816.000, 800.000, 64.000, 60.000, 0.000, "The switch is on the other side of the wall.\rHow am I supposed to turn this portal on?","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(976.000, 800.000, 64.000, 60.000, 0.000, "Laser cannons! Now we're talking. I can grab\rthem from any side to fire in the opposite direction.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(1120.000, 1040.000, 160.000, 60.000, 0.000, "I see more laser cannons through the window.\rBut how can I get past those Dentists?","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(976.000, 1280.000, 100.000, 50.000, 0.000, "The keys are stored in a room with no doors.\rWhy would they do that? HOW did they do that? ","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
			callbackNewData(new TextData(848.000, 1320.000, 64.000, 100.000, 0.000, "I think this portal leads back to where I started.\rI'll need a key to turn it on.","system", 8, 0xffffff, "center"), onAddCallback, NarrationGroup, generateProperties( null ), 1, 1 ) ;
		}

		public function addSpritesForLayerMobiles(onAddCallback:Function = null):void
		{
			addSpriteToLayer(null, Hero, MobilesGroup , 496.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Hero"
			addSpriteToLayer(null, Spider, MobilesGroup , 432.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 1240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 1240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 128.000, 1240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 912.000, 1300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 928.000, 1300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 912.000, 1320.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 928.000, 1320.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 352.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
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
			addSpriteToLayer(null, Box, MobilesGroup , 1424.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1440.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
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
			addSpriteToLayer(null, Alien, MobilesGroup , 624.000, 620.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 704.000, 500.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 768.000, 500.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 384.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 64.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Spider, MobilesGroup , 288.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 960.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 192.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 96.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 48.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 144.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 240.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Geist, MobilesGroup , 592.000, 480.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Geist"
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
			addSpriteToLayer(null, Spider, MobilesGroup , 1104.000, 900.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1104.000, 740.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Box, MobilesGroup , 1296.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1280.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 1420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 1100.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1328.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1296.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1280.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 1360.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1296.000, 1100.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Alien, MobilesGroup , 1280.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1312.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1344.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Key, MobilesGroup , 1008.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Key"
			addSpriteToLayer(null, Key, MobilesGroup , 1040.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Key"
			addSpriteToLayer(null, Box, MobilesGroup , 112.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 80.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 96.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 352.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 368.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 336.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Heart, MobilesGroup , 192.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Alien, MobilesGroup , 64.000, 1080.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 64.000, 1180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 256.000, 1220.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Spider, MobilesGroup , 96.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Heart, MobilesGroup , 864.000, 420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Key, MobilesGroup , 576.000, 620.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Key"
			addSpriteToLayer(null, Heart, MobilesGroup , 848.000, 420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Alien, MobilesGroup , 1248.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Box, MobilesGroup , 1376.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1376.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1360.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1344.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1328.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1312.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1264.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1184.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1168.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1152.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1248.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1232.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1216.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1200.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1184.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1168.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1152.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1136.000, 880.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1136.000, 760.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 720.000, 660.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 736.000, 660.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Spider, MobilesGroup , 672.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 784.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 720.000, 740.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 736.000, 700.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 352.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Heart, MobilesGroup , 272.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Heart, MobilesGroup , 1360.000, 1140.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Heart, MobilesGroup , 1376.000, 1120.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Heart, MobilesGroup , 1392.000, 1140.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Heart"
			addSpriteToLayer(null, Spider, MobilesGroup , 1392.000, 1300.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1248.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1280.000, 1440.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1392.000, 1260.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1440.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Box, MobilesGroup , 1376.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1392.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1408.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1376.000, 1220.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1376.000, 1180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MobilesGroup , 1376.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Alien, MobilesGroup , 1344.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 1360.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Spider, MobilesGroup , 1392.000, 900.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1392.000, 740.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1376.000, 1140.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 1056.000, 1180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
		}

		public function addSpritesForLayerMachinery(onAddCallback:Function = null):void
		{
			linkedObjectDictionary[8] = addSpriteToLayer(null, KeyBox, MachineryGroup , 464.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"KeyBox"
			addSpriteToLayer(null, Exit, MachineryGroup , 432.000, 1160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Exit"
			addSpriteToLayer(null, HeroShip, MachineryGroup , 464.000, 1040.000, 270.200, 1, 1, false, 3.000, 2.800, generateProperties( null ), onAddCallback );//"HeroShip"
			linkedObjectDictionary[0] = addSpriteToLayer(null, Portal, MachineryGroup , 400.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			linkedObjectDictionary[1] = addSpriteToLayer(null, Portal, MachineryGroup , 336.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			linkedObjectDictionary[4] = addSpriteToLayer(null, Portal, MachineryGroup , 1056.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			linkedObjectDictionary[5] = addSpriteToLayer(null, Portal, MachineryGroup , 1120.000, 1400.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1136.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Cannon"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1120.000, 860.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Cannon"
			linkedObjectDictionary[9] = addSpriteToLayer(null, KeyBox, MachineryGroup , 864.000, 1380.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"KeyBox"
			linkedObjectDictionary[2] = addSpriteToLayer(null, Portal, MachineryGroup , 336.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[3] = addSpriteToLayer(null, Portal, MachineryGroup , 400.000, 1200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[6] = addSpriteToLayer(null, Portal, MachineryGroup , 592.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[7] = addSpriteToLayer(null, Portal, MachineryGroup , 864.000, 1340.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1120.000, 780.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Cannon"
			linkedObjectDictionary[11] = addSpriteToLayer(null, Portal, MachineryGroup , 832.000, 420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[10] = addSpriteToLayer(null, KeyBox, MachineryGroup , 880.000, 420.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"KeyBox"
			linkedObjectDictionary[12] = addSpriteToLayer(null, Portal, MachineryGroup , 608.000, 460.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1136.000, 1220.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Cannon"
			addSpriteToLayer(null, Cannon, MachineryGroup , 1136.000, 1180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Cannon"
			linkedObjectDictionary[14] = addSpriteToLayer(null, Portal, MachineryGroup , 544.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[15] = addSpriteToLayer(null, Portal, MachineryGroup , 608.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[18] = addSpriteToLayer(null, Portal, MachineryGroup , 848.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[17] = addSpriteToLayer(null, Portal, MachineryGroup , 912.000, 820.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:false }, null ), onAddCallback );//"Portal - noPower"
			linkedObjectDictionary[13] = addSpriteToLayer(null, SwitchBox, MachineryGroup , 528.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"SwitchBox"
			linkedObjectDictionary[16] = addSpriteToLayer(null, SwitchBox, MachineryGroup , 928.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"SwitchBox"
			addSpriteToLayer(null, Box, MachineryGroup , 80.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 112.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 112.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 80.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 336.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 368.000, 840.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 368.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
			addSpriteToLayer(null, Box, MachineryGroup , 336.000, 800.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( null ), onAddCallback );//"Box"
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
			createLink(linkedObjectDictionary[10], linkedObjectDictionary[11], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[10], linkedObjectDictionary[12], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[12], linkedObjectDictionary[11], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[13], linkedObjectDictionary[14], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[13], linkedObjectDictionary[15], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[16], linkedObjectDictionary[17], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[16], linkedObjectDictionary[18], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[14], linkedObjectDictionary[15], onAddCallback, generateProperties( null ) );
			createLink(linkedObjectDictionary[18], linkedObjectDictionary[17], onAddCallback, generateProperties( null ) );
		}

	}
}
