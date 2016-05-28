package rpgfl.display;
import haxe.Constraints.Function;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.geom.Point;
import rpgfl.events.Event;
import rpgfl.events.Command;
import rpgfl.events.CommandType;
import hscript.Parser;
import hscript.Interp;
import rpgfl.events.EventScript;

class Map implements IGame
{
    
    private var _interp:Interp;
    private var _parser:Parser;

    public var name:String;
    public var displayName:String;
    public var tilesetId:Int;
    public var width:Int;
    public var height:Int;
    public var tileData:Array<Array<Int>>;
    public var note:String;
    
    public var scrollType:Int;
    public var battleback:Int;
    public var musicPlaylist:Array<Int>;
    public var ambiencePlaylist:Array<Int>;
    
    public var regions:Array<Array<Point>>;
    
    public var events:Array<Event>;
    public var eventQueue:Array<Command>;
    
    private var result:Dynamic;
    private var pauseEventProcessing:Bool;
    
    public function new()
    {
        super();
        
        musicPlaylist = [];
        ambiencePlaylist = [];
        tileData = [[]];
        regions = [[]];
        events = [];
        eventQueue = [];
        pauseEventProcessing = false;
        
        _interp = new Interp();
        _parser = new Parser();
        
        _parser.allowJSON = true;
        _interp.variables.set("showText", showText);
        _interp.variables.set("showChoices", showChoices);
        _interp.variables.set("showScrollingText", showScrollingText);
        _interp.variables.set("startTimer", startTimer);
        _interp.variables.set("stopTimer", stopTimer);
        _interp.variables.set("changeGold", changeGold);
        _interp.variables.set("changeItems", changeItems);
        _interp.variables.set("changePartyMember", changePartyMember);
        _interp.variables.set("changeHp", changeHp);
        _interp.variables.set("changeMp", changeMp);
        _interp.variables.set("changeState", changeState);
        _interp.variables.set("recoverAll", recoverAll);
        _interp.variables.set("changeExp", changeExp);
        _interp.variables.set("changeLevel", changeLevel);
        _interp.variables.set("changeSkills", changeSkills);
        _interp.variables.set("changeEquipment", changeEquipment);
        _interp.variables.set("changeName", changeName);
        _interp.variables.set("changeRole", changeRole);
        _interp.variables.set("transferPlayer", transferPlayer);
        _interp.variables.set("setVehicleLocation", setVehicleLocation);
        _interp.variables.set("setEventLocation", setEventLocation);
        _interp.variables.set("scrollMap", scrollMap);
        _interp.variables.set("setMoveRoute", setMoveRoute);
        _interp.variables.set("enterVehicle", enterVehicle);
        _interp.variables.set("showBalloon", showBalloon);
        _interp.variables.set("fadeOutScreen", fadeOutScreen);
        _interp.variables.set("fadeInScreen", fadeInScreen);
        _interp.variables.set("tintScreen", tintScreen);
        _interp.variables.set("flashScreen", flashScreen);
        _interp.variables.set("shakeScreen", shakeScreen);
        _interp.variables.set("showPicture", showPicture);
        _interp.variables.set("movePicture", movePicture);
        _interp.variables.set("rotatePicture", rotatePicture);
        _interp.variables.set("tintPicture", tintPicture);
        _interp.variables.set("erasePicture", erasePicture);
        _interp.variables.set("setWeatherEffect", setWeatherEffect);
        _interp.variables.set("playBackgroundMusic", playBackgroundMusic);
        _interp.variables.set("fadeoutBackgroundMusic", fadeoutBackgroundMusic);
        _interp.variables.set("saveBackgroundMusic", saveBackgroundMusic);
        _interp.variables.set("replayBackgroundMusic", replayBackgroundMusic);
        _interp.variables.set("playBackgroundSound", playBackgroundSound);
        _interp.variables.set("fadeoutBackgroundSound", fadeoutBackgroundSound);
        _interp.variables.set("playMusicEffect", playMusicEffect);
        _interp.variables.set("playSoundEffect", playSoundEffect);
        _interp.variables.set("stopSoundEffect", stopSoundEffect);
        _interp.variables.set("startBattle", startBattle);
        _interp.variables.set("openShop", openShop);
        _interp.variables.set("openNameInput", openNameInput);
        _interp.variables.set("openMenuScreen", openMenuScreen);
        _interp.variables.set("openSaveScreen", openSaveScreen);
        _interp.variables.set("gameOver", gameOver);
        _interp.variables.set("openTitleScreen", openTitleScreen);
        _interp.variables.set("changeBattleMusic", changeBattleMusic);
        _interp.variables.set("changeBattleEndMusic", changeBattleEndMusic);
        _interp.variables.set("changeSaveAccess", changeSaveAccess);
        _interp.variables.set("changeMenuAccess", changeMenuAccess);
        _interp.variables.set("changeEncounter", changeEncounter);
        _interp.variables.set("changeFormation", changeFormation);
        _interp.variables.set("changeWindowColor", changeWindowColor);
        _interp.variables.set("changeActorGraphic", changeActorGraphic);
        _interp.variables.set("changeVehicleGraphic", changeVehicleGraphic);
        _interp.variables.set("playMovie", playMovie);
        _interp.variables.set("changeMapNameDisplay", changeMapNameDisplay);
        _interp.variables.set("changeTileset", changeTileset);
        _interp.variables.set("changeBattleback", changeBattleback);
        _interp.variables.set("changeParallaxBack", changeParallaxBack);
        _interp.variables.set("changeEnemyHp", changeEnemyHp);
        _interp.variables.set("changeEnemyMp", changeEnemyMp);
        _interp.variables.set("changeEnemyState", changeEnemyState);
        _interp.variables.set("enemyRecoverAll", enemyRecoverAll);
        _interp.variables.set("enemyAppear", enemyAppear);
        _interp.variables.set("enemyTransform", enemyTransform);
        _interp.variables.set("showBattleAnimation", showBattleAnimation);
        _interp.variables.set("forceAction", forceAction);
        _interp.variables.set("abortBattle", abortBattle);
        _interp.variables.set("playerControl", playerControl);
    }
    
