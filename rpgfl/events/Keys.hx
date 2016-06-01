package rpgfl.events;

class Keys
{
    
    public var keyCode:Int;
    public var isDown:Bool;
    public var hasReleased:Bool;
    
    public function new(code:Int)
    {
        keyCode = code;
    }
    
}