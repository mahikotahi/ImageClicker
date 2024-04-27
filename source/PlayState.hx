package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;

class PlayState extends FlxState
{
	var items:Array<Dynamic> = ['Apple', 'Gem', 'Hammer', 'Overrider', 'RedCan', 'Stabber'];
	var itemGRP:FlxTypedGroup<FlxSprite>;
	var baldiboints:Int = 0;

	override public function create()
	{
		itemGRP = new FlxTypedGroup<FlxSprite>();

		for (i in 0...items.length)
		{
			var sprite:FlxSprite = new FlxSprite(0, 0);
			sprite.setPosition(FlxG.random.float(320, 960), FlxG.random.float(180, 360));
			sprite.loadGraphic('assets/images/' + items[FlxG.random.int(0, 6)] + '.png');
			itemGRP.add(sprite);
		}

		add(itemGRP);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		for (i in 0...itemGRP.members.length)
		{
			if (FlxG.mouse.overlaps(itemGRP.members[i]) && FlxG.mouse.released)
			{
				itemGRP.members[i].setPosition(FlxG.random.float(320, 960), FlxG.random.float(180, 360));
				itemGRP.members[i].loadGraphic('assets/images/' + items[FlxG.random.int(0, 6)] + '.png');
				baldiboints += FlxG.random.int(10, 200);
			}
		}

		super.update(elapsed);
	}
}
