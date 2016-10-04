package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;
import flash.system.System;

/**
 * ...
 * @author John Sijs...
 */
class MenuComplete extends FlxSpriteGroup
{
	private var btn_playAgain:FlxButton;
	private var btn_returnToMenu:FlxButton;
	private var btn_Exit:FlxButton;
	private var bg:FlxSprite;
	private var txt:FlxText;
	var t:FlxTimer = new FlxTimer();
	public var counter:Float = 0;
	
	
	public function new(input:String) 
	{
		super();
		
		// sets window to where users camera is
		this.scrollFactor.x = 0;
		this.scrollFactor.y = 0;
		x = FlxG.width / 2 - 50;
		y = FlxG.height / 2 - 50;
		
		bg = new FlxSprite();
		add(bg);
		bg.makeGraphic(100, 100, 0xff222222);
		
		btn_playAgain = new FlxButton(10, 25, "Play Again", onPlayAgain);
		btn_returnToMenu = new FlxButton(10, 45, "Main Menu", onReturnToMenu);
		btn_Exit = new FlxButton(10, 65, "Exit", onExit);
		
		add(new FlxText(10, 0, 100, input));
		//"You Rescued The King!!!"
		add(btn_playAgain);
		add(btn_returnToMenu);
		add(btn_Exit);
	
	}
	
	private function onPlayAgain() {
		FlxG.switchState(new PlayState());
	}
	
	private function onReturnToMenu() {
		FlxG.switchState(new MenuState());
	}
	
	private function onExit() {
		System.exit(0);
	}
	

}