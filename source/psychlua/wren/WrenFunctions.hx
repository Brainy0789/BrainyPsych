package psychlua.wren;

import cpp.RawPointer;
import cpp.ConstCharStar;

class WrenFunctions
{
    /**
     * Called by Wren to bind a foreign method.
     */
    public static function bindForeignMethod(
        vm:RawPointer<WrenVM>,
        module:ConstCharStar,
        className:ConstCharStar,
        isStatic:Bool,
        signature:ConstCharStar
    ):WrenForeignMethodFn
    {
        // return the actual native method function
        return exampleMethod;
    }

    /**
     * Example foreign method.
     * IMPORTANT: must be exactly (vm) -> Void
     */
    public static function exampleMethod(
        vm:RawPointer<WrenVM>
    ):Void
    {
        // your implementation here
    }

    /**
     * Called by Wren to bind a foreign class.
     */
    public static function bindForeignClass(
        vm:RawPointer<WrenVM>,
        module:ConstCharStar,
        className:ConstCharStar
    ):WrenForeignClassMethods
    {
        return {
            allocate: allocate,
            finalize: finalize
        };
    }

    /**
     * Allocator for the foreign class.
     */
    public static function allocate(
        vm:RawPointer<WrenVM>
    ):Void
    {
        // allocation logic
    }

    /**
     * Finalizer for the foreign class.
     */
    public static function finalize(
        vm:RawPointer<WrenVM>
    ):Void
    {
        // cleanup logic
    }
}