    public function draw(state:Sprite)
    {
        
    }
    
    public function update(time:Int)
    {
        
    }
    
    private function processEvents()
    {
        var c:Command = getNextCommand();
        
        if (c == null)
            return;
        
        switch (c.type)
        {
            case SHOW_TEXT:
                //TODO
            case SHOW_CHOICES:
                //TODO
            case SHOW_SCROLLING_TEXT:
                //TODO
            case START_TIMER:
                //TODO
            case STOP_TIMER:
                //TODO
            case CHANGE_GOLD:
                //TODO
            case CHANGE_ITEMS:
                //TODO
            case CHANGE_PARTY_MEMBER:
                //TODO
            case CHANGE_HP:
                //TODO
            case CHANGE_MP:
                //TODO
            case CHANGE_STATE:
                //TODO
            case RECOVER_ALL:
                //TODO
            case CHANGE_EXP:
                //TODO
            case CHANGE_LEVEL:
                //TODO
            case CHANGE_SKILLS:
                //TODO
            case CHANGE_EQUIPMENT:
                //TODO
            case CHANGE_NAME:
                //TODO
            case CHANGE_ROLE:
                //TODO
            case TRANSFER_PLAYER:
                //TODO
            case SET_VEHICLE_LOCATION:
                //TODO
            case SET_EVENT_LOCATION:
                //TODO
            case SCROLL_MAP:
                //TODO
            case SET_MOVE_ROUTE:
                //TODO
            case SHOW_BALLOON:
                //TODO
            case FADEOUT_SCREEN:
                //TODO
            case FADEIN_SCREEN:
                //TODO
            case TINT_SCREEN:
                //TODO
            case FLASH_SCREEN:
                //TODO
            case SHAKE_SCREEN:
                //TODO
            case SHOW_PICTURE:
                //TODO
            case MOVE_PICTURE:
                //TODO
            case ROTATE_PICTURE:
                //TODO
            case TINT_PICTURE:
                //TODO
            case ERASE_PICTURE:
                //TODO
            case SET_WEATHER_EFFECTS:
                //TODO
            case PLAY_BGM:
                //TODO
            case FADEOUT_BGM:
                //TODO
            case SAVE_BGM:
                //TODO
            case REPLAY_BGM:
                //TODO
            case PLAY_BGS:
                //TODO
            case FADEOUT_BGS:
                //TODO
            case PLAY_ME:
                //TODO
            case PLAY_SE:
                //TODO
            case STOP_SE:
                //TODO
            case BATTLE_PROCESS:
                //TODO
            case SHOP_PROCESS:
                //TODO
            case NAME_INPUT_PROCESS:
                //TODO
            case OPEN_MENU_SCREEN:
                //TODO
            case OPEN_SAVE_SCREEN:
                //TODO
            case GAME_OVER:
                //TODO
            case RETURN_TO_TITLE_SCREEN:
                //TODO
            case CHANGE_BATTLE_BGM:
                //TODO
            case CHANGE_BATTLE_END_ME:
                //TODO
            case CHANGE_SAVE_ACCESS:
                //TODO
            case CHANGE_MENU_ACCESS:
                //TODO
            case CHANGE_ENCOUNTER:
                //TODO
            case ALLOW_CHANGE_FORMATION:
                //TODO
            case CHANGE_WINDOW_COLOR:
                //TODO
            case CHANGE_ACTOR_GRAPHIC:
                //TODO
            case CHANGE_VEHICLE_GRAPHIC:
                //TODO
            case PLAY_MOVIE:
                //TODO
            case SHOW_MAP_NAME_DISPLAY:
                //TODO
            case CHANGE_TILESET:
                //TODO
            case CHANGE_BATTLEBACK:
                //TODO
            case CHANGE_PARALLAX_BACK:
                //TODO
            case CHANGE_ENEMY_HP:
                //TODO
            case CHANGE_ENEMY_MP:
                //TODO
            case CHANGE_ENEMY_STATE:
                //TODO
            case ENEMY_RECOVER_ALL:
                //TODO
            case ENEMY_APPEAR:
                //TODO
            case ENEMY_TRANSFORM:
                //TODO
            case SHOW_BATTLE_ANIMATION:
                //TODO
            case FORCE_ACTION:
                //TODO
            case ABORT_BATTLE:
                //TODO
            case DISABLE_PLAYER_CONTROL:
                //TODO
            case ENTER_VEHICLE:
                //TODO
        }
    }
    
