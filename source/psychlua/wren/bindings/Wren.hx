package psychlua.wren.bindings;

#if (!cpp && macro)
#error 'Wren supports only C++ target platforms.'
#end

@:buildXml('<include name="externs/Build.xml" />')
@:include('wren.h')
@:unreflective
extern class Wren
{
	@:native('WREN_VERSION_MAJOR')
	static var VERSION_MAJOR:Int;

	@:native('WREN_VERSION_MINOR')
	static var VERSION_MINOR:Int;

	@:native('WREN_VERSION_PATCH')
	static var VERSION_PATCH:Int;

	@:native('::String(WREN_VERSION_STRING)')
	static var VERSION_STRING:String;

	@:native('WREN_VERSION_NUMBER')
	static var VERSION_NUMBER:Int;

	@:native('wrenGetVersionNumber')
	static function GetVersionNumber():Int;

	@:native('wrenInitConfiguration')
	static function InitConfiguration(configuration:cpp.RawPointer<WrenConfiguration>):Void;

	@:native('wrenNewVM')
	static function NewVM(configuration:cpp.RawPointer<WrenConfiguration>):cpp.RawPointer<WrenVM>;

	@:native('wrenFreeVM')
	static function FreeVM(vm:cpp.RawPointer<WrenVM>):Void;

	@:native('wrenCollectGarbage')
	static function CollectGarbage(vm:cpp.RawPointer<WrenVM>):Void;

	@:native('wrenInterpret')
	static function Interpret(vm:cpp.RawPointer<WrenVM>, module:cpp.ConstCharStar, source:cpp.ConstCharStar):WrenInterpretResult;

	@:native('wrenMakeCallHandle')
	static function MakeCallHandle(vm:cpp.RawPointer<WrenVM>, signature:cpp.ConstCharStar):cpp.RawPointer<WrenHandle>;

	@:native('wrenCall')
	static function Call(vm:cpp.RawPointer<WrenVM>, method:cpp.RawPointer<WrenHandle>):WrenInterpretResult;

	@:native('wrenReleaseHandle')
	static function ReleaseHandle(vm:cpp.RawPointer<WrenVM>, handle:cpp.RawPointer<WrenHandle>):Void;

	@:native('wrenGetSlotCount')
	static function GetSlotCount(vm:cpp.RawPointer<WrenVM>):Int;

	@:native('wrenEnsureSlots')
	static function EnsureSlots(vm:cpp.RawPointer<WrenVM>, numSlots:Int):Void;

	@:native('wrenGetSlotType')
	static function GetSlotType(vm:cpp.RawPointer<WrenVM>, slot:Int):WrenType;

	@:native('wrenGetSlotBool')
	static function GetSlotBool(vm:cpp.RawPointer<WrenVM>, slot:Int):Bool;

	@:native('wrenGetSlotBytes')
	static function GetSlotBytes(vm:cpp.RawPointer<WrenVM>, slot:Int, length:cpp.Star<Int>):cpp.ConstCharStar;

	@:native('wrenGetSlotDouble')
	static function GetSlotDouble(vm:cpp.RawPointer<WrenVM>, slot:Int):Float;

	@:native('wrenGetSlotForeign')
	static function GetSlotForeign(vm:cpp.RawPointer<WrenVM>, slot:Int):cpp.RawPointer<cpp.Void>;

	@:native('wrenGetSlotString')
	static function GetSlotString(vm:cpp.RawPointer<WrenVM>, slot:Int):cpp.ConstCharStar;

	@:native('wrenGetSlotHandle')
	static function GetSlotHandle(vm:cpp.RawPointer<WrenVM>, slot:Int):cpp.RawPointer<WrenHandle>;

	@:native('wrenSetSlotBool')
	static function SetSlotBool(vm:cpp.RawPointer<WrenVM>, slot:Int, value:Bool):Void;

	@:native('wrenSetSlotBytes')
	static function SetSlotBytes(vm:cpp.RawPointer<WrenVM>, slot:Int, bytes:cpp.ConstCharStar, length:cpp.SizeT):Void;

	@:native('wrenSetSlotDouble')
	static function SetSlotDouble(vm:cpp.RawPointer<WrenVM>, slot:Int, value:Float):Void;

	@:native('wrenSetSlotNewForeign')
	static function SetSlotNewForeign(vm:cpp.RawPointer<WrenVM>, slot:Int, classSlot:Int, size:cpp.SizeT):cpp.RawPointer<cpp.Void>;

	@:native('wrenSetSlotNewList')
	static function SetSlotNewList(vm:cpp.RawPointer<WrenVM>, slot:Int):Void;

	@:native('wrenSetSlotNewMap')
	static function SetSlotNewMap(vm:cpp.RawPointer<WrenVM>, slot:Int):Void;

	@:native('wrenSetSlotNull')
	static function SetSlotNull(vm:cpp.RawPointer<WrenVM>, slot:Int):Void;

	@:native('wrenSetSlotString')
	static function SetSlotString(vm:cpp.RawPointer<WrenVM>, slot:Int, text:cpp.ConstCharStar):Void;

	@:native('wrenSetSlotHandle')
	static function SetSlotHandle(vm:cpp.RawPointer<WrenVM>, slot:Int, handle:cpp.RawPointer<WrenHandle>):Void;

	@:native('wrenGetListCount')
	static function GetListCount(vm:cpp.RawPointer<WrenVM>, slot:Int):Int;

	@:native('wrenGetListElement')
	static function GetListElement(vm:cpp.RawPointer<WrenVM>, listSlot:Int, index:Int, elementSlot:Int):Void;

	@:native('wrenSetListElement')
	static function SetListElement(vm:cpp.RawPointer<WrenVM>, listSlot:Int, index:Int, elementSlot:Int):Void;

	@:native('wrenInsertInList')
	static function InsertInList(vm:cpp.RawPointer<WrenVM>, listSlot:Int, index:Int, elementSlot:Int):Void;

	@:native('wrenGetMapCount')
	static function GetMapCount(vm:cpp.RawPointer<WrenVM>, slot:Int):Int;

	@:native('wrenGetMapContainsKey')
	static function GetMapContainsKey(vm:cpp.RawPointer<WrenVM>, mapSlot:Int, keySlot:Int):Bool;

	@:native('wrenGetMapValue')
	static function GetMapValue(vm:cpp.RawPointer<WrenVM>, mapSlot:Int, keySlot:Int, valueSlot:Int):Void;

	@:native('wrenSetMapValue')
	static function SetMapValue(vm:cpp.RawPointer<WrenVM>, mapSlot:Int, keySlot:Int, valueSlot:Int):Void;

	@:native('wrenRemoveMapValue')
	static function RemoveMapValue(vm:cpp.RawPointer<WrenVM>, mapSlot:Int, keySlot:Int, removedValueSlot:Int):Void;

	@:native('wrenGetVariable')
	static function GetVariable(vm:cpp.RawPointer<WrenVM>, module:cpp.ConstCharStar, name:cpp.ConstCharStar, slot:Int):Void;

	@:native('wrenHasVariable')
	static function HasVariable(vm:cpp.RawPointer<WrenVM>, module:cpp.ConstCharStar, name:cpp.ConstCharStar):Bool;

	@:native('wrenHasModule')
	static function HasModule(vm:cpp.RawPointer<WrenVM>, module:cpp.ConstCharStar):Bool;

	@:native('wrenAbortFiber')
	static function AbortFiber(vm:cpp.RawPointer<WrenVM>, slot:Int):Void;

	@:native('wrenGetUserData')
	static function GetUserData(vm:cpp.RawPointer<WrenVM>):cpp.RawPointer<cpp.Void>;

	@:native('wrenSetUserData')
	static function SetUserData(vm:cpp.RawPointer<WrenVM>, userData:cpp.RawPointer<cpp.Void>):Void;
}