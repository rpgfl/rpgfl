package rpgfl.data;

class Role
{
    
    public var id:Int;
    public var name:String;
    
    private var _currentLevel:Int;
    public var currentLevel(get, null):Int;
    function get_currentLevel() return _currentLevel;
    
    private var _currentExperience:Int;
    public var currentExperience(get, null):Int;
    function get_currentExperience() return _currentExperience;
    
    private var _attributes:Attributes;
    public var attributes(get, null):Attributes;
    function get_attributes() return _attributes;
    
    public var spellIds:Array<Int>;
    public var spellLevelReqs:Array<Int>;
    
    public function new() 
    {
        spellIds = [];
        spellLevelReqs = [];
        features = [];
        _attributes = new Attributes();
    }
    
}