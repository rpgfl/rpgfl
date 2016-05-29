package rpgfl.data;

class XpToLevel
{
    
    public static var MAX_LEVEL:Int = 100;
    
    @:isVar public static var XP_TO_NEXT(get, null):Array<Int>;
    private static function get_XP_TO_NEXT()
    {
        if (XP_TO_NEXT == null || XP_TO_NEXT.length != (MAX_LEVEL - 2))
        {
            XP_TO_NEXT = [];
            for (i in 0...(MAX_LEVEL - 2))
                XP_TO_NEXT.push(0);
        }
        return XP_TO_NEXT;
    }
    
}