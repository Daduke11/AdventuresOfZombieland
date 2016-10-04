package;

import flixel.FlxCamera;
import flixel.FlxG;
import flixel.FlxObject;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxSpriteGroup;
import flixel.group.FlxTypedGroup;
import flixel.system.FlxSound;
import flixel.text.FlxText;
import flixel.tile.FlxTilemap;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxPath;
import flixel.util.FlxPoint;
import openfl.Assets;

import flixel.input.gamepad.FlxGamepad;
import flixel.input.gamepad.XboxButtonID;

	enum PlayerAction {
	Walking;
	Combat;
	Standing;
	}

/**
 * A FlxState which can be used for the actual gameplay.
 * Some code snippets were used from http://haxecoder.com/post.php?id=45
 */
class PlayState extends FlxState
{
	// variables
	private var tileMap:FlxTilemap;
	public static var TILE_WIDTH:Int = 16;
	public static var TILE_HEIGHT:Int = 16;
	private var QUEEEN_WIDTH:Int = 16;
	private var QUEEN_HEIGHT:Int = 16;
	static var LEVEL_WIDTH:Int = 50;
	static var LEVEL_HEIGHT:Int = 50;
	static var CAMERA_SPEED:Int = 8;
	private var camera:FlxCamera;
	private var cameraFocus:FlxSprite;
	private var movementMarker:FlxSprite;
	private static var hero:FlxSprite;
	private var path:FlxPath;
	public var hud:HUD;
	private var potions:FlxTypedGroup<Potion>;
	private var _gamePad:FlxGamepad;
	private var enemies:Array<Enemy>;
	private static var currentAction:PlayerAction;
	private var combatWindow:CombatWindow;
	private static var escWindow:MenuEsc;
	private static var escWindowBool:Bool;
	private static var rulesWindow:RulesWindow;
	private var combatHide:FlxTween;
	private var music_backGround:FlxSound;
	private static var king:King;
	private var menuWin:MenuComplete;
	private static var menuLoose:MenuComplete;
	
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	override public function create():Void
	{
		super.create();
		
		FlxG.worldBounds.width = TILE_WIDTH * LEVEL_WIDTH;
		FlxG.worldBounds.height = TILE_HEIGHT * LEVEL_HEIGHT;
		
		tileMap = new FlxTilemap();
		tileMap.loadMap(Assets.getText("assets/data/map1.csv"), "assets/images/forest1.png", TILE_WIDTH, TILE_HEIGHT, 0, 1);
		
		// collision properites
		tileMap.setTileProperties(0, FlxObject.ANY);
		tileMap.setTileProperties(1, FlxObject.ANY);
		tileMap.setTileProperties(2, FlxObject.NONE);
		add(tileMap);
		
		// camera
		cameraFocus = new FlxSprite();
		cameraFocus.makeGraphic(1, 1, FlxColor.TRANSPARENT);
		add(cameraFocus);
		
		camera = FlxG.camera;
		camera.follow(cameraFocus, FlxCamera.STYLE_LOCKON);
		
		movementMarker = new FlxSprite();
		movementMarker.visible = false;
		add(movementMarker);
		
		// hero creation
		hero = new FlxSprite(QUEEEN_WIDTH, QUEEN_HEIGHT);
		hero.loadGraphic("assets/images/queen_walk.png", true, QUEEEN_WIDTH, QUEEN_HEIGHT);
		hero.animation.add("down", [7, 6, 7, 8]);
		hero.animation.add("up", [1, 0, 1, 2]);
		hero.animation.add("right", [4, 3, 4, 5]);
		hero.animation.add("left", [10, 9, 10, 11]);
		hero.x = 1 * TILE_WIDTH;
		hero.y = 2 * TILE_HEIGHT;
		add(hero);
		
		hero.animation.play("down");
		currentAction = Walking;
		hero.active = true;
		
		path = new FlxPath();
		
		// Potion creation
		potions = new FlxTypedGroup<Potion>();
		add(potions);
		
		spawnPotion(5, 5);
		spawnPotion(6, 5);
		spawnPotion(3, 10);
		spawnPotion(4, 10);
		spawnPotion(1, 10);
		spawnPotion(49, 0);
		spawnPotion(1, 11);
		spawnPotion(1, 12);
		spawnPotion(1, 13);
		spawnPotion(1, 48);
		spawnPotion(12, 4);
		spawnPotion(12, 5);
		spawnPotion(12, 6);
		spawnPotion(12, 7);
		spawnPotion(12, 8);
		spawnPotion(12, 9);
		spawnPotion(10, 13);
		spawnPotion(10, 14);
		spawnPotion(10, 15);
		spawnPotion(10, 16);
		spawnPotion(10, 17);
		spawnPotion(10, 18);
		spawnPotion(29, 20);
		spawnPotion(30, 20);
		spawnPotion(31, 20);
		spawnPotion(32, 20);
		spawnPotion(33, 20);
		spawnPotion(3, 25);
		spawnPotion(3, 26);
		spawnPotion(3, 27);
		
		// heads up distplay (HUD)
		hud = new HUD();
		add(hud);
		
		// Enemy Creation
		enemies = new Array<Enemy>();
	
		addEnemy(4, 48);
		addEnemy(1, 14);
		addEnemy(2, 23);
		addEnemy(6, 38);
		addEnemy(10, 15);
		addEnemy(20, 6);
		/*
		 
		addEnemy(12, 10);
		addEnemy(15, 6);
		
		addEnemy(1, 48);
		addEnemy(2, 48);
		addEnemy(3, 48);
		addEnemy(12, 20);
		addEnemy(12, 45);
		addEnemy(16, 37);
		addEnemy(14, 39);
		addEnemy(18, 29);
		addEnemy(28, 31);
		addEnemy(49, 1);
		addEnemy(43, 1);
		addEnemy(39, 1);
		addEnemy(28, 1);
		addEnemy(45, 22);
		*/
		//combat window creation
		combatWindow = new CombatWindow(this);
		combatWindow.active = false;
		combatWindow.visible = false;
		add(combatWindow);
		
		// esc window creation
		escWindow = new MenuEsc(this);
		escWindow.active = false;
		escWindow.visible = false;
		add(escWindow);
		
		// rules window creation 
		rulesWindow = new RulesWindow();
		rulesWindow.visible = false;
		add(rulesWindow);
		
		// king creation
		//addKing(1, 10);
		addKing(48, 48);
		//addKing(12, 48);
		
		// menuWin creation
		menuWin = new MenuComplete("You Rescued The King!!!");
		menuWin.visible = false;
		add(menuWin);
		
		// menuLoose creation
		menuLoose = new MenuComplete("You Failed to Rescued The King!!!");
		menuLoose.visible = false;
		add(menuLoose);
		
		// music 
		music_backGround = FlxG.sound.load("assets/music/Fantasy_Choir_1.wav");
		music_backGround.play();
		
		// initial settings of bool
		escWindowBool = false;
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
		music_backGround.play();
		
		//////////////
		// Gamepad support 
		/////////////
		// Important: can be null if there's no active gamepad yet!
		updateConnectedGamepads();
        _gamePad = FlxG.gamepads.lastActive;

        if (_gamePad != null)
        {
            gamepadControls();
        }
		
		//////////////
		// Gamepad support end
		/////////////

		if (FlxG.keys.anyPressed(["M", "P"])) {
				escWindow.active = true;
				escWindow.visible = true;
				currentAction = Combat;
				hero.active = false;
				FlxG.camera.focusOn(new FlxPoint(25,25));
		
		}
		
		if (FlxG.keys.anyPressed(["DOWN", "S"])) {
			cameraFocus.y += CAMERA_SPEED;
		}
		if (FlxG.keys.anyPressed(["UP", "W"])) {
			cameraFocus.y -= CAMERA_SPEED;
		}
		if (FlxG.keys.anyPressed(["RIGHT", "D"])) {
			cameraFocus.x += CAMERA_SPEED;
		}
		if (FlxG.keys.anyPressed(["LEFT", "A"])) {
			cameraFocus.x -= CAMERA_SPEED;
		}
		
		// Camera bounds
		if (cameraFocus.x < FlxG.width / 2) {
			cameraFocus.x = FlxG.width / 2;
		}
		if (cameraFocus.x > LEVEL_WIDTH * TILE_WIDTH - FlxG.width / 2) {
			cameraFocus.x = LEVEL_WIDTH * TILE_WIDTH - FlxG.width / 2;
		}
		if (cameraFocus.y < FlxG.height / 2) {
			cameraFocus.y = FlxG.height / 2;
		}
		if (cameraFocus.y > LEVEL_HEIGHT * TILE_HEIGHT - FlxG.height / 2) {
			cameraFocus.y = LEVEL_HEIGHT * TILE_HEIGHT - FlxG.height / 2;
		}
		
		// Mouse clicks
		if (currentAction == Walking && FlxG.mouse.justReleased){
			var tileCoordX:Int = Math.floor(FlxG.mouse.x / TILE_WIDTH);
			var tileCoordY:Int = Math.floor(FlxG.mouse.y / TILE_HEIGHT);
		
			movementMarker.visible = true;
			if (tileMap.getTile(tileCoordX, tileCoordY) == 2) {
				var nodes:Array<FlxPoint> = tileMap.findPath(FlxPoint.get(hero.x + TILE_WIDTH / 2, hero.y + TILE_HEIGHT / 2), 
				FlxPoint.get(tileCoordX * TILE_WIDTH + TILE_WIDTH/2, tileCoordY * TILE_HEIGHT + TILE_HEIGHT/2));
			if (nodes != null) {
				path.start(hero, nodes);
				movementMarker.loadGraphic(AssetPaths.marker_move__png, false, 16, 16);
			}else {
				movementMarker.loadGraphic(AssetPaths.marker_stop__png, false, 16, 16);
			}
			}else {
				movementMarker.loadGraphic(AssetPaths.marker_stop__png, false, 16, 16);
				}
			movementMarker.setPosition(tileCoordX * TILE_WIDTH, tileCoordY * TILE_HEIGHT);
		}
		
		// Queen Hero Animation
		if (!path.finished && path.nodes!=null) {
			if (path.angle == 0 || path.angle == 45 || path.angle == -45) {
				hero.animation.play("up");
			}
			if (path.angle == 180 || path.angle == -135 || path.angle == 135) {
				hero.animation.play("down");
			}
			if (path.angle == 90) {
				hero.animation.play("right");
			}
			if (path.angle == -90) {
				hero.animation.play("left");
			}
		} else {
			hero.animation.curAnim.curFrame = 0;
			hero.animation.curAnim.stop();
		}
		
		///////////////
		// Collisions
		///////////////
		// Health Potion
		FlxG.overlap(hero, potions, onPotionCollision);
		// king
		FlxG.overlap(hero, king, onKingCollision);
		// zombie
		var i:Int;
		for (i in 0...enemies.length) {
			FlxG.overlap(hero, enemies[i], onEnemyCollision);
		}
		
		if (currentAction == Standing) {
			currentAction = Walking;
		}
		
	}
	
