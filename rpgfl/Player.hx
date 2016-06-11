package rpgfl;
import rpgfl.data.Actor;

class Player
{
    
    public var actors:Array<Actor>;
    public var mapId:Int;
    public var tileX:Int;
    public var tileY:Int;
    
    public function new() 
    {
        actors = [];
    }
    
}