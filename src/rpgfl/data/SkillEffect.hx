package rpgfl.data;

class SkillEffect
{
    
    public var type:Int;
    public var data0:Dynamic;
    public var data1:Dynamic;
    
    public function new() 
    {
        
    }
    
}

@:enum
abstract SkillEffectType(Int) from Int to Int
{
    var EFFECT_TYPE_RECOVER_HP:Int = 0;
    var EFFECT_TYPE_RECOVER_MP:Int = 1;
    var EFFECT_TYPE_GAIN_POWER:Int = 2;
    var EFFECT_TYPE_ADD_STATE:Int = 3;
    var EFFECT_TYPE_REMOVE_STATE:Int = 4;
    var EFFECT_TYPE_ADD_BUFF:Int = 5;
    var EFFECT_TYPE_ADD_DEBUFF:Int = 6;
    var EFFECT_TYPE_REMOVE_BUFF:Int = 7;
    var EFFECT_TYPE_REMOVE_DEBUFF:Int = 8;
    var EFFECT_TYPE_SPECIAL_EFFECT:Int = 9;
    var EFFECT_TYPE_GROW:Int = 10;
    var EFFECT_TYPE_LEARN_SKILL:Int = 11;
    var EFFECT_TYPE_COMMON_EVENT:Int = 12;
}