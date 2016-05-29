package rpgfl.data;
import openfl.geom.Point;

class Animation
{
    
    public var id:Int;
    public var name:String;
    public var states:Array<AnimationState>;
    public var stateTargetLocation:Point;
    
    public function new() 
    {
        states = [];
    }
    
}