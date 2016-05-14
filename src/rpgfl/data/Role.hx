package rpgfl.data;

class Role
{
    
    public var name:String;
    
    private var _maxHp:Int;
    public var maxHp(get, null):Int;
    function get_maxHp() return _maxHp;
    
    private var _attack:Int;
    public var attack(get, null):Int;
    function get_attack() return _attack;
    
    private var _defense:Int;
    public var defense(get, null):Int;
    function get_defense() return _defense;
    
    private var _currentLevel:Int;
    public var currentLevel(get, null):Int;
    function get_currentLevel() return _currentLevel;
    
    private var _currentExperience:Int;
    public var currentExperience(get, null):Int;
    function get_currentExperience() return _currentExperience;
    
    private var _magic:Int;
    public var magic(get, null):Int;
    function get_magic() return _magic;
    
    private var _magicDefense:Int;
    public var magicDefense(get, null):Int;
    function get_magicDefense() return _magicDefense;
    
    private var _agility:Int;
    public var agility(get, null):Int;
    function get_agility() return _agility;
    
    private var _luck:Int;
    public var luck(get, null):Int;
    function get_luck() return _luck;
    
    public var spellIds:Array<Int>;
    public var spellLevelReqs:Array<Int>;
    public var features:Array<Feature>;
    
    public function new() 
    {
        spellIds = [];
        spellLevelReqs = [];
        features = [];
    }
    
}