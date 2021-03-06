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

import rpgfl.data.Tileset in RPGTileset;

class DataParser
{
    
    public static function loadLayersFromCSV(map:Tilemap, mapData:Dynamic):Array<RPGTileset>
    {
        var cellWidth:Int = mapData.tilewidth;
        var cellHeight:Int = mapData.tileheight;
        
        var tilesets = new Array<RPGTileset>();
        
        if (mapData.tilesets != null)
        {
            for (i in 0...mapData.tilesets.length)
            {
                var ts = new RPGTileset();
                var current:Dynamic = mapData.tilesets[i];
                
                ts.id = current.id;
                ts.name = current.name;
                ts.canPassTile = current.canPassTile;
                tilesets.push(ts);
            }
        }
        
        for (i in 0...mapData.layers.length)
        {
            var layerData:Dynamic = mapData.layers[i];
            
            var set = new Tileset(Assets.getBitmapData(layerData.tileset));
            
            var cellsX:Int = Std.int(set.bitmapData.width / cellWidth);
            var cellsY:Int = Std.int(set.bitmapData.height / cellHeight);
            
            for (y in 0...cellsY)
            {
                for (x in 0...cellsX)
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
                    if (id == -1)
                    {
                        column++;
                        continue;
                    }
                    
                    var _y = row * cellWidth;
                    var _x = column * cellHeight;
                    var t = new Tile(id, _x, _y);
                    column++;
                    layer.addTile(t);
                }
                row++;
                column = 0;
            }
            
            map.addLayer(layer);
        }
        
        return tilesets;
    }
    
}