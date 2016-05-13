package rpgfl.events;
import openfl.geom.Point;

class EventScript
{
    
    public static function showText(portraitId:Int, text:String, position:Int = 2, background:Int = 0)
    {
        var c = new Command();
        c.type = SHOW_TEXT;
        c.onContinue = 'confirm';
        c.data0 = portraitId;
        c.data1 = text;
        c.data2 = position;
        c.data3 = background;
        return c;
    }
    
    public static function showChoices(values:Array<String>, cancelId:Int = 1)
    {
        var c = new Command();
        c.type = SHOW_CHOICES;
        c.onContinue = 'confirm';
        c.data0 = values;
        c.data1 = cancelId;
        return c;
    }
    
    public static function showScrollingText(text:String, speed:Int = 2, noFastForward:Bool = false)
    {
        var c = new Command();
        c.type = SHOW_SCROLLING_TEXT;
        c.onContinue = 'confirm';
        c.data0 = text;
        c.data1 = speed;
        c.data2 = noFastForward;
        return c;
    }
    
    public static function startTimer(interval:Int)
    {
        var c = new Command();
        c.type = START_TIMER;
        c.onContinue = 'onTimerComplete';
        c.data0 = interval;
        return c;
    }
    
    public static function stopTimer()
    {
        var c = new Command();
        c.type = STOP_TIMER;
        return c;
    }
    
    public static function changeGold(amount:Int)
    {
        var c = new Command();
        c.type = CHANGE_GOLD;
        c.data0 = amount;
        return c;
    }
    
    public static function changeItems(itemId:Int, amount:Int)
    {
        var c = new Command();
        c.type = CHANGE_ITEMS;
        c.data0 = itemId;
        c.data1 = amount;
        return c;
    }
    
    public static function changePartyMember(actorId:Int, addOrRemove:Bool = true, initialize:Bool = false)
    {
        var c = new Command();
        c.type = CHANGE_PARTY_MEMBER;
        c.data0 = actorId;
        c.data1 = addOrRemove;
        c.data2 = initialize;
        return c;
    }
    
    public static function changeHp(actorId:Int, amount:Int)
    {
        var c = new Command();
        c.type = CHANGE_HP;
        c.data0 = actorId;
        c.data1 = amount;
        return c;
    }
    
    public static function changeMp(actorId:Int, amount:Int)
    {
        var c = new Command();
        c.type = CHANGE_MP;
        c.data0 = actorId;
        c.data1 = amount;
        return c;
    }
    
    public static function changeState(actorId:Int, stateId:Int)
    {
        var c = new Command();
        c.type = CHANGE_STATE;
        c.data0 = actorId;
        c.data1 = stateId;
        return c;
    }
    
    public static function recoverAll(actorId:Int)
    {
        var c = new Command();
        c.type = RECOVER_ALL;
        c.data0 = actorId;
        return c;
    }
    
    public static function changeExp(actorId:Int, amount:Int, displayLevelUpMessage:Bool = false)
    {
        var c = new Command();
        c.type = CHANGE_EXP;
        c.data0 = actorId;
        c.data1 = amount;
        c.data2 = displayLevelUpMessage;
        return c;
    }
    
    public static function changeLevel(actorId:Int, amount:Int, displayLevelUpMessage:Bool = false)
    {
        var c = new Command();
        c.type = CHANGE_LEVEL;
        c.data0 = actorId;
        c.data1 = amount;
        c.data2 = displayLevelUpMessage;
        return c;
    }
    
    public static function changeSkills(actorId:Int, skillId:Int)
    {
        var c = new Command();
        c.type = CHANGE_SKILLS;
        c.data0 = actorId;
        c.data1 = skillId;
        return c;
    }
    
    public static function changeEquipment(actorId:Int, itemId:Int)
    {
        var c = new Command();
        c.type = CHANGE_EQUIPMENT;
        c.data0 = actorId;
        c.data1 = itemId;
        return c;
    }
    
    public static function changeName(actorId:Int, name:String)
    {
        var c = new Command();
        c.type = CHANGE_NAME;
        c.data0 = actorId;
        c.data1 = name;
        return c;
    }
    
    public static function changeRole(actorId:Int, roleId:Int)
    {
        var c = new Command();
        c.type = CHANGE_ROLE;
        c.data0 = actorId;
        c.data1 = roleId;
        return c;
    }
    
    public static function transferPlayer(mapId:Int, x:Int, y:Int, direction:Int = -1, fade:String = "normal")
    {
        var c = new Command();
        c.type = TRANSFER_PLAYER;
        c.data0 = mapId;
        c.data1 = x;
        c.data2 = y;
        c.data3 = direction;
        c.data4 = fade;
        return c;
    }
    
