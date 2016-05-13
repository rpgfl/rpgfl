package rpgfl.display;
import openfl.Assets;
import openfl.display.BitmapData;
import openfl.geom.Point;
import rpgfl.events.Event;
import rpgfl.events.Command;
import rpgfl.events.CommandType;
import hscript.Parser;
import hscript.Interp;
import rpgfl.events.EventScript;

class Map
{
    
    private var _interp:Interp;
    private var _parser:Parser;

    public var name:String;
    public var displayName:String;
    public var tilesetId:Int;
    public var width:Int;
    public var height:Int;
    public var cellWidth:Int;
    public var cellHeight:Int;
    public var groundData:Array<Array<Int>>;
    public var note:String;
    
    public var scrollType:Int;
    public var battleback:Int;
    public var musicPlaylist:Array<Int>;
    public var ambiencePlaylist:Array<Int>;
    
    public var regions:Array<Array<Point>>;
    
    public var events:Array<Event>;
    public var eventQueue:Array<Command>;
    
    private var result:Dynamic;
    
    public function new()
    {
        super();
        
        musicPlaylist = [];
        ambiencePlaylist = [];
        groundData = [[]];
        regions = [[]];
        events = [];
        eventQueue = [];
        
        _interp = new Interp();
        _parser = new Parser();
        
        _parser.allowJSON = true;
        _interp.variables.set("showText", showText);
        
    }
    
    private function processEvents()
    {
        var c:Command = getNextCommand();
        
        switch (c.type)
        {
            case SHOW_TEXT:
                //TODO
            case SHOW_CHOICES:
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
    
}