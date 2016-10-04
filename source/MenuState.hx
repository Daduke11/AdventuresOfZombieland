package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.system.FlxSound;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	private static var creditsWindow:CreditsWindow;
	private static var rulesWindow:RulesWindow;
	private var btn_credits:FlxButton;
	private var music_mainMenuBackGround:FlxSound;
	private static var introWindow:IntroductionWindow;
	private var txt:FlxText;
	private var input:String;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	/*
	public function new(input:String)
	{
		super();
		this.input = input;
	}
	*/
	override public function create():Void
	{
		super.create();
		
		var init_x:Int = Math.floor(FlxG.width / 2 - 40);
		
		var btn_new = new FlxButton(init_x, 70, "New Game", onNew);
		var btn_load = new FlxButton(init_x, 90, "Introduction", onIntroduction);
		var btn_rules = new FlxButton(init_x, 110, "How to Play", onRules);
		btn_credits = new FlxButton(init_x, 130, "Credits", onCredits);
		
		//"The Adventures of Zombie Land!"
		txt = new FlxText(75, 75, 250, input);
		txt.setFormat(null, 8, 0xffffff, "center", 0);
		add(txt); //adds a 100px wide text field at position 0,0 (upper left)
		add(btn_new);
		add(btn_load);
		add(btn_rules);
		add(btn_credits);
		
		// rules window
		rulesWindow = new RulesWindow();
		rulesWindow.visible = false;
		add(rulesWindow);
		
		// credits window
		creditsWindow = new CreditsWindow();
		creditsWindow.visible = false;
		add(creditsWindow);
		
		// menu music 
		music_mainMenuBackGround = FlxG.sound.load("assets/music/Fantasy_Choir_2.mp3");
		music_mainMenuBackGround.play();
		
		// intro window 
		introWindow = new IntroductionWindow();
		introWindow.visible = false;
		add(introWindow);
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
		music_mainMenuBackGround.play();
	}

	private function onNew():Void {
		FlxG.switchState(new PlayState());
	}

	private function onIntroduction():Void {
		introWindow.visible = true;
	}
	
	private function onRules():Void {
		rulesWindow.visible = true;
	}
	
	public static function rulesWindowVisible(visible:Bool):Void {
		rulesWindow.visible = visible;
	}
	
	public static function introWindowVisible(visible:Bool):Void {
		introWindow.visible = visible;
	}
	
	private function onCredits() {
		creditsWindow.visible = true;
	}
		
	public static function creditsVisisble(visible:Bool) {
		creditsWindow.visible = visible;	
	}
	
}