    public static function setVehicleLocation(vehicleId:Int, mapId:Int, x:Int, y:Int)
    {
        var c = new Command();
        c.type = SET_VEHICLE_LOCATION;
        c.data0 = vehicleId;
        c.data1 = mapId;
        c.data2 = x;
        c.data3 = y;
        return c;
    }
    
    public static function setEventLocation(eventId:Int, mapId:Int, x:Int, y:Int, direction:Int = -1)
    {
        var c = new Command();
        c.type = SET_EVENT_LOCATION;
        c.data0 = eventId;
        c.data1 = mapId;
        c.data2 = x;
        c.data3 = y;
        c.data4 = direction;
        return c;
    }
    
    public static function scrollMap(x:Int, y:Int, speed:Int = 2)
    {
        var c = new Command();
        c.type = SCROLL_MAP;
        c.data0 = x;
        c.data1 = y;
        c.data2 = speed;
        return c;
    }
    
    public static function setMoveRoute(entityId:Int, points:Array<Point>, speed:Int = 2)
    {
        var c = new Command();
        c.type = SET_MOVE_ROUTE;
        c.data0 = entityId;
        c.data1 = points;
        c.data2 = speed;
        return c;
    }
    
    public static function enterVehicle(vehicleId:Int)
    {
        var c = new Command();
        c.type = ENTER_VEHICLE;
        c.data0 = vehicleId;
        return c;
    }
    
    public static function showBalloon(subject:Int, balloonType:Int = 0, wait:Bool = false)
    {
        var c = new Command();
        c.type = SHOW_BALLOON;
        c.onContinue = wait ? 'confirm' : '';
        c.data0 = subject;
        c.data1 = balloonType;
        return c;
    }
    
    public static function fadeOutScreen()
    {
        var c = new Command();
        c.type = FADEOUT_SCREEN;
        return c;
    }
    
    public static function fadeInScreen()
    {
        var c = new Command();
        c.type = FADEIN_SCREEN;
        return c;
    }
    
    public static function tintScreen(red:Int, green:Int, blue:Int, time:Int = 1000, wait:Bool = true)
    {
        var c = new Command();
        c.type = TINT_SCREEN;
        c.onContinue = wait ? 'onTimeComplete' : '';
        c.data0 = red;
        c.data1 = green;
        c.data2 = blue;
        c.data3 = time;
        return c;
    }
    
    public static function flashScreen(red:Int, green:Int, blue:Int, time:Int = 1000, wait:Bool = true)
    {
        var c = new Command();
        c.type = FLASH_SCREEN;
        c.onContinue = wait ? 'onTimeComplete' : '';
        c.data0 = red;
        c.data1 = green;
        c.data2 = blue;
        c.data3 = time;
        return c;
    }
    
    public static function shakeScreen(intensity:Int = 5, speed:Int = 5, wait:Bool = true)
    {
        var c = new Command();
        c.type = SHAKE_SCREEN;
        c.onContinue = wait ? 'onTimeComplete' : '';
        c.data0 = intensity;
        c.data1 = speed;
        return c;
    }
    
    public static function showPicture(pictureId:Int, displayOrder:Int, x:Int, y:Int, scaleX:Float = 1, scaleY:Float = 1, alpha:Float = 1)
    {
        var c = new Command();
        c.type = SHOW_PICTURE;
        c.data0 = pictureId;
        c.data1 = displayOrder;
        c.data2 = x;
        c.data3 = y;
        c.data4 = scaleX;
        c.data5 = scaleY;
        c.data6 = alpha;
        return c;
    }
    
    public static function movePicture(orderIndex:Int, x:Int, y:Int, time:Int = 1000, scaleX:Float = 1, scaleY:Float = 1, alpha:Float = 1, wait:Bool = true)
    {
        var c = new Command();
        c.type = MOVE_PICTURE;
        c.onContinue = wait ? 'onTimeComplete' : '';
        c.data0 = orderIndex;
        c.data1 = x;
        c.data2 = y;
        c.data3 = time;
        c.data4 = scaleX;
        c.data5 = scaleY;
        c.data6 = alpha;
        return c;
    }
    
    public static function rotatePicture(orderIndex:Int, angle:Float)
    {
        var c = new Command();
        c.type = ROTATE_PICTURE;
        c.data0 = orderIndex;
        c.data1 = angle;
        return c;
    }
    
    public static function tintPicture(orderIndex:Int, red:Int, green:Int, blue:Int, time:Int = 1000, wait:Bool = true)
    {
        var c = new Command();
        c.type = TINT_PICTURE;
        c.onContinue = wait ? 'onTimeComplete' : '';
        c.data0 = orderIndex;
        c.data1 = red;
        c.data2 = green;
        c.data3 = blue;
        c.data4 = time;
    }
    
}