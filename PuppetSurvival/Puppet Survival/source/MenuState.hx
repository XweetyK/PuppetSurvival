package;

import entities.Door;
import entities.Key;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.effects.particles.FlxEmitter;
import flixel.effects.particles.FlxParticle;
import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.addons.effects.FlxTrail;
import entities.Player;
import flixel.addons.editors.ogmo.FlxOgmoLoader;
import flixel.tile.FlxTilemap;
import flixel.effects.FlxFlicker;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;

class MenuState extends FlxState
{
	var player1:Player;
	var tilebase:FlxTilemap;
	var spikes:FlxTilemap;
	private var emitter:FlxEmitter;
	var door:Door;
	private var keys:FlxTypedGroup<Key>;
	var fondo:FlxSprite;
	var trail:FlxTrail;
	var marco:FlxSprite;
	var enter:FlxText;
	var title:FlxSprite;
	var youwon:FlxText;
	override public function create():Void
	{
		super.create();
		Reg.keys = 8;
		keys = new FlxTypedGroup<Key>();
		
		fondo = new FlxSprite(0, 0, AssetPaths.fondo__jpg);
		add(fondo);
		
		title = new FlxSprite(0, 0, AssetPaths.title__png);
		add(title);
		youwon = new FlxText(400, 300, 0, "Congrats! You Won!", 18);
		if (Reg.won)
		{
			add(youwon);
			youwon.color = FlxColor.CYAN;
		}
		enter = new FlxText(475, 340, 0, "Press Z!",16);
		FlxFlicker.flicker(enter, 0, 0.2, true, true);
		
		emitter = new FlxEmitter(515,410,100);
		emitter.makeParticles(4, 4, FlxColor.WHITE, 100);
		emitter.color.set(FlxColor.MAGENTA, FlxColor.PINK, FlxColor.PURPLE);
		emitter.start(false, 0.01);
		add(emitter); 
		
		add(trail);
		
		var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.MenuLVL__oel);
			tilebase = loader.loadTilemap(AssetPaths.floor__png, 32, 32, "TilesetBase");
			tilebase.setTileProperties(0, FlxObject.NONE);
			tilebase.setTileProperties(1, FlxObject.UP);
			tilebase.setTileProperties(2, FlxObject.ANY);
			add(tilebase);
			spikes = loader.loadTilemap(AssetPaths.spike__png,32,32, "Spikes");
			spikes.setTileProperties(0, FlxObject.NONE);
			spikes.setTileProperties(4, FlxObject.ANY);
			add(spikes);
			loader.loadEntities(keyGen, "Keys");
			add(keys);
		
		player1 = new Player (445, 90);
		
		door = new Door(505, 405);
		door.scale.set(2, 1.5);
		door.updateHitbox();
		door.width = 45;
		door.height = 75;
		door.offset.x = 25;
		door.offset.y = 5;
		add(door);
		add(player1);
		marco = new FlxSprite(0, 0, AssetPaths.marcoM__png);
		add(marco);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player1, tilebase);
		for (i in 0... keys.members.length)
		{
			var yave:Key = keys.members[i];
			if (FlxG.overlap(player1, yave))
			{
				keys.remove(yave, true);
				Reg.keys++;
				FlxG.sound.play(AssetPaths.Pickup_Coin36__wav);
			}
		}
		if (door.states == State.OPEN)
			add(enter);
		if (FlxG.overlap(player1, door) && door.states == State.OPEN && FlxG.keys.justPressed.Z)
		{
			FlxG.camera.fade(FlxColor.BLACK, 1, false, start);
			FlxG.sound.play(AssetPaths.Randomize6__wav);
		}
		
	}
	private function keyGen (entityName:String, entityData: Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var llave:Key = new Key(x,y);
		keys.add(llave);
	}
	private function start():Void
	{
		FlxG.switchState(new PlayState());
	}
}