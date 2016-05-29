package rpgfl.data;
import openfl.geom.Point;
import rpgfl.display.IBattle;

class Troop
{
    
    public var id:Int;
    public var name:String;
    public var enemyIds:Array<Int>;
    public var enemyLocations:Array<Point>;
    public var battleScript:String;
    
    public function new() 
    {
        
    }
    
}