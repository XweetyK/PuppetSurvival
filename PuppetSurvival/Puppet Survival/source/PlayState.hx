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

class PlayState extends FlxState
{
	var player1:Player;
	var tilebase:FlxTilemap;
	var spikes:FlxTilemap;
	private var emitter:FlxEmitter;
	var timebar:FlxBar;
	var fill:Dynamic;
	var time:Float;
	var lvl:Int;
	var door:Door;
	private var keys:FlxTypedGroup<Key>;
	var deaths:FlxText;
	var marco:FlxSprite;
	var fondo:FlxSprite;
	var textitio:FlxText;
	var go:FlxText;
	var trail:FlxTrail;
	var cheater:Bool;
	var cht:FlxText;
	var end:FlxText;
	override public function create():Void
	{
		super.create();
		FlxG.camera.fade(FlxColor.BLACK, 0.1, true);
		Reg.keys = 0;
		lvl = Reg.level;
		keys = new FlxTypedGroup<Key>();
		
		deaths = new FlxText(18, 577, 0, "Deaths: " + Reg.deaths, 16, true);
		deaths.color = FlxColor.MAGENTA;
		
		fondo = new FlxSprite(0, 0, AssetPaths.fondo__jpg);
		add(fondo);
		player1 = new Player (445, 90);
		door = new Door(505, 86);
		cheater = Reg.cheats;
		
		switch(lvl)
		{
			case 1:
				var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level1__oel);
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
			case 2:
				var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level2__oel);
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
			case 3:
				var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level3__oel);
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
			case 4:
				var loader:FlxOgmoLoader = new FlxOgmoLoader(AssetPaths.Level4__oel);
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
			case 5:
				fondo.kill();
				player1.kill();
				door.kill();
				go = new FlxText(100, 200, 0, "THE END", 50);
				FlxFlicker.flicker(go, 0, 0.3, true, true);
				textitio = new FlxText(100, 300, 0, "TOTAL DEATHS: " + Reg.deaths, 45);
				FlxFlicker.flicker(textitio, 0, 0.3, true, true);
				add(textitio);
				add(go);
				end = new FlxText(100, 400,0, "Press Enter to Continue", 30);
				add(end);
				Reg.won = true;
		}
		
		door.scale.set(2, 1.5);
		door.updateHitbox();
		door.width = 45;
		door.height = 75;
		door.offset.x = 25;
		door.offset.y = 5;
		add(door);
		
		/*trail = new FlxTrail(player1, null, 3, 10);
		add(trail);*/
		
		fill = 100;
		time = 0;
		emitter = new FlxEmitter(player1.x,player1.y,100);
		emitter.makeParticles(2, 2, FlxColor.WHITE, 100);
		emitter.color.set(FlxColor.MAGENTA, FlxColor.PINK, FlxColor.PURPLE);
		emitter.start(false, 0.01);
		emitter.launchAngle.set( -115, -75);
		add(player1);
		marco = new FlxSprite(0, 0, AssetPaths.marco__png);
		add(marco);
		timebar = new FlxBar(999, 196, BOTTOM_TO_TOP, 15, 250, '', "", 0, 100, true);
		timebar.percent = fill;
		timebar.createGradientEmptyBar([FlxColor.BLACK, FlxColor.RED], 1,90, true, FlxColor.RED);
		timebar.createGradientFilledBar([0xFFFF00D4, 0xFF490068], 1, 90);
		add(timebar);
		add(deaths);
	}

	override public function update(elapsed:Float):Void
	{
		super.update(elapsed);
		FlxG.collide(player1, tilebase);
		timer();
		timebar.percent = fill;
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
		if (fill == 0 || FlxG.collide(player1, spikes))
		{
			player1.ded();
			deadSFX();
		}
		if (Reg.deaths >= 30)
		{
			deaths.text = "GIT GUD";
			deaths.color = FlxColor.LIME;
		}
		if (player1.states == Estados.DEAD)			//DEATH PARTICLES
		{
			if (player1.facing == FlxObject.RIGHT)
			{
				emitter.x = player1.x+20;
				emitter.y = player1.y + 20;
			}
			else if (player1.facing == FlxObject.LEFT)
			{
				emitter.x = player1.x +10;
				emitter.y = player1.y + 20;
			}
			add(emitter);
			FlxG.camera.fade(FlxColor.BLACK, 2, false, resetThis);
		}
		if (FlxG.overlap(player1, door) && door.states == State.OPEN && FlxG.keys.justPressed.Z)
		{
			FlxG.camera.fade(FlxColor.BLACK, 0.5, false, enditall);
			doorSFX();
		}	
		if (FlxG.keys.justPressed.C)
		{
			Reg.keys++;
			Reg.cheats = true;
		}
		if (Reg.level == 5)
		{
			if(Reg.cheats == true )
			{	
				cht = new FlxText(100, 360, 0, "Yeah, this is cool... but u r a cheater", 20);
				add(cht);
			}
			if (FlxG.keys.justPressed.ENTER)
				FlxG.switchState(new MenuState());
		}
	}
	private function keyGen (entityName:String, entityData: Xml)
	{
		var x:Int = Std.parseInt(entityData.get("x"));
		var y:Int = Std.parseInt(entityData.get("y"));
		var llave:Key = new Key(x,y);
		keys.add(llave);
	}
	private function timer()
	{
		time++;
		if (time > 29)
		{
			fill--;
			time = 0;
		}
	}
	private function resetThis():Void
	{
		FlxG.camera.fade(FlxColor.BLACK, 0.1, true);
		Reg.keys = 0;
		Reg.deaths+=1;
		massacre();
		create();
	}
	private function enditall():Void
	{
		finishLevel();
		massacre();
		create();
	}
	private function doorSFX():Void
	{
		FlxG.sound.play(AssetPaths.Randomize6__wav);
	}
	private function deadSFX():Void
	{
		FlxG.sound.play(AssetPaths.Hit_Hurt35__wav);
	}
	private function finishLevel():Void
	{
		Reg.level++;
		Reg.keys = 0;
	}
	private function massacre():Void
	{
		player1.destroy();
		timebar.destroy();
		tilebase.destroy();
		emitter.destroy();
		door.destroy();
		spikes.destroy();
		keys.destroy();
		deaths.destroy();
		marco.destroy();
		fondo.destroy();
	}
}