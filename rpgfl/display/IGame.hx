package rpgfl.display;
import openfl.display.Sprite;

interface IGame 
{
    public function draw(state:Sprite):Void;
    public function update(time:Int):Void;
}