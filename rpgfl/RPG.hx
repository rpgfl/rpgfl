package rpgfl;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;

import rpgfl.display.Map;

class RPG extends Sprite
{
    
    private var _lastTime:Int;
    public var map:Map;
    
    public function new() 
    {
        super();
        
        _lastTime = 0;
        
        addEventListener(Event.ENTER_FRAME, _rpg_onEnterFrame);
    }
    
    private function _rpg_onEnterFrame(e:Event)
    {
        var delta = Lib.getTimer() - _lastTime;
        
        if (map != null)
            map.update(delta);
        
        _lastTime = Lib.getTimer();
    }
    
    public function showMap(file:String)
    {
        if (map == null)
        {
            map = new Map(file);
            map.draw(this);
            
            width = map.mapWidth;
            height = map.mapHeight;
        }
        else
        {
            map.switchMap(file);
        }
    }
    
}