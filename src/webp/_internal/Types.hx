package webp._internal;

#if cpp
import cpp.RawPointer;
import cpp.SizeT;

@:buildXml('<include name="C:/Users/Binpuki/Documents/GitHub/GhostGame/project/Build.xml" />')
@:include('webp/types.h')
@:unreflective
extern class Types
{
	@:native("WebPMalloc")
	static function WebPMalloc(size:SizeT):RawPointer<Void>;

	@:native("WebPFree")
	static function WebPFree(ptr:RawPointer<Void>):Void;
}
#end
