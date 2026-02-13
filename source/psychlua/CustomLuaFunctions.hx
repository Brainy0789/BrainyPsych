package psychlua;

import openfl.Lib;

class CustomLuaFunctions
{
    public static function implement(funk:FunkinLua)
    {
        var lua:State = funk.lua;

        Lua_helper.add_callback(lua, 'setWindowName', function(name:String) {
            Lib.current.stage.window.title = name;
        });

        Lua_helper.add_callback(lua, 'quit', function(code:Int = 0) {
            Sys.exit(code);
        });

        Lua_helper.add_callback(lua, 'switchState', function(path:String, state:String) {
            var fullName = path + "." + state;
            var cls = Type.resolveClass(fullName);

            if (cls == null) {
                trace("State not found: " + fullName);
                return;
            }

            FlxG.switchState(cast cls);
        });
    }
}