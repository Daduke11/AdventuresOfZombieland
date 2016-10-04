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
class CreditsWindow extends FlxSpriteGroup
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
		txt.text = " Credits: \nDesigned and created by John Sijs. \nSpecial thanks Haxe Flixel, art work and music and sounds credited in images, music and sounds folders.";
		add(txt);
		
		
	}
	
	private function onReturn() {
		MenuState.creditsVisisble(false);
	}
	
}