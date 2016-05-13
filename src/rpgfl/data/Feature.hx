package rpgfl.data;

class Feature
{

    public var data0:Int;
    public var data1:Int;
    public var data2:Int;
    
    public function new() 
    {
        
    }
    
}

abstract FeatureType (Int) from Int to Int
{
    var ELEMENT_RATE:Int        = 1;
    var DEBUFF_RATE:Int         = 2;
    var STATE_RATE:Int          = 3;
    var STATE_RESIST:Int        = 4;
    var PARAMETER:Int           = 5;
    var EX_PARAMETER:Int        = 6;
    var SP_PARAMETER:Int        = 7;
    var ATTACK_ELEMENT:Int      = 8;
    var ATTACK_STATE:Int        = 9;
    var ATTACK_SPEED:Int        = 10;
    var ATTACK_TIMES:Int        = 11;
    var ADD_SKILL_TYPE:Int      = 12;
    var SEAL_SKILL_TYPE:Int     = 13;
    var ADD_SKILL:Int           = 14;
    var SEAL_SKILL:Int          = 15;
    var EQUIP_WEAPON:Int        = 16;
    var EQUIP_ARMOR:Int         = 17;
    var FIX_EQUIP:Int           = 18;
    var SEAL_EQUIP:Int          = 19;
    var SLOT_TYPE:Int           = 20;
    var ACTION_TIMES:Int        = 21;
    var SPECIAL_FLAG:Int        = 22;
    var COLLAPSE_EFFECT:Int     = 23;
    var PARTY_ABILITY:Int       = 24;
}