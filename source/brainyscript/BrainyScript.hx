package brainyscript;

import brainyscript.*;

enum BrainyToken
{
    EMPTY;
}

class BrainyScript
{
    public static var instances:Map<String, BrainyScript> = new Map();
    public static var illegalChars:Array<String> = ['`','~','@','#','$','&','*','_', '\\'];
    private var tokens:Map<Int, BrainyToken> = new Map();

    public var fields:Map<String, Dynamic> = new Map();

    private function tokenize(code:String)
    {
        tokens = new Map();
        
        var inQuote = false;
        var pos = 0;

        for (char in code.split(''))
        {
            if (!inQuote)
            {
                //check for illegal characters only if outside of quote
                for (illegal in illegalChars)
                    if (char == illegal) errorPos(pos, 'Illegal character!');
            }
            pos++;
        }
    }
    
    public function new() {}

    private function errorPos(pos:Int, error:String)
    {
        Sys.println('ERROR at position $pos: $error');
    }

    private function errorLine(line:Int, error:String)
    {
        Sys.println('ERROR at line $line: $error');
    }

    public function execute(code:String)
    {
        var lines = code.split('\n');

        var line = 1;

        for (curLine in lines)
        {
            var r = ~/print\("([A-Z0-9])"\)/;

            if (r.match(curLine))
            {
                #if sys
                Sys.print(r.matched(0));
                #end
            }

            var r = ~/println\("([A-Z0-9])"\)/;

            if (r.match(curLine))
            {
                #if sys
                Sys.println(r.matched(0));
                #end
            }

            line++;
        }
    }
}