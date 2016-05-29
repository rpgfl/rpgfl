package rpgfl.system;
import haxe.Json;

import openfl.Assets;
import openfl.display.Tile;
import openfl.display.TilemapLayer;
import openfl.display.Tileset;
import openfl.Assets;
import openfl.geom.Rectangle;

class DataParser
{

    public static function loadLayerFromCSV(tilesetGraphic:String, cellWidth:Int, cellHeight:Int):TilemapLayer
    {
        var set = new Tileset(Assets.getBitmapData(tilesetGraphic));
        
        var cellsX:Int = Std.int(set.bitmapData.width / cellWidth);
        var cellsY:Int = Std.int(set.bitmapData.height / cellHeight);
        
        for (x in 0...cellsX)
        {
            for (y in 0...cellsY)
            {
                set.addRect(new Rectangle(x * cellWidth, y * cellHeight, cellWidth, cellHeight));
            }
        }
        
        var map = new TilemapLayer(set);
        
        return map;
    }
    
}