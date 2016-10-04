package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.util.FlxTimer;

/**
 * ...
 * @author John Sijs...
 * 
 */
class MenuEsc extends FlxSpriteGroup
{
	private var btn_return:FlxButton;
	private var btn_mainMenu:FlxButton;
	private var btn_howToPlay:FlxButton;
	private var bg:FlxSprite;
	private var txt:FlxText;
	var t:FlxTimer = new FlxTimer();
	public var counter:Float = 0;
	private var playState:PlayState;
	
	public function new(playState:PlayState) 
	{
		super();
		this.playState = playState;
		// sets window to where users camera is
		this.scrollFactor.x = 0;
		this.scrollFactor.y = 0;
		
		x = FlxG.width / 2 - 50;
		y = FlxG.height / 2 - 50;
		
		bg = new FlxSprite();
		add(bg);
		bg.makeGraphic(125, 115, 0xff222222);
		
		btn_howToPlay = new FlxButton(25, 48, "How To Play", onHowToPlay);
		btn_mainMenu = new FlxButton(25, 68, "Main Menu", onMainMenu);
		btn_return = new FlxButton(25, 88, "Return", onReturn);
		
		txt = new FlxText(15, 3, 100, 
			"Game Paused! Returning to Main Menu will loose current progress.");
		txt.setFormat(null, 8, 0xffffff, "center", 0);
		add(txt);
		
		add(btn_howToPlay);
		add(btn_mainMenu);
		add(btn_return);

	}
	
	private function onMainMenu():Void {
		FlxG.switchState(new MenuState());
	}
	
	private function onHowToPlay():Void {
		PlayState.rulesWindowVisible(true);
	}
	private function onReturn():Void {
		//PlayState.heroActive(true);
		//PlayState.heroCurrentState(true); //true = walking
		PlayState.escWindowVisible(false);
		// call timer
		//t.start(1,1,timerFinished());
		PlayState.unPause();
		
		/*counter += FlxG.elapsed;
		if (counter >= 1)
		{
			// After 2 seconds has passed, the timer will reset.
			counter = 0;
			PlayState.unPause();
		}*/
	}
	
}