package rpgfl.data;

class Attributes
{
    
    public var maxHp:Int;
    public var attack:Int;
    public var defence:Int;
    public var magic:Int;
    public var magicDefence:Int;
    public var agility:Int;
    public var luck:Int;
    public var features:Array<Feature>;

    public function new() 
    {
        features = [];
    }
    
}