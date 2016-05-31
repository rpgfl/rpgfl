package;
import openfl.Assets;
import openfl.display.Tile;
import openfl.display.Tilemap;
import openfl.display.TilemapLayer;
import openfl.display.Tileset;
import openfl.geom.Rectangle;
import rpgfl.RPG;

import openfl.display.Sprite;
import openfl.events.Event;

class Main extends Sprite
{

    public function new() 
    {
        super();
        
        //var set = new Tileset(Assets.getBitmapData("img/Ground.png"));
        //set.addRect(new Rectangle(0, 0, 32, 32));
        //set.addRect(new Rectangle(64, 0, 32, 32));
        //
        //var layer = new TilemapLayer(set);
        //layer.addTile(new Tile(0, 0, 0));
        //layer.addTile(new Tile(0, 32, 0));
        //layer.addTile(new Tile(0, 64, 0));
        //layer.addTile(new Tile(0, 0, 32));
        //layer.addTile(new Tile(0, 32, 32));
        //layer.addTile(new Tile(0, 0, 64));
        //layer.addTile(new Tile(1, 64, 32));
        //layer.addTile(new Tile(1, 64, 64));
        //layer.addTile(new Tile(1, 32, 64));
        //
        //var map = new Tilemap(256, 256);
        //map.addLayer(layer);
        //
        //addChild(map);
        
        var game = new RPG();
        game.showMap("maps/WorldMap.json");
        
        addChild(game);
    }
    
}