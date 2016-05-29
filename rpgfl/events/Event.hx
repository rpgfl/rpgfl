package rpgfl.events;

class Event
{
    
    public var id:Int;
    public var name:String;
    public var script:String;
    public var conditionScript:String;
    public var x:Int;
    public var y:Int;
    
    public var conversationId:Int;
    public var visible:Bool;
    public var graphicId:Int;
    public var triggerType:Int;
    public var traversable:Bool;
    
    public function new()
    {
        
    }
    
}