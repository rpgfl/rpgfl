package rpgfl.display;

typedef MapData =
{
    var width:Int;
	var height:Int;
    var tilewidth:Int;
    var tileheight:Int;
    var layers:Array<LayerData>;
}

typedef LayerData =
{
    var file:String;
    var tileset:String;
}