package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;

/**
 * ...
 * @author John Sijs...
 */
class IntroductionWindow extends FlxSpriteGroup
{
	private var btn_return:FlxButton;
	private var bg:FlxSprite;
	private var txt:FlxText;

	public function new() 
	{
		super();
		
		x = FlxG.width / 2 - 155;
		y = FlxG.height / 2 - 115;
		
		bg = new FlxSprite();
		add(bg);
		bg.makeGraphic(300, 200, 0xff222222);
		
		btn_return = new FlxButton(110, 175, "Return", onReturn);
		
		add(btn_return);

		
		txt = new FlxText(2, 5, 300);
		txt.setFormat(null, 8, 0xffffff, "center", 0);
		txt.text = " The Adventures of Zombie Land\n " +
		"In a faraway land surrounded by lush forests and fertile soil," + 
		"there was a beautiful queen and a gentle king who was loved by all " +
		"their loyal citizens. One day, a devastating plague swept through the " + 
		"town and everyone began to get sick. Not wanting to risk the lives of " + 
		"his guards, the gentle king who cared so much for his citizens decided " + 
		"to leave his castle on his own and bring medicine to his people. But " + 
		"when he got to the walls of the castle, he realized the plague not " + 
		"only made people sick, it also turned people into zombies. " + 
		"The king, yielding only his mighty long sword became overwhelmed by a zombie horde and is now trapped " +
		"outside the castle walls. The beautiful queen who was once a highly trained knight of the " + 
		"Nine Kingdoms, decided it's up to her to rescue the king!\n " + 
		"Do you accept this quest to save the king? ";
		add(txt);
		
		
	}
	
	private function onReturn() {
		MenuState.introWindowVisible(false);
	
	}
	
}