	private function spawnPotion(x:Int, y:Int):Void{
		var potion:Potion = new Potion();
		potion.x = x * TILE_WIDTH;
		potion.y = y * TILE_HEIGHT;
		potions.add(potion);
	}
	
	private function onKingCollision(hero:FlxSprite, king:King):Void {
		if (king.exists && hero.exists) {
			hero.active = false;
			currentAction = Combat;
			menuWin.visible = true;
			
		}
	}
	
	private function onPotionCollision(hero:FlxSprite, potion:Potion):Void {
		if (potion.exists && hero.exists) {
			potion.kill();
			hud.addHealth(1);
		}
	}
	
	private function onEnemyCollision(hero:FlxSprite, enemy:Enemy):Void {
		if (enemy.exists && hero.exists && hero.active && enemy.active) {
			hero.active = false;
			enemy.active = false;
			currentAction = Combat;
			startCombat(enemy);
		}
	}
	
	private function addEnemy(x:Int, y:Int):Void {
		var enemy:Enemy = new Enemy(tileMap, hero);
		enemy.x = x * TILE_WIDTH;
		enemy.y = y * TILE_HEIGHT;
		enemy.health = 6;
		enemies.push(enemy);
		add(enemy);
	}
	
	private function addKing(x:Int, y:Int):Void {
		king = new King(tileMap, hero);
		king.x = x * TILE_WIDTH;
		king.y = y * TILE_HEIGHT;
		add(king);
	}
	
