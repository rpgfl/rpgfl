package rpgfl.system;
import haxe.Json;
import openfl.display.BitmapData;
import openfl.display.Tilemap;
import openfl.geom.Point;

import openfl.Assets;
import openfl.display.Tile;
import openfl.display.TilemapLayer;
import openfl.display.Tileset;
import openfl.Assets;
import openfl.geom.Rectangle;

class DataParser
{

    #if tilemap
    public static function loadLayerFromCSV(map:Tilemap, mapData:Dynamic)
    {
        var cellWidth:Int = mapData.tilewidth;
        var cellHeight:Int = mapData.tileheight;
        
        for (i in 0...mapData.layers.length)
        {
            var layerData:Dynamic = mapData.layers[i];
            
            var set = new Tileset(Assets.getBitmapData(layerData.tileset));
            
            var cellsX:Int = Std.int(set.bitmapData.width / cellWidth);
            var cellsY:Int = Std.int(set.bitmapData.height / cellHeight);
            
            for (x in 0...cellsX)
            {
                for (y in 0...cellsY)
                {
                    var _x = x * cellWidth;
                    var _y = y * cellHeight;
                    set.addRect(new Rectangle(_x, _y, cellWidth, cellHeight));
                }
            }
            
            var layer = new TilemapLayer(set);
            
            var lines:Array<String> = Assets.getText(layerData.file).split('\n');
            
            var row:Int = 0;
            var column:Int = 0;
            for (line in lines)
            {
                for (cell in line.split(','))
                {
                    var id:Int = Std.parseInt(cell);
                    var t = new Tile(id, row, column++);
                    layer.addTile(t);
                }
                row++;
                column = 0;
            }
            
            map.addLayer(layer);
        }
    }
    #else
    public static function loadLayerFromCSV(file:String, tilesetGraphic:String, cellWidth:Int, cellHeight:Int, width:Int, height:Int):BitmapData
    {
        var set = Assets.getBitmapData(tilesetGraphic);
        
        var cellsX:Int = Std.int(set.width / cellWidth);
        var cellsY:Int = Std.int(set.height / cellHeight);
        
        var indices:Array<Point> = [];
        for (x in 0...cellsX)
            for (y in 0...cellsY)
                indices.push(new Point(x * cellWidth, y * cellHeight));
        
        var lines:Array<String> = Assets.getText(file).split('\n');
        
        var layer = new BitmapData(width, height);
        
        var row:Int = 0;
        var column:Int = 0;
        for (line in lines)
        {
            for (cell in line.split(','))
            {
                var index:Int = Std.parseInt(cell);
                
                layer.copyPixels(set, new Rectangle(indices[index].x, indices[index].y, cellWidth, cellHeight), new Point(column++, row));
            }
            row++;
            column = 0;
        }
        
        return layer;
    }
    #end
    
}