package rpgfl.data;

@:enum
abstract Element(Int) from Int to Int 
{
    var ELEMENT_NORMAL_ATTACK:Int = 0;
    var ELEMENT_NONE:Int = 1;
    var ELEMENT_PHYSICAL:Int = 2;
    var ELEMENT_ABSORB:Int = 3;
    var ELEMENT_FIRE:Int = 4;
    var ELEMENT_ICE:Int = 5;
    var ELEMENT_THUNDER:Int = 6;
    var ELEMENT_WATER:Int = 7;
    var ELEMENT_EARTH:Int = 8;
    var ELEMENT_WIND:Int = 9;
    var ELEMENT_HOLY:Int = 10;
    var ELEMENT_DARK:Int = 11;
}