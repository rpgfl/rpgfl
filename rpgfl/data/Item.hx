package rpgfl.data;

class Item
{
    
    public var id:Int;
    public var iconId:Int;
    public var name:String;
    public var description:String;
    public var typeId:Int;
    public var subtypeId:Int;
    public var price:Int;
    public var inventoryTypeId:Int;
    public var animation:Int;
    
    //Consumable-only variables
    public var scope:Int;
    public var occasion:Int;
    public var speed:Int;
    public var success:Float;
    public var repeats:Int;
    public var power:Int;
    public var hitType:Int;
    public var effects:Array<SkillEffect>;
    
    //Weapon/Armour-only variables
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
        effects = [];
    }
    
}