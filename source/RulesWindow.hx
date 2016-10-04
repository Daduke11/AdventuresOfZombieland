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
class RulesWindow extends FlxSpriteGroup
{
	private var btn_return:FlxButton;
	private var bg:FlxSprite;
	private var txt:FlxText;

	public function new() 
	{
		super();
		
		x = FlxG.width / 2 - 100;
		y = FlxG.height / 2 - 100;
		
		bg = new FlxSprite();
		add(bg);
		bg.makeGraphic(200, 170, 0xff222222);
		
		btn_return = new FlxButton(60, 140, "Return", onReturn);
		
		add(btn_return);

		
		txt = new FlxText(5, 5, 190);
		txt.text = " How to play: \n Rescue the King, kill the zombies if you must ! \n Use the arrow or wasd keys to move camera. \n " 
			+ "Use left mouse button to click on a tile to move there. \n Click \"New Game\" from the Main Menu to start a game \n"
			+ "Hit \"M\" while playing to bring up the in-game Menu";
		add(txt);
		
		
	}
	
	private function onReturn() {
		MenuState.rulesWindowVisible(false);
		PlayState.rulesWindowVisible(false);
	}
	
}