    private function getNextCommand()
    {
        var command:Command = null;
        if (eventQueue.length > 0)
        {
            command = eventQueue[0];
            eventQueue.splice(0, 1);
        }
        else
            return null;
        
        return command;
    }
    
    
    
    
    //Event Script API
    private function showText(portraitId:Int, text:String, position:Int = 2, background:Int = 0)
    {
        eventQueue.push(EventScript.showText(portraitId, text, position, background));
    }
    
    private function showChoices(values:Array<String>, cancelId:Int = 1)
    {
        eventQueue.push(EventScript.showChoices(values, cancelId));
    }
    
    private function showScrollingText(text:String, speed:Int = 2, noFastForward:Bool = false)
    {
        eventQueue.push(EventScript.showScrollingText(text, speed, noFastForward));
    }
    
    private function startTimer(interval:Int)
    {
        eventQueue.push(EventScript.startTimer(interval));
    }
    
    private function stopTimer()
    {
        eventQueue.push(EventScript.stopTimer());
    }
    
    private function changeGold(amount:Int)
    {
        eventQueue.push(EventScript.changeGold(amount));
    }
    
    private function changeItems(itemId:Int, amount:Int)
    {
        eventQueue.push(EventScript.changeItems(itemId, amount));
    }
    
    private function changePartyMember(actorId:Int, addOrRemove:Bool = true, initialize:Bool = false)
    {
        eventQueue.push(EventScript.changePartyMember(actorId, addOrRemove, initialize));
    }
    
