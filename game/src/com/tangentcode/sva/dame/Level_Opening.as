//Code generated with DAME. http://www.dambots.com

package com.tangentcode.sva.dame
{
	import org.flixel.*;
	// Custom imports:
import com.tangentcode.sva.*;
	public class Level_Opening extends BaseLevel
	{
		//Embedded media...
		[Embed(source="../../../../assets/mapCSV_Opening_Environment.csv", mimeType="application/octet-stream")] public var CSV_Environment:Class;
		[Embed(source="../../../../assets/images/environment.png")] public var Img_Environment:Class;
		[Embed(source="../../../../assets/mapCSV_Opening_Decorations.csv", mimeType="application/octet-stream")] public var CSV_Decorations:Class;
		[Embed(source="../../../../assets/images/railings.png")] public var Img_Decorations:Class;

		//Tilemaps
		public var layerEnvironment:FlxTilemap;
		public var layerDecorations:FlxTilemap;

		//Sprites
		public var MobilesGroup:FlxGroup = new FlxGroup;
		public var MachineryGroup:FlxGroup = new FlxGroup;

		//Properties


		public function Level_Opening(addToStage:Boolean = true, onAddCallback:Function = null)
		{
			// Generate maps.
			var properties:Array = [];

			properties = generateProperties( null );
			layerEnvironment = addTilemap( CSV_Environment, Img_Environment, 0.000, 0.000, 16, 20, 1.000, 1.000, false, 16, 1, properties, onAddCallback );
			properties = generateProperties( null );
			layerDecorations = addTilemap( CSV_Decorations, Img_Decorations, 0.000, 0.000, 16, 20, 1.000, 1.000, false, 50, 1, properties, onAddCallback );

			//Add layers to the master group in correct order.
			masterLayer.add(layerEnvironment);
			masterLayer.add(MobilesGroup);
			masterLayer.add(MachineryGroup);
			masterLayer.add(layerDecorations);

			if ( addToStage )
				createObjects(onAddCallback);

			boundsMinX = 0;
			boundsMinY = 0;
			boundsMaxX = 640;
			boundsMaxY = 500;
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
			addSpriteToLayer(null, Alien, MobilesGroup , 304.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Alien, MobilesGroup , 304.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Spider, MobilesGroup , 304.000, 200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 336.000, 200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Alien, MobilesGroup , 336.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Alien"
			addSpriteToLayer(null, Portal, MobilesGroup , 224.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			addSpriteToLayer(null, Portal, MobilesGroup , 416.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"hasPower", value:true }, null ), onAddCallback );//"Portal"
			addSpriteToLayer(null, Spider, MobilesGroup , 272.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 272.000, 220.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 320.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 384.000, 200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 368.000, 240.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 336.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 352.000, 220.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 320.000, 220.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 352.000, 180.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 288.000, 200.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Spider, MobilesGroup , 352.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:false }, null ), onAddCallback );//"Spider"
			addSpriteToLayer(null, Alien, MobilesGroup , 336.000, 160.000, 0.000, 1, 1, false, 1.000, 1.000, generateProperties( { name:"startDead", value:true }, null ), onAddCallback );//"Alien-Dead"
		}

		public function addSpritesForLayerMachinery(onAddCallback:Function = null):void
		{
		}

		public function generateObjectLinks(onAddCallback:Function = null):void
		{
		}

	}
}
