package rpgfl.display;

interface IBattle 
{
    public function nextTurn():Void;
    public function nextInOrder():Void;
    public function update(time:Float):Void;
}