    private function changeHp(actorId:Int, amount:Int)
    {
        eventQueue.push(EventScript.changeHp(actorId, amount));
    }
    
    private function changeMp(actorId:Int, amount:Int)
    {
        eventQueue.push(EventScript.changeMp(actorId, amount));
    }
    
    private function changeState(actorId:Int, stateId:Int)
    {
        eventQueue.push(EventScript.changeState(actorId, stateId));
    }
    
    private function recoverAll(actorId:Int)
    {
        eventQueue.push(EventScript.recoverAll(actorId));
    }
    
    private function changeExp(actorId:Int, amount:Int, displayLevelUpMessage:Bool = false)
    {
        eventQueue.push(EventScript.changeExp(actorId, amount, displayLevelUpMessage));
    }
    
    private function changeLevel(actorId:Int, amount:Int, displayLevelUpMessage:Bool = false)
    {
        eventQueue.push(EventScript.changeLevel(actorId, amount, displayLevelUpMessage));
    }
    
    private function changeSkills(actorId:Int, skillId:Int)
    {
        eventQueue.push(EventScript.changeSkills(actorId, skillId));
    }
    
    private function changeEquipment(actorId:Int, itemId:Int)
    {
        eventQueue.push(EventScript.changeEquipment(actorId, itemId));
    }
    
    private function changeName(actorId:Int, name:String)
    {
        eventQueue.push(EventScript.changeName(actorId, name));
    }
    
    private function changeRole(actorId:Int, roleId:Int)
    {
        eventQueue.push(EventScript.changeRole(actorId, roleId));
    }
    
    private function transferPlayer(mapId:Int, x:Int, y:Int, direction:Int = -1, fade:String = "normal")
    {
        eventQueue.push(EventScript.transferPlayer(mapId, x, y, direction, fade));
    }
    
    private function setVehicleLocation(vehicleId:Int, mapId:Int, x:Int, y:Int)
    {
        eventQueue.push(EventScript.setVehicleLocation(vehicleId, mapId, x, y));
    }
    
    private function setEventLocation(eventId:Int, mapId:Int, x:Int, y:Int, direction:Int = -1)
    {
        eventQueue.push(EventScript.setEventLocation(eventId, mapId, x, y, direction));
    }
    
    private function scrollMap(x:Int, y:Int, speed:Int = 2)
    {
        eventQueue.push(EventScript.scrollMap(x, y, speed));
    }
    
    private function setMoveRoute(entityId:Int, points:Array<Point>, speed:Int = 2)
    {
        eventQueue.push(EventScript.setMoveRoute(entityId, points, speed));
    }
    
    private function enterVehicle(vehicleId:Int)
    {
        eventQueue.push(EventScript.enterVehicle(vehicleId));
    }
    
    private function showBalloon(subject:Int, balloonType:Int = 0, wait:Bool = false)
    {
        eventQueue.push(EventScript.showBalloon(subject, balloonType, wait));
    }
    
    private function fadeOutScreen()
    {
        eventQueue.push(EventScript.fadeOutScreen());
    }
    
    private function fadeInScreen()
    {
        eventQueue.push(EventScript.fadeInScreen());
    }
    
    private function tintScreen(red:Int, green:Int, blue:Int, time:Int = 1000, wait:Bool = true)
    {
        eventQueue.push(EventScript.tintScreen(red, green, blue, time, wait));
    }
    
    private function flashScreen(red:Int, green:Int, blue:Int, time:Int = 1000, wait:Bool = true)
    {
        eventQueue.push(EventScript.flashScreen(red, green, blue, time, wait));
    }
    
