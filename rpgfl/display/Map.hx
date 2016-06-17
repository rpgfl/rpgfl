package rpgfl.display;
import haxe.Constraints.Function;
import haxe.Json;

import hscript.Parser;
import hscript.Interp;

import motion.Actuate;

import openfl.Assets;
import openfl.Lib;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;
import openfl.display.Tilemap;
import openfl.display.TilemapLayer;
import openfl.display.Tileset;
import openfl.display.Tile;
import openfl.events.TimerEvent;
import openfl.geom.Rectangle;
import openfl.geom.Point;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.utils.Timer;

import rpgfl.data.ItemInventoryType;
import rpgfl.data.Tileset in RPGTileset;
import rpgfl.events.Event;
import rpgfl.events.Command;
import rpgfl.events.CommandType;
import rpgfl.events.EventScript;
import rpgfl.system.DataParser;

class Map
{

    public var name:String;
    public var displayName:String;
    public var width:Int;
    public var height:Int;
    public var note:String;
    
    public var scrollType:Int;
    public var battleback:Int;
    public var musicPlaylist:Array<Int>;
    public var ambiencePlaylist:Array<Int>;
    
    public var regions:Array<Array<Point>>;
    
    private var _tilemap:Tilemap;
    public var tilemap(get, null):Tilemap;
    function get_tilemap() return _tilemap;
    
    private var _mapWidth:Int;
    public var mapWidth(get, null):Int;
    function get_mapWidth() return _mapWidth;
    
    private var _mapHeight:Int;
    public var mapHeight(get, null):Int;
    function get_mapHeight() return _mapHeight;
    
    private var _mapData:Dynamic;
    private var _mapFile:String;
    private var _layerFiles:Array<String>;
    private var _tilesetData:Array<RPGTileset>;
    public var tilesetData(get, null):Array<RPGTileset>;
    function get_tilesetData() return _tilesetData;
    
    public function new(mapFile:String)
    {   
        musicPlaylist = [];
        ambiencePlaylist = [];
        regions = [[]];
        _layerFiles = [];
        _tilesetData = [];
        
        switchMap(mapFile);
    }
    
    public function switchMap(file:String)
    {
        _mapFile = file;
        _mapData = Json.parse(Assets.getText(_mapFile));
        
        _mapWidth = Std.int(_mapData.width * _mapData.tilewidth);
        _mapHeight = Std.int(_mapData.height * _mapData.tileheight);
        
        _tilemap = new Tilemap(_mapWidth, _mapHeight);
        
        _tilesetData = DataParser.loadLayersFromCSV(_tilemap, _mapData);
    }
    
    public function getTileAtPosition(layer:Int, x:Int, y:Int):Tile
    {
        var layer = _tilemap.getLayerAt(layer);
        for (i in 0...layer.numTiles)
        {
            var t = layer.getTileAt(i);
            if (t.x == x && t.y == y)
                return t;
        }
        return null;
    }
    
}