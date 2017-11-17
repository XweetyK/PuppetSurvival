package;

import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxState;
import flixel.text.FlxText;
import source.entities.Player;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;

class PlayState extends FlxState
{
	var player1:Player;
	var tilebase:FlxTilemap;
	var texst:FlxText;
	override public function create():Void
	{
		super.create();
		texst = new FlxText(100, 100, 0, "", 25);
		texst.color.blue;
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level2__oel);
		tilebase = loader.loadTilemap(AssetPaths.Newpiskel__png, 32, 32, "TilesetBase");
		tilebase.setTileProperties(0, FlxObject.NONE);
		tilebase.setTileProperties(1, FlxObject.UP);
		tilebase.setTileProperties(2, FlxObject.ANY);
		player1 = new Player (100, 100);
		add(tilebase);
		add(player1);
		add(texst);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player1, tilebase);
		texst.text = player1.states.getName();
		
	}
}