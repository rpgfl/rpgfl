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
    private var _playerOriginX:Int;
    private var _playerOriginY:Int;
    private var _cameraOffsetX:Int;
    private var _cameraOffsetY:Int;
    private var _moveIntoSquareX:Int;
    private var _moveIntoSquareY:Int;
    private var _lastKeyPress:Int;
    private var _currentKeyPress:Int;
    private var _keyDown:Bool;
    private var playerGraphic:Sprite;
    
    public var map:Map;
    
    public function new()
    {
        super();
        
        _cameraOffsetX = 0;
        _cameraOffsetY = 0;
        _moveIntoSquareX = 0;
        _moveIntoSquareY = 0;
        
        _lastTime = 0;
        _player = new Player();
        _player.tileX = 3;
        _player.tileY = 1;
        
        playerGraphic = new Sprite();
        playerGraphic.graphics.clear();
        playerGraphic.graphics.beginFill(0x999999);
        playerGraphic.graphics.drawRect(0, 0, 32, 32);
        
        addChild(playerGraphic);
        
        _playerOriginX = Std.int((Lib.current.stage.stageWidth - 32) / 2);
        _playerOriginY = Std.int((Lib.current.stage.stageHeight - 32) / 2);
        
        playerGraphic.x = _playerOriginX = Math.floor(_playerOriginX / 32) * 32;
        playerGraphic.y = _playerOriginY = Math.floor(_playerOriginY / 32) * 32;
        
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_DOWN, _stage_onKeyDown);
        Lib.current.stage.addEventListener(KeyboardEvent.KEY_UP, _stage_onKeyUp);
        
        addEventListener(Event.ENTER_FRAME, _rpg_onEnterFrame);
    }
    
    private function _rpg_onEnterFrame(e:Event)
    {
        var delta = Lib.getTimer() - _lastTime;
        
        var speed = 0.15;
        var deltaMoveValue = Std.int(delta * speed);
        var canMove = false;
        
        var cellX = _playerOriginX - Math.floor(_cameraOffsetX / 32) * 32;
        var cellY = _playerOriginY - Math.floor(_cameraOffsetY / 32) * 32;
        
        if (_currentKeyPress == Keyboard.S || _currentKeyPress == Keyboard.D)
        {
            cellX = _playerOriginX - Math.ceil(_cameraOffsetX / 32) * 32;
            cellY = _playerOriginY - Math.ceil(_cameraOffsetY / 32) * 32;
        }
        
        var moveIntoCellX = cellX;
        var moveIntoCellY = cellY;
        
        if (_currentKeyPress == Keyboard.W)
        {
            moveIntoCellY = cellY - 32;
        }
        else if (_currentKeyPress == Keyboard.A)
        {
            moveIntoCellX = cellX - 32;
        }
        else if (_currentKeyPress == Keyboard.S)
        {
            moveIntoCellY = cellY + 32;
        }
        else if (_currentKeyPress == Keyboard.D)
        {
            moveIntoCellX = cellX + 32;
        }
        
        var tile = map.getTileAtPosition(0, moveIntoCellX, moveIntoCellY);
        if (tile != null)
        {
            if (map.tilesetData[0].canPassTile[tile.id])
            {
                canMove = true;
            }
        }
        
        if (_keyDown)
        {
            if (_currentKeyPress == Keyboard.W)
            {
                if (canMove)
                {
                    if (_cameraOffsetX == _moveIntoSquareX)
                        _cameraOffsetY += deltaMoveValue;
                    else
                    {
                        moveCameraPos(deltaMoveValue);
                    }
                }
            }
            else if (_currentKeyPress == Keyboard.A)
            {
                if (canMove)
                {
                    if (_cameraOffsetY == _moveIntoSquareY)
                        _cameraOffsetX += deltaMoveValue;
                    else
                    {
                        moveCameraPos(deltaMoveValue);
                    }
                }
            }
            else if (_currentKeyPress == Keyboard.S)
            {
                if (canMove)
                {
                    if (_cameraOffsetX == _moveIntoSquareX)
                        _cameraOffsetY -= deltaMoveValue;
                    else
                    {
                        moveCameraPos(deltaMoveValue);
                    }
                }
            }
            else if (_currentKeyPress == Keyboard.D)
            {
                if (canMove)
                {
                    if (_cameraOffsetY == _moveIntoSquareY)
                        _cameraOffsetX -= deltaMoveValue;
                    else
                    {
                        moveCameraPos(deltaMoveValue);
                    }
                }
            }
        }
        else
        {
            moveCameraPos(deltaMoveValue);
        }
        
        map.tilemap.x = _cameraOffsetX;
        map.tilemap.y = _cameraOffsetY;
        
        _lastTime = Lib.getTimer();
    }
    
    public function showMap(file:String)
    {
        if (map == null)
        {
            map = new Map(file);
            setPlayerLocation(_player.tileX, _player.tileY);
            addChildAt(map.tilemap, 0);
        }
        else
        {
            map.switchMap(file);
        }
    }
    
    private function moveCameraPos(deltaMoveValue:Int)
    {
        if (_lastKeyPress == Keyboard.W)
        {
            if (_cameraOffsetY != _moveIntoSquareY)
            {
                if (_cameraOffsetY + deltaMoveValue > _moveIntoSquareY)
                {
                    _cameraOffsetY = _moveIntoSquareY;
                }
                else
                    _cameraOffsetY += deltaMoveValue;
            }
        }
        else if (_lastKeyPress == Keyboard.A)
        {
            if (_cameraOffsetX != _moveIntoSquareX)
            {
                if (_cameraOffsetX + deltaMoveValue > _moveIntoSquareX)
                {
                    _cameraOffsetX = _moveIntoSquareX;
                }
                else
                    _cameraOffsetX += deltaMoveValue;
            }
        }
        else if (_lastKeyPress == Keyboard.S)
        {
            if (_cameraOffsetY != _moveIntoSquareY)
            {
                if (_cameraOffsetY - deltaMoveValue < _moveIntoSquareY)
                {
                    _cameraOffsetY = _moveIntoSquareY;
                }
                else
                    _cameraOffsetY -= deltaMoveValue;
            }
        }
        else if (_lastKeyPress == Keyboard.D)
        {
            if (_cameraOffsetX != _moveIntoSquareX)
            {
                if (_cameraOffsetX - deltaMoveValue < _moveIntoSquareX)
                {
                    _cameraOffsetX = _moveIntoSquareX;
                }
                else
                    _cameraOffsetX -= deltaMoveValue;
            }
        }
    }
    
    private function _stage_onKeyUp(e:KeyboardEvent)
    {
        _keyDown = false;
        
        _lastKeyPress = e.keyCode;
        
        setMoveIntoSquare();
    }
    
    private function setMoveIntoSquare()
    {
        if (_lastKeyPress == Keyboard.W)
        {
            _moveIntoSquareY = Math.ceil(_cameraOffsetY / 32) * 32;
        }
        else if (_lastKeyPress == Keyboard.A)
        {
            _moveIntoSquareX = Math.ceil(_cameraOffsetX / 32) * 32;
        }
        else if (_lastKeyPress == Keyboard.S)
        {
            _moveIntoSquareY = Math.floor(_cameraOffsetY / 32) * 32;
        }
        else if (_lastKeyPress == Keyboard.D)
        {
            _moveIntoSquareX = Math.floor(_cameraOffsetX / 32) * 32;
        }
    }
    
    private function _stage_onKeyDown(e:KeyboardEvent)
    {
        _keyDown = true;
        
        if (_lastKeyPress != 0)
        {
            _lastKeyPress = e.keyCode;
        }
        
        _currentKeyPress = e.keyCode;
    }
    
    private function setPlayerLocation(x:Int, y:Int)
    {
        _cameraOffsetX = Std.int(((Lib.current.stage.stageWidth - 32) / 2) - (x * 32));
        _cameraOffsetY = Std.int(((Lib.current.stage.stageHeight - 32) / 2) - (y * 32));
        
        _moveIntoSquareY = Math.floor(_cameraOffsetY / 32) * 32;
        _moveIntoSquareX = Math.floor(_cameraOffsetX / 32) * 32;
    }
    
}