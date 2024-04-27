package;

import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	var items:Array<Dynamic> = ['Apple', 'Gem', 'Hammer', 'Overrider', 'RedCan', 'Stabber'];
	var itemGRP:FlxTypedGroup<FlxSprite>;

	override public function create()
	{
		itemGRP = new FlxTypedGroup<FlxSprite>();
		add(itemGRP);

		for (i in 0...items.length) {}

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
