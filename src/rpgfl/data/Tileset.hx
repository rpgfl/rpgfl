package rpgfl.data;

class Tileset
{
    
    public var id:Int;
    public var name:String;
    public var graphicPages:Array<String>;
    public var canPassTile:Array<Array<Bool>>;
    public var canMoveUp:Array<Array<Bool>>;
    public var canMoveLeft:Array<Array<Bool>>;
    public var canMoveRight:Array<Array<Bool>>;
    public var canMoveDown:Array<Array<Bool>>;
    public var isLadder:Array<Array<Bool>>;
    public var isBush:Array<Array<Bool>>;
    public var isCounter:Array<Array<Bool>>;
    public var canHurt:Array<Array<Bool>>;
    
    public function new() 
    {
        graphicPages = [];
        canPassTile = [[]];
        canMoveUp = [[]];
        canMoveLeft = [[]];
        canMoveRight = [[]];
        canMoveDown = [[]];
        isLadder = [[]];
        isBush = [[]];
        isCounter = [[]];
        canHurt = [[]];
    }
    
}