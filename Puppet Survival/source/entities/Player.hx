package source.entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import Reg;

enum Estados
{
	IDLE;
	JUMP;
	WALK;
	DAMAGE;
}
class Player extends FlxSprite
{
	public var states(get, null):Estados;
	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		
		loadGraphic(AssetPaths.cris__png, true, 60, 75);
		
		animation.add("idle", [0, 1, 2, 3], 8, true);
		animation.add("walk", [4,5,6,7,8,9], 8, true);
		animation.add("jump", [10, 11, 12, 13, 14], 8, true);
		animation.add("fall", [15,16], 8, true);
		animation.add("attack", [18,19,20,21,22], 8, true);
		
		states = IDLE;
		acceleration.y = Reg.gravity;
	}
	override public function update(elapsed:Float):Void 
	{
		stateMachine();
		super.update(elapsed);
		
	}
	private function stateMachine():Void
	{
		switch (states)
		{
			case Estados.IDLE:
				animation.play("idle");
				move();
				jump();
				if (velocity.y < 0)
					states = Estados.JUMP;
				else if (velocity.x != 0)
					states = Estados.WALK;
			case Estados.WALK:
				animation.play("walk");
				move();
				jump();
				if (velocity.y !=0)
					states = Estados.JUMP;
				else if (velocity.x == 0)
					states = Estados.IDLE;
			case Estados.JUMP:
				animation.play("jump");
				move();
				if (velocity.y == 0)
				{
					if (velocity.x == 0)
						states = Estados.IDLE;
					else
						states = Estados.WALK;
				}
			case Estados.DAMAGE:
				
				
		}
	}
	private function move():Void
	{
		velocity.x = 0;
		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 250;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 250;
	}
	private function jump():Void
	{
		if (FlxG.keys.justPressed.UP && isTouching(FlxObject.FLOOR))
			velocity.y -= 700;
	}
	function get_states():Estados
	{
		return states;
	}
}