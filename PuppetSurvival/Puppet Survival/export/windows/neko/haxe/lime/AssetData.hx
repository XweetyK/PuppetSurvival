package lime;


import lime.utils.Assets;


class AssetData {

	private static var initialized:Bool = false;
	
	public static var library = new #if haxe3 Map <String, #else Hash <#end LibraryType> ();
	public static var path = new #if haxe3 Map <String, #else Hash <#end String> ();
	public static var type = new #if haxe3 Map <String, #else Hash <#end AssetType> ();	
	
	public static function initialize():Void {
		
		if (!initialized) {
			
			path.set ("assets/data/Level1.oel", "assets/data/Level1.oel");
			type.set ("assets/data/Level1.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level2.oel", "assets/data/Level2.oel");
			type.set ("assets/data/Level2.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level3.oel", "assets/data/Level3.oel");
			type.set ("assets/data/Level3.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Level4.oel", "assets/data/Level4.oel");
			type.set ("assets/data/Level4.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/MenuLVL.oel", "assets/data/MenuLVL.oel");
			type.set ("assets/data/MenuLVL.oel", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/data/Newpiskel.png", "assets/data/Newpiskel.png");
			type.set ("assets/data/Newpiskel.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/data/pLevel.oep", "assets/data/pLevel.oep");
			type.set ("assets/data/pLevel.oep", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/images/cris.png", "assets/images/cris.png");
			type.set ("assets/images/cris.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/crisfull.png", "assets/images/crisfull.png");
			type.set ("assets/images/crisfull.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/door.png", "assets/images/door.png");
			type.set ("assets/images/door.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/floor.png", "assets/images/floor.png");
			type.set ("assets/images/floor.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/fondo.jpg", "assets/images/fondo.jpg");
			type.set ("assets/images/fondo.jpg", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/key.png", "assets/images/key.png");
			type.set ("assets/images/key.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/marco.png", "assets/images/marco.png");
			type.set ("assets/images/marco.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/marcoM.png", "assets/images/marcoM.png");
			type.set ("assets/images/marcoM.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/spike.png", "assets/images/spike.png");
			type.set ("assets/images/spike.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/images/title.png", "assets/images/title.png");
			type.set ("assets/images/title.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("assets/music/music-goes-here.txt", "assets/music/music-goes-here.txt");
			type.set ("assets/music/music-goes-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("assets/sounds/Hit_Hurt35.wav", "assets/sounds/Hit_Hurt35.wav");
			type.set ("assets/sounds/Hit_Hurt35.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Jump6.wav", "assets/sounds/Jump6.wav");
			type.set ("assets/sounds/Jump6.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Pickup_Coin36.wav", "assets/sounds/Pickup_Coin36.wav");
			type.set ("assets/sounds/Pickup_Coin36.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/Randomize6.wav", "assets/sounds/Randomize6.wav");
			type.set ("assets/sounds/Randomize6.wav", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("assets/sounds/sounds-go-here.txt", "assets/sounds/sounds-go-here.txt");
			type.set ("assets/sounds/sounds-go-here.txt", Reflect.field (AssetType, "text".toUpperCase ()));
			path.set ("flixel/sounds/beep.ogg", "flixel/sounds/beep.ogg");
			type.set ("flixel/sounds/beep.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/sounds/flixel.ogg", "flixel/sounds/flixel.ogg");
			type.set ("flixel/sounds/flixel.ogg", Reflect.field (AssetType, "sound".toUpperCase ()));
			path.set ("flixel/fonts/nokiafc22.ttf", "flixel/fonts/nokiafc22.ttf");
			type.set ("flixel/fonts/nokiafc22.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/fonts/monsterrat.ttf", "flixel/fonts/monsterrat.ttf");
			type.set ("flixel/fonts/monsterrat.ttf", Reflect.field (AssetType, "font".toUpperCase ()));
			path.set ("flixel/images/ui/button.png", "flixel/images/ui/button.png");
			type.set ("flixel/images/ui/button.png", Reflect.field (AssetType, "image".toUpperCase ()));
			path.set ("flixel/images/logo/default.png", "flixel/images/logo/default.png");
			type.set ("flixel/images/logo/default.png", Reflect.field (AssetType, "image".toUpperCase ()));
			
			
			initialized = true;
			
		} //!initialized
		
	} //initialize
	
	
} //AssetData
