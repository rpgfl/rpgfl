package rpgfl;
import openfl.Lib;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import rpgfl.events.Keys;

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
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, _stage_onKeyDown);
    }
    
    private function _stage_onKeyDown(e:KeyboardEvent)
    {
        
    }
    
    private function _rpg_onEnterFrame(e:Event)
    {
        var delta = Lib.getTimer() - _lastTime;
        
        if (map != null)
        {
            
            map.update(this, delta);
        }
        
        _lastTime = Lib.getTimer();
    }
    
    public function showMap(file:String)
    {
        if (map == null)
        {
            map = new Map(file);
            map.draw(this);
        }
        else
        {
            map.switchMap(file);
        }
    }
    
}