package rpgfl.data;

class Tileset
{
    
    public var id:Int;
    public var name:String;
    public var canPassTile:Array<Bool>;
    public var canMoveUp:Array<Bool>;
    public var canMoveLeft:Array<Bool>;
    public var canMoveRight:Array<Bool>;
    public var canMoveDown:Array<Bool>;
    public var isLadder:Array<Bool>;
    public var isBush:Array<Bool>;
    public var isCounter:Array<Bool>;
    public var canHurt:Array<Bool>;
    
    public function new() 
    {
        canPassTile = [];
        canMoveUp = [];
        canMoveLeft = [];
        canMoveRight = [];
        canMoveDown = [];
        isLadder = [];
        isBush = [];
        isCounter = [];
        canHurt = [];
    }
    
}