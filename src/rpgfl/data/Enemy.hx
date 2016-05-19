package rpgfl.data;

class Enemy
{
    
    public var id:Int;
    public var name:String;
    public var graphicId:Int;
    public var animationId:Int;
    
    private var _attributes:Attributes;
    public var attributes(get, null):Attributes;
    function get_attributes() return _attributes;
    
    public var rewardXP:Int;
    public var rewardMoney:Int;
    public var rewardItemIds:Array<Int>;
    public var rewardItemAmounts:Array<Int>;
    
    public var actions:Array<Action>;
    
    public function new() 
    {
        _attributes = new Attributes();
        rewardItemIds = [];
        rewardItemAmounts = [];
        actions = [];
    }
    
}