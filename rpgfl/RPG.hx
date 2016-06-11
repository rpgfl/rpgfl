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
    private var _player:Player;
    
    public var map:Map;
    
    public function new()
    {
        super();
        
        _lastTime = 0;
        _player = new Player();
        _player.tileX = 3;
        _player.tileY = 0;
        
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
            map.setPlayerLocation(_player.tileX, _player.tileY);
        }
        else
        {
            map.switchMap(file);
        }
    }
    
}