package entities;

import flixel.FlxSprite;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.effects.FlxFlicker;
import flixel.effects.particles.FlxEmitter;
import flixel.system.FlxAssets.FlxGraphicAsset;
import flixel.util.FlxColor;
import Reg;

enum Estados
{
	IDLE;
	JUMP;
	WALK;
	DEAD;
	ATTACK;
}
class Player extends FlxSprite
{
	public var states(get, null):Estados;
	public var hit(get, null):FlxSprite;
	
	public function new(?X:Float = 0, ?Y:Float = 0)
	{
		super(X, Y);
		
		loadGraphic(AssetPaths.crisfull__png, true, 80, 75);
		
		updateHitbox();
		setFacingFlip(FlxObject.RIGHT, false, false);
		setFacingFlip(FlxObject.LEFT, true, false);
		
		animation.add("idle", [0, 1, 2, 3], 8, true);
		animation.add("walk", [4,5,6,7,8,9], 12, true);
		animation.add("jump", [10, 11], 5, true);
		animation.add("fall", [15,16], 8, false);
		animation.add("attack", [18, 19, 20, 21, 22], 12, false);
		animation.add("dead", [23], 6, false);
		animation.add("idlel", [24, 25, 26, 27], 8, true);
		animation.add("walkl", [28,29,30,31,32,33], 12, true);
		animation.add("jumpl", [34, 35], 5, true);
		animation.add("falll", [39,40], 8, false);
		animation.add("attackl", [42, 43, 44, 45, 46], 12, false);
		animation.add("deadl", [47], 6, false);
		this.width = 32;
		this.height = 70;
		this.offset.x = 25;
		this.offset.y = 5;
		
		hit = new FlxSprite();
		hit.makeGraphic(30, 12);
		hit.kill();
		
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
			case Estados.IDLE:						//IDLE
				hit.kill();
				if (facing == FlxObject.RIGHT)
				{
					animation.play("idle");
					move();
					jump();
					if (velocity.y < 0)
						states = Estados.JUMP;
					else if (velocity.x != 0)
						states = Estados.WALK;
					else if (FlxG.keys.justPressed.Z)
						states = Estados.ATTACK;
				}
				else if (facing == FlxObject.LEFT)
				{
					animation.play("idlel");
					move();
					jump();
					if (velocity.y < 0)
						states = Estados.JUMP;
					else if (velocity.x != 0)
						states = Estados.WALK;
					else if (FlxG.keys.justPressed.Z)
						states = Estados.ATTACK;
				}
			case Estados.WALK:						//WALK
				if (facing == FlxObject.RIGHT)
				{
					animation.play("walk");
					move();
					jump();
					if (velocity.y !=0)
						states = Estados.JUMP;
					else if (velocity.x == 0)
						states = Estados.IDLE;
				}
				else if (facing == FlxObject.LEFT)
				{
					animation.play("walkl");
					move();
					jump();
					if (velocity.y !=0)
						states = Estados.JUMP;
					else if (velocity.x == 0)
						states = Estados.IDLE;
				}
			case Estados.JUMP:						//JUMP
				if (facing == FlxObject.RIGHT)
				{
					animation.play("jump");
					move();
					if (velocity.y == 0)
					{
						if (velocity.x == 0)
							states = Estados.IDLE;
						else
							states = Estados.WALK;
					}
					if (FlxG.keys.justPressed.Z)
						states = Estados.ATTACK;
				}
				else if (facing == FlxObject.LEFT)
				{
					animation.play("jumpl");
					move();
					
					if (velocity.y == 0)
					{
						if (velocity.x == 0)
							states = Estados.IDLE;
						else
							states = Estados.WALK;
					}
					else if (FlxG.keys.justPressed.Z)
						states = Estados.ATTACK;
				}
			case Estados.DEAD:						//DEAD
				if (facing == FlxObject.RIGHT)
				{
					animation.play("dead");
					FlxFlicker.flicker(this, 1, 0.1, true, true);
					FlxG.camera.shake(0.005, 0.25);
					velocity.x = 0;
				}
				else if (facing == FlxObject.LEFT)
				{
					animation.play("deadl");
					FlxFlicker.flicker(this, 1, 0.1, true, true);
					FlxG.camera.shake(0.005, 0.25);
					velocity.x = 0;
				}
				
			case Estados.ATTACK:					//ATTACK
				if (facing == FlxObject.RIGHT)
				{
					animation.play("attack");
					if (animation.name == "attack" && animation.curAnim.curFrame == 2)
					{
						hit.reset(this.x +22, this.y + 24);
					}
					else if (animation.name == "attack" && animation.curAnim.curFrame == 4)
					{
						hit.reset(this.x +29, this.y + 24);
						states = Estados.IDLE;
					}
				}
				else if (facing == FlxObject.LEFT)
				{
					animation.play("attackl");
					if (animation.name == "attackl" && animation.curAnim.curFrame == 2)
					{
						hit.reset(this.x -22, this.y + 24);
					}	
					else if (animation.name == "attackl" && animation.curAnim.curFrame == 4)
					{
						hit.reset(this.x -29, this.y + 24);
						states = Estados.IDLE;
					}
				}
		}
	}
	private function move():Void
	{
		velocity.x = 0;
		if (FlxG.keys.pressed.RIGHT)
			velocity.x += 200;
		if (FlxG.keys.pressed.LEFT)
			velocity.x -= 200;
			
		if (velocity.x < 0)
			facing = FlxObject.LEFT;
		if (velocity.x > 0)
			facing = FlxObject.RIGHT;
	}
	private function jump():Void
	{
		if ((FlxG.keys.justPressed.UP || FlxG.keys.justPressed.SPACE) && isTouching(FlxObject.FLOOR))
		{
			velocity.y -= 650;
			FlxG.sound.play(AssetPaths.Jump6__wav);
		}
	}
	public function ded():Void
	{
		states = Estados.DEAD;
	}
	function get_states():Estados
	{
		return states;
	}
	function get_hit():FlxSprite
	{
		return hit;
	}
}