    private function shakeScreen(intensity:Int = 5, speed:Int = 5, wait:Bool = true)
    {
        eventQueue.push(EventScript.shakeScreen(intensity, speed, wait));
    }
    
    private function showPicture(pictureId:Int, displayOrder:Int, x:Int, y:Int, scaleX:Float = 1, scaleY:Float = 1, alpha:Float = 1)
    {
        eventQueue.push(EventScript.showPicture(pictureId, displayOrder, x, y, scaleX, scaleY, alpha));
    }
    
    private function movePicture(orderIndex:Int, x:Int, y:Int, time:Int = 1000, scaleX:Float = 1, scaleY:Float = 1, alpha:Float = 1, wait:Bool = true)
    {
        eventQueue.push(EventScript.movePicture(orderIndex, x, y, time, scaleX, scaleY, alpha, wait));
    }
    
    private function rotatePicture(orderIndex:Int, angle:Float)
    {
        eventQueue.push(EventScript.rotatePicture(orderIndex, angle));
    }
    
    private function tintPicture(orderIndex:Int, red:Int, green:Int, blue:Int, time:Int = 1000, wait:Bool = true)
    {
        eventQueue.push(EventScript.tintPicture(orderIndex, red, green, blue, time, wait));
    }
    
    private function erasePicture(orderIndex:Int)
    {
        eventQueue.push(EventScript.erasePicture(orderIndex));
    }
    
    private function setWeatherEffect(weatherId:Int, power:Int = 9, time:Int = 1000, wait:Bool = true)
    {
        eventQueue.push(EventScript.setWeatherEffect(weatherId, power, time, wait));
    }
    
    private function playBackgroundMusic(soundId:Int)
    {
        eventQueue.push(EventScript.playBackgroundMusic(soundId));
    }
    
    private function fadeoutBackgroundMusic(seconds:Int = 4)
    {
        eventQueue.push(EventScript.fadeoutBackgroundMusic(seconds));
    }
    
    private function saveBackgroundMusic()
    {
        eventQueue.push(EventScript.saveBackgroundMusic());
    }
    
    private function replayBackgroundMusic()
    {
        eventQueue.push(EventScript.replayBackgroundMusic());
    }
    
    private function playBackgroundSound(soundId:Int)
    {
        eventQueue.push(EventScript.playBackgroundSound(soundId));
    }
    
    private function fadeoutBackgroundSound(seconds:Int = 4)
    {
        eventQueue.push(EventScript.fadeoutBackgroundSound(seconds));
    }
    
    private function playMusicEffect(soundId:Int)
    {
        eventQueue.push(EventScript.playMusicEffect(soundId));
    }
    
    private function playSoundEffect(soundId:Int)
    {
        eventQueue.push(EventScript.playSoundEffect(soundId));
    }
    
    private function stopSoundEffect()
    {
        eventQueue.push(EventScript.stopSoundEffect());
    }
    
    private function startBattle(encounterId:Int, canEscape:Bool = false, escapeCallback:Function = null, continueOnLoss:Bool = false, lossCallback:Function = null)
    {
        eventQueue.push(EventScript.startBattle(encounterId, canEscape, escapeCallback, continueOnLoss, lossCallback));
    }
    
    private function openShop(items:Array<Int>, prices:Array<Int>, allowSelling:Bool = true)
    {
        eventQueue.push(EventScript.openShop(items, prices, allowSelling));
    }
    
    private function openNameInput(actorId:Int, maxChars:Int = 12)
    {
        eventQueue.push(EventScript.openNameInput(actorId, maxChars));
    }
    
    private function openMenuScreen()
    {
        eventQueue.push(EventScript.openMenuScreen());
    }
    
    private function openSaveScreen()
    {
        eventQueue.push(EventScript.openSaveScreen());
    }
    
    private function gameOver()
    {
        eventQueue.push(EventScript.gameOver());
    }
    
    private function openTitleScreen()
    {
        eventQueue.push(EventScript.openTitleScreen());
    }
    
