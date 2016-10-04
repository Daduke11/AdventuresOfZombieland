package;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

/**
 * ...
 * @author John Sijs...
 */
class CombatWindow extends FlxSpriteGroup
{
	private var btn_attack:FlxButton;
	private var btn_flee:FlxButton;
	private var bg:FlxSprite;
	private var txt:FlxText;
	private var sfx_hit:FlxSound;
	
	private var playState:PlayState;
	private var enemy:Enemy;

	public function new(playState:PlayState) 
	{
		super();
		this.playState = playState;
		this.scrollFactor.x = 0;
		this.scrollFactor.y = 0;
		
		x = FlxG.width / 2 - 100;
		y = FlxG.height / 2 - 40;
		
		bg = new FlxSprite();
		add(bg);
		bg.makeGraphic(200, 80, 0xff222222);
		
		btn_attack = new FlxButton(5, 55, "Attack", onAttack);
		btn_flee = new FlxButton(115, 55, "Flee", onFlee);
		add(btn_attack);
		add(btn_flee);
		
		txt = new FlxText(5, 5, 190);
		add(txt);
		
		// sounds 
		sfx_hit = FlxG.sound.load("assets/sounds/hit.wav");
	}
	
	public function fight(enemy:Enemy) {
		this.enemy = enemy;
		txt.text = "A wild Zombie appears!!!";
	}
	
	private function onAttack() {
		sfx_hit.play();
		var dmg:Int = playState.hud.getLevel();
		enemy.health -= dmg;
		txt.text = "You hit the zombie, dealing " + dmg + " damage.";
		if (enemy.health > 0) {
			var enemyDmg:Int =  Math.floor( (playState.hud.getLevel() / 2) + Math.random()*2);
			//var enemyDmg:Int =  Math.floor( (playState.hud.getLevel() / 2) + Math.random()*2);
			txt.text += "\nThe zombie strikes, dealing " + enemyDmg + " damage.";
			playState.hud.addHealth( -enemyDmg);
		} else {
			playState.winCombat(enemy);
			playState.hud.addExp(6);
		}
	}
	
	private function onFlee() {
		playState.endCombat(enemy);
	}
}