package entities;

import flixel.FlxSprite;
import flixel.system.FlxAssets.FlxGraphicAsset;

/**
 * ...
 * @author Leo Perugini
 */
enum State
{
	OPEN;
	CLOSED;
}
class Door extends FlxSprite 
{
	public var states(get, null):State;
	public function new(?X:Float=0, ?Y:Float=0, ?SimpleGraphic:FlxGraphicAsset) 
	{
		super(X, Y, SimpleGraphic);
		loadGraphic(AssetPaths.door__png, true, 70, 64);
		animation.add("closed", [0], 1, false);
		animation.add("open", [1], 1, false);
		
		states = CLOSED;
	}
	override public function update(elapsed:Float):Void 
	{
		if (Reg.keys < 5)
		{
			animation.play("closed");
			states = State.CLOSED;
		}
		else if (Reg.keys >= 10)
		{
			animation.play("open");
			states = State.OPEN;
		}
		super.update(elapsed);
	}
	function get_states():State
	{
		return states;
	}
	
}