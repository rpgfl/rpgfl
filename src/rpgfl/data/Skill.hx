package rpgfl.data;

class Skill
{
    
    public var id:Int;
    public var name:String;
    public var iconId:Int;
    public var description:String;
    public var skillTypeId:Int;
    public var magicCost:Int;
    public var powerCost:Int;
    public var scope:Int;
    public var occasion:Int;
    public var speed:Int;
    public var success:Float;
    public var repeats:Int;
    public var powerGain:Int;
    public var hitType:Int;
    public var animationId:Int;
    public var usingMessage:String;
    public var requiredItemId1:Int;
    public var requiredItemId2:Int;
    public var damageType:Int;
    public var elementId:Int;
    public var formula:String;
    public var variance:Int;
    public var canCrit:Bool;
    public var alwaysCrit:Bool;
    public var effects:Array<SkillEffect>;
    
    public function new() 
    {
        effects = [];
    }
    
}

@:enum
abstract SkillScope(Int) from Int to Int
{
    var SCOPE_NONE:Int = 0;
    var SCOPE_ONE_ENEMY:Int = 1;
    var SCOPE_ALL_ENEMIES:Int = 2;
    var SCOPE_ONE_RANDOM_ENEMY:Int = 3;
    var SCOPE_TWO_RANDOM_ENEMY:Int = 4;
    var SCOPE_THREE_RANDOM_ENEMY:Int = 5;
    var SCOPE_FOUR_RANDOM_ENEMY:Int = 6;
    var SCOPE_ONE_ALLY:Int = 7;
    var SCOPE_ALL_ALLIES:Int = 8;
    var SCOPE_ONE_ALLY_DEAD:Int = 9;
    var SCOPE_ALL_ALLIES_DEAD:Int = 10;
    var SCOPE_USER:Int = 11;
}

@:enum
abstract SkillOccasion(Int) from Int to Int
{
    var OCCASION_ALWAYS:Int = 0;
    var OCCASION_INBATTLE:Int = 1;
    var OCCASION_INMENU:Int = 2;
    var OCCASION_NEVER:Int = 3;
}

@:enum
abstract SkillHitType(Int) from Int to Int
{
    var HIT_TYPE_CERTAIN:Int = 0;
    var HIT_TYPE_PHYSICAL:Int = 1;
    var HIT_TYPE_MAGICAL:Int = 2;
}

@:enum
abstract SkillDamageType(Int) from Int to Int
{
    var DAMAGE_TYPE_HEALTH_TAKE:Int = 0;
    var DAMAGE_TYPE_MAGIC_TAKE:Int = 1;
    var DAMAGE_TYPE_HEALTH_RECOVER:Int = 2;
    var DAMAGE_TYPE_MAGIC_RECOVER:Int = 3;
    var DAMAGE_TYPE_HEALTH_DRAIN:Int = 4;
    var DAMAGE_TYPE_MAGIC_DRAIN:Int = 5;
}