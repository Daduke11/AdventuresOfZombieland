package;

import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxBar;
import flixel.FlxG;
import flixel.system.FlxSound;

/**
 * ...
 * @author John Sijs...
 * Some code snippets were used from http://haxecoder.com/post.php?id=45
 */
class HUD extends FlxSpriteGroup
{
	private var healthDisplay:FlxText;
	private var levelDisplay:FlxText;
	private var expBar:FlxBar;
	
	private var hp:Int;
	private var maxHp:Int;
	private var exp:Int;
	private var maxExp:Int;
	private var level:Int;
	private var sfx_levelup:FlxSound;
	
	public function new() 
	{
		super();
		// sets window to where users camera is 
		scrollFactor.x = 0;
		scrollFactor.y = 0;
		
		healthDisplay = new FlxText(4, 2);
		hp = 15;
		maxHp = 20;
		add(healthDisplay);
		
		levelDisplay = new FlxText(4, 12);
		level = 1;
		add(levelDisplay);
		
		maxExp = 10;
		exp = 1;
		expBar = new FlxBar(6, 25, FlxBar.FILL_LEFT_TO_RIGHT, 100, 4);
		expBar.createFilledBar(0xFF63460C, 0xFFE6AA2F);
		add(expBar);
		sfx_levelup = FlxG.sound.load("assets/sounds/levelup.wav");
	}
	
	override public function update() {
		healthDisplay.text = "Health: " + hp + "/" + maxHp;
		levelDisplay.text = "Level: " + level;
		expBar.currentValue = exp;
		expBar.setRange(0, maxExp);
	}
	
	public function addHealth(num:Int):Void {
		hp += num;
		if (hp > maxHp) {
			hp = maxHp;
		}
		if (hp <= 0) {
			//FlxG.switchState(new MenuState("You lost, care to try again?"));
			//"You Lost, Care To Try Again?"));
			FlxG.switchState(new MenuState());
			//PlayState.menuLooseVisible = true;
			
		}
	}
	
	private function menuLoose():Void {
		//PlayState.menuLooseVisible = true;
	}
	
	public function addExp(num:Int):Void {
		exp += num;
		while (exp > maxExp) {
			level++;
			exp -= maxExp;
			maxExp = Math.ceil(maxExp * 1.3);
			hp++;
			maxHp++;
			sfx_levelup.play();
		}
	}
	
	public function getLevel():Int {
		return level;
	}
	
}