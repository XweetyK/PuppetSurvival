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
	public function new(?X:Float = 0, ?Y:Float = 0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		makeGraphic(32, 32, FlxColor.CYAN);
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
				move();
				jump();
				if (velocity.y < 0)
					states = Estados.JUMP;
				else if (velocity.x != 0)
					states = Estados.WALK;
			case Estados.WALK:
				move();
				jump();
				if (velocity.y !=0)
					states = Estados.JUMP;
				else if (velocity.x == 0)
					states = Estados.IDLE;
			case Estados.JUMP:
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
			velocity.y -= 450;
	}
	function get_states():Estados
	{
		return states;
	}
}