	//////////////
	// Combat
	/////////////
	private function startCombat(enemy:Enemy):Void {
		combatWindow.active = true;
		combatWindow.visible = true;
		if (combatHide!=null && combatHide.active) {
			combatHide.cancel();
		}
		FlxTween.tween(combatWindow, { y: FlxG.height / 2 - 40 }, 1, 
			{ type: FlxTween.ONESHOT, ease: FlxEase.quadOut } );
		combatWindow.y = -200;
		combatWindow.fight(enemy);
	}
	
	public function winCombat(enemy:Enemy):Void {
		endCombat(enemy);
	}

	public function endCombat(enemy:Enemy):Void {
		enemy.kill();
		combatHide = FlxTween.tween(combatWindow, { y: -200 }, 1, 
			{ type: FlxTween.ONESHOT, ease: FlxEase.quadIn, complete: hideCombat} );
		hero.active = true;
		currentAction = Standing;
	}
	
	public static function escWindowVisible(visible:Bool):Void {
		escWindow.visible = visible;
	}
	
	public static function rulesWindowVisible(visible:Bool):Void {
		rulesWindow.visible = visible;
	}
	
	public static function heroActive(active:Bool):Void {
		hero.active = active;
	}
	
	public static function  heroCurrentState(state:Bool)
	{
		// true = walking , false = combat
		if (state == true) {
			currentAction = Walking;
		}else {
			currentAction = Combat;
		}
		
	}
	
