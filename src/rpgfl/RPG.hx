package rpgfl;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;

import rpgfl.display.Map;

class RPG extends Sprite
{
    
    private var _lastTime:Int;
    private var map:Map;
    
    public function new() 
    {
        super();
        
        map = new Map();
        map.draw(this);
        
        _lastTime = 0;
        
        addEventListener(Event.ENTER_FRAME, _rpg_onEnterFrame);
    }
    
    private function _rpg_onEnterFrame(e:Event)
    {
        var delta = Lib.getTimer() - _lastTime;
        map.update(delta);
        _lastTime = Lib.getTimer();
    }
    
}