    private function changeBattleMusic(soundId:Int)
    {
        eventQueue.push(EventScript.changeBattleMusic(soundId));
    }
    
    private function changeBattleEndMusic(soundId:Int)
    {
        eventQueue.push(EventScript.changeBattleEndMusic(soundId));
    }
    
    private function changeSaveAccess(allow:Bool)
    {
        eventQueue.push(EventScript.changeSaveAccess(allow));
    }
    
    private function changeMenuAccess(allow:Bool)
    {
        eventQueue.push(EventScript.changeMenuAccess(allow));
    }
    
    private function changeEncounter(allow:Bool)
    {
        eventQueue.push(EventScript.changeEncounter(allow));
    }
    
    private function changeFormation(allow:Bool)
    {
        eventQueue.push(EventScript.changeFormation(allow));
    }
    
    private function changeWindowColor(red:Int, green:Int, blue:Int)
    {
        eventQueue.push(EventScript.changeWindowColor(red, green, blue));
    }
    
    private function changeActorGraphic(actorId:Int, portraitId:Int, spritesheetId:Int)
    {
        eventQueue.push(EventScript.changeActorGraphic(actorId, portraitId, spritesheetId));
    }
    
    private function changeVehicleGraphic(vehicleId:Int, spritesheetId:Int)
    {
        eventQueue.push(EventScript.changeVehicleGraphic(vehicleId, spritesheetId));
    }
    
    private function playMovie(movieId:Int)
    {
        eventQueue.push(EventScript.playMovie(movieId));
    }
    
    private function changeMapNameDisplay(show:Bool)
    {
        eventQueue.push(EventScript.changeMapNameDisplay(show));
    }
    
    private function changeTileset(tilesetId:Int)
    {
        eventQueue.push(EventScript.changeTileset(tilesetId));
    }
    
    private function changeBattleback(backgroundId:Int, foregroundId:Int)
    {
        eventQueue.push(EventScript.changeBattleback(backgroundId, foregroundId));
    }
    
    private function changeParallaxBack(backgroundId:Int, loopHorizontal:Bool = false, horizontalSpeed:Int = 0, loopVertical:Bool = false, verticalSpeed:Int = 0)
    {
        eventQueue.push(EventScript.changeParallaxBack(backgroundId, loopHorizontal, horizontalSpeed, loopVertical, verticalSpeed));
    }
    
    private function changeEnemyHp(enemyIndex:Int, amount:Int)
    {
        eventQueue.push(EventScript.changeEnemyHp(enemyIndex, amount));
    }
    
    private function changeEnemyMp(enemyIndex:Int, amount:Int)
    {
        eventQueue.push(EventScript.changeEnemyMp(enemyIndex, amount));
    }
    
    private function changeEnemyState(enemyIndex:Int, stateId:Int)
    {
        eventQueue.push(EventScript.changeEnemyState(enemyIndex, stateId));
    }
    
    private function enemyRecoverAll(enemyIndex:Int)
    {
        eventQueue.push(EventScript.enemyRecoverAll(enemyIndex));
    }
    
    private function enemyAppear(enemyIndex:Int)
    {
        eventQueue.push(EventScript.enemyAppear(enemyIndex));
    }
    
    private function enemyTransform(enemyIndex:Int, creatureId:Int)
    {
        eventQueue.push(EventScript.enemyTransform(enemyIndex, creatureId));
    }
    
    private function showBattleAnimation(enemyIndex:Int, animationId:Int)
    {
        eventQueue.push(EventScript.showBattleAnimation(enemyIndex, animationId));
    }
    
    private function forceAction(enemyOrActorId:Int, skillId:Int, targetIndex:Int)
    {
        eventQueue.push(EventScript.forceAction(enemyOrActorId, skillId, targetIndex));
    }
    
    private function abortBattle()
    {
        eventQueue.push(EventScript.abortBattle());
    }
    
    private function playerControl(enable:Bool)
    {
        eventQueue.push(EventScript.playerControl(enable));
    }
    
}