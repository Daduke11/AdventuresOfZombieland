package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Future;
import lime.app.Preloader;
import lime.app.Promise;
import lime.audio.AudioSource;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Image;
import lime.net.HTTPRequest;
import lime.system.CFFI;
import lime.text.Font;
import lime.utils.Bytes;
import lime.utils.UInt8Array;
import lime.Assets;

#if sys
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.events.IOErrorEvent;
import flash.events.ProgressEvent;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if (openfl && !flash)
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_nokiafc22_ttf);
		openfl.text.Font.registerFont (__ASSET__OPENFL__assets_fonts_arial_ttf);
		
		#end
		
		#if flash
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/map1.csv", __ASSET__assets_data_map1_csv);
		type.set ("assets/data/map1.csv", AssetType.TEXT);
		className.set ("assets/images/Enemy2.xcf", __ASSET__assets_images_enemy2_xcf);
		type.set ("assets/images/Enemy2.xcf", AssetType.BINARY);
		className.set ("assets/images/forest.png", __ASSET__assets_images_forest_png);
		type.set ("assets/images/forest.png", AssetType.IMAGE);
		className.set ("assets/images/forest1.png", __ASSET__assets_images_forest1_png);
		type.set ("assets/images/forest1.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/king.png", __ASSET__assets_images_king_png);
		type.set ("assets/images/king.png", AssetType.IMAGE);
		className.set ("assets/images/king.xcf", __ASSET__assets_images_king_xcf);
		type.set ("assets/images/king.xcf", AssetType.BINARY);
		className.set ("assets/images/king_sprite.txt", __ASSET__assets_images_king_sprite_txt);
		type.set ("assets/images/king_sprite.txt", AssetType.TEXT);
		className.set ("assets/images/marker_move.png", __ASSET__assets_images_marker_move_png);
		type.set ("assets/images/marker_move.png", AssetType.IMAGE);
		className.set ("assets/images/marker_move.xcf", __ASSET__assets_images_marker_move_xcf);
		type.set ("assets/images/marker_move.xcf", AssetType.BINARY);
		className.set ("assets/images/marker_stop.png", __ASSET__assets_images_marker_stop_png);
		type.set ("assets/images/marker_stop.png", AssetType.IMAGE);
		className.set ("assets/images/marker_stop.xcf", __ASSET__assets_images_marker_stop_xcf);
		type.set ("assets/images/marker_stop.xcf", AssetType.BINARY);
		className.set ("assets/images/potion.png", __ASSET__assets_images_potion_png);
		type.set ("assets/images/potion.png", AssetType.IMAGE);
		className.set ("assets/images/queen_sara.txt", __ASSET__assets_images_queen_sara_txt);
		type.set ("assets/images/queen_sara.txt", AssetType.TEXT);
		className.set ("assets/images/queen_walk.png", __ASSET__assets_images_queen_walk_png);
		type.set ("assets/images/queen_walk.png", AssetType.IMAGE);
		className.set ("assets/images/queen_walk.xcf", __ASSET__assets_images_queen_walk_xcf);
		type.set ("assets/images/queen_walk.xcf", AssetType.BINARY);
		className.set ("assets/images/sara 16x18 source.psd", __ASSET__assets_images_sara_16x18_source_psd);
		type.set ("assets/images/sara 16x18 source.psd", AssetType.BINARY);
		className.set ("assets/images/Sara_16x18_Preview.png", __ASSET__assets_images_sara_16x18_preview_png);
		type.set ("assets/images/Sara_16x18_Preview.png", AssetType.IMAGE);
		className.set ("assets/images/zombie.old.png", __ASSET__assets_images_zombie_old_png);
		type.set ("assets/images/zombie.old.png", AssetType.IMAGE);
		className.set ("assets/images/zombie.png", __ASSET__assets_images_zombie_png);
		type.set ("assets/images/zombie.png", AssetType.IMAGE);
		className.set ("assets/images/zombie.xcf", __ASSET__assets_images_zombie_xcf);
		type.set ("assets/images/zombie.xcf", AssetType.BINARY);
		className.set ("assets/images/zombie_art.txt", __ASSET__assets_images_zombie_art_txt);
		type.set ("assets/images/zombie_art.txt", AssetType.TEXT);
		className.set ("assets/music/Fantasy_Choir_1.wav", __ASSET__assets_music_fantasy_choir_1_wav);
		type.set ("assets/music/Fantasy_Choir_1.wav", AssetType.SOUND);
		className.set ("assets/music/Fantasy_Choir_2.mp3", __ASSET__assets_music_fantasy_choir_2_mp3);
		type.set ("assets/music/Fantasy_Choir_2.mp3", AssetType.MUSIC);
		className.set ("assets/music/Fantasy_Choir_source.txt", __ASSET__assets_music_fantasy_choir_source_txt);
		type.set ("assets/music/Fantasy_Choir_source.txt", AssetType.TEXT);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/hit.wav", __ASSET__assets_sounds_hit_wav);
		type.set ("assets/sounds/hit.wav", AssetType.SOUND);
		className.set ("assets/sounds/levelup.wav", __ASSET__assets_sounds_levelup_wav);
		type.set ("assets/sounds/levelup.wav", AssetType.SOUND);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		#elseif html5
		
		var id;
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/map1.csv";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/Enemy2.xcf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/forest.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/forest1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/king.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/king.xcf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/king_sprite.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/marker_move.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/marker_move.xcf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/marker_stop.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/marker_stop.xcf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/potion.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/queen_sara.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/queen_walk.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/queen_walk.xcf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/sara 16x18 source.psd";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/Sara_16x18_Preview.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/zombie.old.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/zombie.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/zombie.xcf";
		path.set (id, id);
		
		type.set (id, AssetType.BINARY);
		id = "assets/images/zombie_art.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/Fantasy_Choir_1.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/music/Fantasy_Choir_2.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Fantasy_Choir_source.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/hit.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/levelup.wav";
		path.set (id, id);
		
		type.set (id, AssetType.SOUND);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/fonts/nokiafc22.ttf";
		className.set (id, __ASSET__assets_fonts_nokiafc22_ttf);
		
		type.set (id, AssetType.FONT);
		id = "assets/fonts/arial.ttf";
		className.set (id, __ASSET__assets_fonts_arial_ttf);
		
		type.set (id, AssetType.FONT);
		
		
		var assetsPrefix = null;
		if (ApplicationMain.config != null && Reflect.hasField (ApplicationMain.config, "assetsPrefix")) {
			assetsPrefix = ApplicationMain.config.assetsPrefix;
		}
		if (assetsPrefix != null) {
			for (k in path.keys()) {
				path.set(k, assetsPrefix + path[k]);
			}
		}
		
		#else
		
		#if (windows || mac || linux)
		
		var useManifest = false;
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/map1.csv", __ASSET__assets_data_map1_csv);
		type.set ("assets/data/map1.csv", AssetType.TEXT);
		
		className.set ("assets/images/Enemy2.xcf", __ASSET__assets_images_enemy2_xcf);
		type.set ("assets/images/Enemy2.xcf", AssetType.BINARY);
		
		className.set ("assets/images/forest.png", __ASSET__assets_images_forest_png);
		type.set ("assets/images/forest.png", AssetType.IMAGE);
		
		className.set ("assets/images/forest1.png", __ASSET__assets_images_forest1_png);
		type.set ("assets/images/forest1.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/king.png", __ASSET__assets_images_king_png);
		type.set ("assets/images/king.png", AssetType.IMAGE);
		
		className.set ("assets/images/king.xcf", __ASSET__assets_images_king_xcf);
		type.set ("assets/images/king.xcf", AssetType.BINARY);
		
		className.set ("assets/images/king_sprite.txt", __ASSET__assets_images_king_sprite_txt);
		type.set ("assets/images/king_sprite.txt", AssetType.TEXT);
		
		className.set ("assets/images/marker_move.png", __ASSET__assets_images_marker_move_png);
		type.set ("assets/images/marker_move.png", AssetType.IMAGE);
		
		className.set ("assets/images/marker_move.xcf", __ASSET__assets_images_marker_move_xcf);
		type.set ("assets/images/marker_move.xcf", AssetType.BINARY);
		
		className.set ("assets/images/marker_stop.png", __ASSET__assets_images_marker_stop_png);
		type.set ("assets/images/marker_stop.png", AssetType.IMAGE);
		
		className.set ("assets/images/marker_stop.xcf", __ASSET__assets_images_marker_stop_xcf);
		type.set ("assets/images/marker_stop.xcf", AssetType.BINARY);
		
		className.set ("assets/images/potion.png", __ASSET__assets_images_potion_png);
		type.set ("assets/images/potion.png", AssetType.IMAGE);
		
		className.set ("assets/images/queen_sara.txt", __ASSET__assets_images_queen_sara_txt);
		type.set ("assets/images/queen_sara.txt", AssetType.TEXT);
		
		className.set ("assets/images/queen_walk.png", __ASSET__assets_images_queen_walk_png);
		type.set ("assets/images/queen_walk.png", AssetType.IMAGE);
		
		className.set ("assets/images/queen_walk.xcf", __ASSET__assets_images_queen_walk_xcf);
		type.set ("assets/images/queen_walk.xcf", AssetType.BINARY);
		
		className.set ("assets/images/sara 16x18 source.psd", __ASSET__assets_images_sara_16x18_source_psd);
		type.set ("assets/images/sara 16x18 source.psd", AssetType.BINARY);
		
		className.set ("assets/images/Sara_16x18_Preview.png", __ASSET__assets_images_sara_16x18_preview_png);
		type.set ("assets/images/Sara_16x18_Preview.png", AssetType.IMAGE);
		
		className.set ("assets/images/zombie.old.png", __ASSET__assets_images_zombie_old_png);
		type.set ("assets/images/zombie.old.png", AssetType.IMAGE);
		
		className.set ("assets/images/zombie.png", __ASSET__assets_images_zombie_png);
		type.set ("assets/images/zombie.png", AssetType.IMAGE);
		
		className.set ("assets/images/zombie.xcf", __ASSET__assets_images_zombie_xcf);
		type.set ("assets/images/zombie.xcf", AssetType.BINARY);
		
		className.set ("assets/images/zombie_art.txt", __ASSET__assets_images_zombie_art_txt);
		type.set ("assets/images/zombie_art.txt", AssetType.TEXT);
		
		className.set ("assets/music/Fantasy_Choir_1.wav", __ASSET__assets_music_fantasy_choir_1_wav);
		type.set ("assets/music/Fantasy_Choir_1.wav", AssetType.SOUND);
		
		className.set ("assets/music/Fantasy_Choir_2.mp3", __ASSET__assets_music_fantasy_choir_2_mp3);
		type.set ("assets/music/Fantasy_Choir_2.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/Fantasy_Choir_source.txt", __ASSET__assets_music_fantasy_choir_source_txt);
		type.set ("assets/music/Fantasy_Choir_source.txt", AssetType.TEXT);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/hit.wav", __ASSET__assets_sounds_hit_wav);
		type.set ("assets/sounds/hit.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/levelup.wav", __ASSET__assets_sounds_levelup_wav);
		type.set ("assets/sounds/levelup.wav", AssetType.SOUND);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		className.set ("assets/fonts/nokiafc22.ttf", __ASSET__assets_fonts_nokiafc22_ttf);
		type.set ("assets/fonts/nokiafc22.ttf", AssetType.FONT);
		
		className.set ("assets/fonts/arial.ttf", __ASSET__assets_fonts_arial_ttf);
		type.set ("assets/fonts/arial.ttf", AssetType.FONT);
		
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						onChange.dispatch ();
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if (requestedType == BINARY && (assetType == BINARY || assetType == TEXT || assetType == IMAGE)) {
				
				return true;
				
			} else if (requestedType == TEXT && assetType == BINARY) {
				
				return true;
				
			} else if (requestedType == null || path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		if (className.exists(id)) return AudioBuffer.fromBytes (cast (Type.createInstance (className.get (id), []), Bytes));
		else return AudioBuffer.fromFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getBytes (id:String):Bytes {
		
		#if flash
		
		switch (type.get (id)) {
			
			case TEXT, BINARY:
				
				return Bytes.ofData (cast (Type.createInstance (className.get (id), []), flash.utils.ByteArray));
			
			case IMAGE:
				
				var bitmapData = cast (Type.createInstance (className.get (id), []), BitmapData);
				return Bytes.ofData (bitmapData.getPixels (bitmapData.rect));
			
			default:
				
				return null;
			
		}
		
		return cast (Type.createInstance (className.get (id), []), Bytes);
		
		#elseif html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Bytes);
		else return Bytes.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Font {
		
		#if flash
		
		var src = Type.createInstance (className.get (id), []);
		
		var font = new Font (src.fontName);
		font.src = src;
		return font;
		
		#elseif html5
		
		return cast (Type.createInstance (className.get (id), []), Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Font);
			
		} else {
			
			return Font.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			return cast (Type.createInstance (fontClass, []), Image);
			
		} else {
			
			return Image.fromFile (path.get (id));
			
		}
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var loader = Preloader.loaders.get (path.get (id));
		
		if (loader == null) {
			
			return null;
			
		}
		
		var bytes = loader.bytes;
		
		if (bytes != null) {
			
			return bytes.getString (0, bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.getString (0, bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		//if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		//}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String):Future<AudioBuffer> {
		
		var promise = new Promise<AudioBuffer> ();
		
		#if (flash)
		
		if (path.exists (id)) {
			
			var soundLoader = new Sound ();
			soundLoader.addEventListener (Event.COMPLETE, function (event) {
				
				var audioBuffer:AudioBuffer = new AudioBuffer();
				audioBuffer.src = event.currentTarget;
				promise.complete (audioBuffer);
				
			});
			soundLoader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			soundLoader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			soundLoader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getAudioBuffer (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<AudioBuffer> (function () return getAudioBuffer (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadBytes (id:String):Future<Bytes> {
		
		var promise = new Promise<Bytes> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = Bytes.ofString (event.currentTarget.data);
				promise.complete (bytes);
				
			});
			loader.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			promise.completeWith (request.load (path.get (id) + "?" + Assets.cache.version));
			
		} else {
			
			promise.complete (getBytes (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Bytes> (function () return getBytes (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	public override function loadImage (id:String):Future<Image> {
		
		var promise = new Promise<Image> ();
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				promise.complete (Image.fromBitmapData (bitmapData));
				
			});
			loader.contentLoaderInfo.addEventListener (ProgressEvent.PROGRESS, function (event) {
				
				if (event.bytesTotal == 0) {
					
					promise.progress (0);
					
				} else {
					
					promise.progress (event.bytesLoaded / event.bytesTotal);
					
				}
				
			});
			loader.contentLoaderInfo.addEventListener (IOErrorEvent.IO_ERROR, promise.error);
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#elseif html5
		
		if (path.exists (id)) {
			
			var image = new js.html.Image ();
			image.onload = function (_):Void {
				
				promise.complete (Image.fromImageElement (image));
				
			}
			image.onerror = promise.error;
			image.src = path.get (id) + "?" + Assets.cache.version;
			
		} else {
			
			promise.complete (getImage (id));
			
		}
		
		#else
		
		promise.completeWith (new Future<Image> (function () return getImage (id)));
		
		#end
		
		return promise.future;
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = Bytes.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = Bytes.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = Bytes.readFile ("assets/manifest");
			#elseif (mac && java)
			var bytes = Bytes.readFile ("../Resources/manifest");
			#elseif (ios || tvos)
			var bytes = Bytes.readFile ("assets/manifest");
			#else
			var bytes = Bytes.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				if (bytes.length > 0) {
					
					var data = bytes.getString (0, bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								#if (ios || tvos)
								path.set (asset.id, "assets/" + asset.path);
								#else
								path.set (asset.id, asset.path);
								#end
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	public override function loadText (id:String):Future<String> {
		
		var promise = new Promise<String> ();
		
		#if html5
		
		if (path.exists (id)) {
			
			var request = new HTTPRequest ();
			var future = request.load (path.get (id) + "?" + Assets.cache.version);
			future.onProgress (function (progress) promise.progress (progress));
			future.onError (function (msg) promise.error (msg));
			future.onComplete (function (bytes) promise.complete (bytes.getString (0, bytes.length)));
			
		} else {
			
			promise.complete (getText (id));
			
		}
		
		#else
		
		promise.completeWith (loadBytes (id).then (function (bytes) {
			
			return new Future<String> (function () {
				
				if (bytes == null) {
					
					return null;
					
				} else {
					
					return bytes.getString (0, bytes.length);
					
				}
				
			});
			
		}));
		
		#end
		
		return promise.future;
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_map1_csv extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_enemy2_xcf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_forest_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_forest1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_king_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_king_xcf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_king_sprite_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_marker_move_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_marker_move_xcf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_marker_stop_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_marker_stop_xcf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_potion_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_queen_sara_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_queen_walk_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_queen_walk_xcf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_sara_16x18_source_psd extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_sara_16x18_preview_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_zombie_old_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_zombie_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_zombie_xcf extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_zombie_art_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_fantasy_choir_1_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_fantasy_choir_2_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_fantasy_choir_source_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hit_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_levelup_wav extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends flash.text.Font { }
@:keep @:bind #if display private #end class __ASSET__assets_fonts_arial_ttf extends flash.text.Font { }


#elseif html5

































@:keep #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font { public function new () { super (); name = "Nokia Cellphone FC Small"; } } 
@:keep #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font { public function new () { super (); name = "Arial"; } } 


#else



#if (windows || mac || linux || cpp)


@:file("assets/data/data-goes-here.txt") #if display private #end class __ASSET__assets_data_data_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/data/map1.csv") #if display private #end class __ASSET__assets_data_map1_csv extends lime.utils.Bytes {}
@:file("assets/images/Enemy2.xcf") #if display private #end class __ASSET__assets_images_enemy2_xcf extends lime.utils.Bytes {}
@:image("assets/images/forest.png") #if display private #end class __ASSET__assets_images_forest_png extends lime.graphics.Image {}
@:image("assets/images/forest1.png") #if display private #end class __ASSET__assets_images_forest1_png extends lime.graphics.Image {}
@:file("assets/images/images-go-here.txt") #if display private #end class __ASSET__assets_images_images_go_here_txt extends lime.utils.Bytes {}
@:image("assets/images/king.png") #if display private #end class __ASSET__assets_images_king_png extends lime.graphics.Image {}
@:file("assets/images/king.xcf") #if display private #end class __ASSET__assets_images_king_xcf extends lime.utils.Bytes {}
@:file("assets/images/king_sprite.txt") #if display private #end class __ASSET__assets_images_king_sprite_txt extends lime.utils.Bytes {}
@:image("assets/images/marker_move.png") #if display private #end class __ASSET__assets_images_marker_move_png extends lime.graphics.Image {}
@:file("assets/images/marker_move.xcf") #if display private #end class __ASSET__assets_images_marker_move_xcf extends lime.utils.Bytes {}
@:image("assets/images/marker_stop.png") #if display private #end class __ASSET__assets_images_marker_stop_png extends lime.graphics.Image {}
@:file("assets/images/marker_stop.xcf") #if display private #end class __ASSET__assets_images_marker_stop_xcf extends lime.utils.Bytes {}
@:image("assets/images/potion.png") #if display private #end class __ASSET__assets_images_potion_png extends lime.graphics.Image {}
@:file("assets/images/queen_sara.txt") #if display private #end class __ASSET__assets_images_queen_sara_txt extends lime.utils.Bytes {}
@:image("assets/images/queen_walk.png") #if display private #end class __ASSET__assets_images_queen_walk_png extends lime.graphics.Image {}
@:file("assets/images/queen_walk.xcf") #if display private #end class __ASSET__assets_images_queen_walk_xcf extends lime.utils.Bytes {}
@:file("assets/images/sara 16x18 source.psd") #if display private #end class __ASSET__assets_images_sara_16x18_source_psd extends lime.utils.Bytes {}
@:image("assets/images/Sara_16x18_Preview.png") #if display private #end class __ASSET__assets_images_sara_16x18_preview_png extends lime.graphics.Image {}
@:image("assets/images/zombie.old.png") #if display private #end class __ASSET__assets_images_zombie_old_png extends lime.graphics.Image {}
@:image("assets/images/zombie.png") #if display private #end class __ASSET__assets_images_zombie_png extends lime.graphics.Image {}
@:file("assets/images/zombie.xcf") #if display private #end class __ASSET__assets_images_zombie_xcf extends lime.utils.Bytes {}
@:file("assets/images/zombie_art.txt") #if display private #end class __ASSET__assets_images_zombie_art_txt extends lime.utils.Bytes {}
@:file("assets/music/Fantasy_Choir_1.wav") #if display private #end class __ASSET__assets_music_fantasy_choir_1_wav extends lime.utils.Bytes {}
@:file("assets/music/Fantasy_Choir_2.mp3") #if display private #end class __ASSET__assets_music_fantasy_choir_2_mp3 extends lime.utils.Bytes {}
@:file("assets/music/Fantasy_Choir_source.txt") #if display private #end class __ASSET__assets_music_fantasy_choir_source_txt extends lime.utils.Bytes {}
@:file("assets/music/music-goes-here.txt") #if display private #end class __ASSET__assets_music_music_goes_here_txt extends lime.utils.Bytes {}
@:file("assets/sounds/hit.wav") #if display private #end class __ASSET__assets_sounds_hit_wav extends lime.utils.Bytes {}
@:file("assets/sounds/levelup.wav") #if display private #end class __ASSET__assets_sounds_levelup_wav extends lime.utils.Bytes {}
@:file("assets/sounds/sounds-go-here.txt") #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/sounds/beep.mp3") #if display private #end class __ASSET__assets_sounds_beep_mp3 extends lime.utils.Bytes {}
@:file("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/sounds/flixel.mp3") #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends lime.utils.Bytes {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/nokiafc22.ttf") #if display private #end class __ASSET__assets_fonts_nokiafc22_ttf extends lime.text.Font {}
@:font("C:/HaxeToolkit/haxe/lib/flixel/3,3,12/assets/fonts/arial.ttf") #if display private #end class __ASSET__assets_fonts_arial_ttf extends lime.text.Font {}



#end
#end

#if (openfl && !flash)
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_nokiafc22_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_nokiafc22_ttf (); src = font.src; name = font.name; super (); }}
@:keep #if display private #end class __ASSET__OPENFL__assets_fonts_arial_ttf extends openfl.text.Font { public function new () { var font = new __ASSET__assets_fonts_arial_ttf (); src = font.src; name = font.name; super (); }}

#end

#end