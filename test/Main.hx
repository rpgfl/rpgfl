package;
import rpgfl.RPG;

import openfl.display.Sprite;

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