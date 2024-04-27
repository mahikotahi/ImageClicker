package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import sys.FileSystem;

class PlayState extends FlxState
{
	var items:Array<Dynamic> = ['Apple.png', 'Gem.png', 'Hammer.png', 'Overrider.png', 'Stabber.png'];
	var itemGRP:FlxTypedGroup<FlxSprite>;
	var baldiboints:Int = 0;
	var selectedItem:Int = 0;
	var paldboints:FlxText;

	override public function create()
	{
		try
		{
			var thing = FileSystem.readDirectory('assets/images');
			items = thing;
			if (items == null)
			{
				trace('wtf did u do');
				items = ['Apple.png', 'Gem.png', 'Hammer.png', 'Overrider.png', 'Stabber.png'];
			}
			else
			{
				trace(items);
			}
		}
		catch (e)
		{
			items = ['Apple.png', 'Gem.png', 'Hammer.png', 'Overrider.png', 'Stabber.png'];
		}

		itemGRP = new FlxTypedGroup<FlxSprite>();

		for (i in 0...items.length)
		{
			var sprite:FlxSprite = new FlxSprite(0, 0);
			sprite.setPosition(FlxG.random.float(0, 960), FlxG.random.float(0, 530));
			sprite.loadGraphic('assets/images/' + items[FlxG.random.int(0, 6)] + '');
			itemGRP.add(sprite);
		}

		add(itemGRP);

		paldboints = new FlxText(10, 5);
		paldboints.font = 'assets/data/COMICSANS.TTF';
		paldboints.size = 24;
		add(paldboints);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		paldboints.text = 'Points: ' + baldiboints;

		for (i in 0...itemGRP.members.length)
		{
			if (itemGRP.members[i].graphic == null)
				itemGRP.members[i].loadGraphic('assets/images/' + items[FlxG.random.int(0, 6)] + '.png');

			if (FlxG.mouse.overlaps(itemGRP.members[i]))
			{
				if (selectedItem != 0 || selectedItem != i + 1)
				{
					selectedItem = i + 1;

					if (FlxG.mouse.justPressed)
					{
						itemGRP.members[i].setPosition(FlxG.random.float(0, 960), FlxG.random.float(0, 530));
						itemGRP.members[i].loadGraphic('assets/images/' + items[FlxG.random.int(0, 6)] + '');
						baldiboints += FlxG.random.int(10, 200);
						selectedItem = 0;
					}
				}
			}
		}

		if (FileSystem.readDirectory('assets/images') != items)
		{
			try
			{
				var thing = FileSystem.readDirectory('assets/images');
				items = thing;
				if (items == null)
				{
					trace('wtf did u do');
					items = ['Apple.png', 'Gem.png', 'Hammer.png', 'Overrider.png', 'Stabber.png'];
				}
				else
				{
					trace(items);
				}
			}
			catch (e)
			{
				items = ['Apple.png', 'Gem.png', 'Hammer.png', 'Overrider.png', 'Stabber.png'];
			}
		}

		super.update(elapsed);
	}
}
