package rpgfl.data;

class State
{
    
    public var id:Int;
    public var name:String;
    public var icon:Int;
    public var restriction:Int;
    public var priority:Int;
    public var removeAtBattleEnd:Bool;
    public var removeByRestriction:Bool;
    public var autoRemoval:Bool;
    public var autoRemovalType:Int;
    public var autoRemoveAfterTurnsA:Int;
    public var autoRemoveAfterTurnsB:Int;
    public var removeByDamage:Float;
    public var removeByWalking:Int;
    public var features:Array<Feature>;
    
    public function new() 
    {
        features = [];
    }
    
}

@:enum
abstract StateRestriction(Int) from Int to Int
{
    var NONE:Int =          0;
    var ATTACK_ENEMY:Int =  1;
    var ATTACK_ANYONE:Int = 2;
    var ATTACK_ALLY:Int =   3;
    var CANNOT_MOVE:Int =   4;
}

@:enum
abstract StateAutoRemovalType(Int) from Int to Int
{
    var NONE:Int =          0;
    var ACTION_END:Int =    1;
    var TURN_END:Int =      2;
}