	public static function unPause() {
			hero.active = true;
			currentAction = Walking;
	}
	
	private function hideCombat(tween:FlxTween):Void {
		combatWindow.active = false;
		combatWindow.visible = false;	
	}
	
	public static function menuLooseVisible(visisble:Bool):Void {
		menuLoose.visible = visisble;
	}
	
	//////////////
	// Gamepad support 
	/////////////
	private function gamepadControls():Void
	{
		if (_gamePad.pressed(XboxButtonID.A))
		{
			trace("The A button of the Xbox 360 controller is pressed.");
		}
		
		if (_gamePad.pressed(XboxButtonID.B))
		{
			trace("The B button of the Xbox 360 controller is pressed.");
		}

		
		if (_gamePad.getAxis(XboxButtonID.LEFT_ANALOGUE_X) != 0)
		{
			trace("The x axis of the left analogue stick of the Xbox 360 controller has been moved.");
		}
	}
	
		function setEnabled(enabled:Bool)
	{
	}
	
	function getGamepadIndex(gamepad:FlxGamepad)
	{
		return [for (i in 0...10) FlxG.gamepads.getByID(i)].indexOf(gamepad);
	}
	
	function updateConnectedGamepads(force:Bool = false)
	{
		var gamepads = [for (i in 0...10) FlxG.gamepads.getByID(i)];
		var maxIndex = gamepads.length;
		var i = gamepads.length;
		while (maxIndex-- > 0)
		{
			if (gamepads[maxIndex] != null)
				break;
		}
		
		gamepads.splice(maxIndex + 1, gamepads.length);
		
		//if (force || !this.gamepads.equals(gamepads))
		//{
		//	this.gamepads = gamepads;
			//updateGamepadRadioGroup();
		//}
	}
	
	//////////////
	// Gamepad support end
	/////////////
}