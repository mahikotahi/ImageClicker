package;

import flixel.FlxSprite;
import flixel.FlxState;

class PlayState extends FlxState
{
	var apple:FlxSprite;
	var hammer:FlxSprite;
	var holder:FlxSprite;
	var gem:FlxSprite;
	var redcan:FlxSprite;
	var stabber:FlxSprite;
	var overrider:FlxSprite;

	override public function create()
	{
		apple = new FlxSprite(0, 0).loadGraphic('assets/images/Apple.png');
		hammer = new FlxSprite(0, 0).loadGraphic('assets/images/Hammer.png');
		holder = new FlxSprite(0, 0).loadGraphic('assets/images/Holder.png');
		gem = new FlxSprite(0, 0).loadGraphic('assets/images/Gem.png');
		redcan = new FlxSprite(0, 0).loadGraphic('assets/images/RedCan.png');
		stabber = new FlxSprite(0, 0).loadGraphic('assets/images/Stabber.png');
		overrider = new FlxSprite(0, 0).loadGraphic('assets/images/Overrider.png');
		add(apple);
		add(hammer);
		add(holder);
		add(gem);
		add(redcan);
		add(stabber);
		add(overrider);

		super.create();
	}

	override public function update(elapsed:Float)
	{
		super.update(elapsed);
	}
}
