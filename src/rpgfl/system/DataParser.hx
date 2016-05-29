package rpgfl.system;
import openfl.Assets;

import openfl.display.Tile;
import openfl.display.TilemapLayer;
import openfl.display.Tileset;
import openfl.Assets;
import openfl.geom.Rectangle;

class DataParser
{

    public static function loadLayerFromCSV(file:String, tilesetGraphic:String, cellWidth:Int, cellHeight:Int):TilemapLayer
    {
        var set = new Tileset(Assets.getBitmapData(tilesetGraphic));

        var cellsX:Int = set.bitmapData.width / cellWidth;
        var cellsY:Int = set.bitmapData.height / cellHeight;
        
        for (x in 0...cellsX)
        {
            for (y in 0...cellsY)
            {
                set.addRect(new Rectangle(x * cellWidth, y * cellHeight, cellWidth, cellHeight));
            }
        }
        
        var map = new TilemapLayer(set);
        
        var lines:Array<String> = Assets.getText(file).split('\n');
        var row:Int = 0;
        var column:Int = 0;
        for (line in lines)
        {
            for (cell in line.split(','))
            {
                map.addTile(new Tile(Std.parseInt(cell), row, column++));
            }
            row++;
        }
        
        return map;
    }
    
}