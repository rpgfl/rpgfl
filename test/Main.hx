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
        
        var game = new RPG();
        game.showMap("maps/WorldMap.json");
        
        addChild(game);
    }
    
}