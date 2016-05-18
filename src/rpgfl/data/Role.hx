package rpgfl.data;

class Role
{
    
    public var id:Int;
    public var name:String;
    
    private var _maxHp:Int;
    public var maxHp(get, null):Int;
    function get_maxHp() return _maxHp;
    
    private var _attack:Int;
    public var attack(get, null):Int;
    function get_attack() return _attack;
    
    private var _defence:Int;
    public var defence(get, null):Int;
    function get_defence() return _defence;
    
    private var _currentLevel:Int;
    public var currentLevel(get, null):Int;
    function get_currentLevel() return _currentLevel;
    
    private var _currentExperience:Int;
    public var currentExperience(get, null):Int;
    function get_currentExperience() return _currentExperience;
    
    private var _magic:Int;
    public var magic(get, null):Int;
    function get_magic() return _magic;
    
    private var _magicDefence:Int;
    public var magicDefence(get, null):Int;
    function get_magicDefence() return _magicDefence;
    
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