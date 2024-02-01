package webp;

#if cpp
import cpp.Pointer;
import cpp.Stdlib;
import cpp.UInt8;
import sys.io.File;
import webp._internal.Decode;
#end
import haxe.io.Bytes;
import lime.graphics.Image;
import lime.graphics.ImageBuffer;
import lime.utils.Assets as LimeAssets;
import lime.utils.UInt8Array;
import openfl.Assets;
import openfl.display.BitmapData;

class WebP
{
	/**
		Creates a BitmapData instance from a WebP file at the specified path.
		@param	file		The asset path of the WebP
		@return		A new BitmapData object
	**/
	public static function getBitmapData(file:String):BitmapData
	{
		#if cpp
		var image:Image = getImage(file);
		if (image == null)
			return null;

		return BitmapData.fromImage(image);
		#elseif (js && html5)
		return Assets.getBitmapData(file);
		#else
		throw new Exception("WebP files are not supported on this platform!");
		#end
	}

	/**
		Creates an Image instance from a WebP file at the specified path.
		@param	file		The asset path of the WebP
		@return		A new Image object
	**/
	public static function getImage(file:String):Image
	{
		#if cpp
		return getImageFromBytes(File.getBytes(file));
		#elseif (js && html5)
		return LimeAssets.getImage(file);
		#else
		throw new Exception("WebP files are not supported on this platform!");
		#end
	}

	/**
		Creates a BitmapData instance from a WebP file converted from the given bytes.
		@param	file		The asset path of the WebP
		@return		A new Image object
	**/
	public static function getBitmapDataFromBytes(bytes:Bytes):BitmapData
	{
		#if cpp
		return BitmapData.fromImage(getImageFromBytes(bytes));
		#else
		throw new Exception("Loading WebP files from bytes is not supported on this platform!");
		#end
	}

	/**
		Creates an Image instance from a WebP file converted from the given bytes.
		@param	file		The asset path of the WebP
		@return		A new Image object
	**/
	public static function getImageFromBytes(bytes:Bytes):Image
	{
		#if cpp
		var webpData:Pointer<UInt8> = Stdlib.malloc(bytes.length);
		if (webpData == null)
		{
			trace('Failed to allocate memory for the specified file.');
			return null;
		}

		for (i in 0...bytes.length)
			webpData[i] = bytes.getData()[i];

		// Initialize config
		var config:Pointer<WebPDecoderConfig> = Stdlib.malloc(Stdlib.sizeof(WebPDecoderConfig));
		Decode.WebPInitDecoderConfig(config.raw);

		// Assume its RGBA for now
		config.value.output.colorspace = #if windows untyped __cpp__("MODE_BGRA") #else untyped __cpp__("MODE_RGBA") #end;

		// The C Library
		var status:VP8StatusCode = Decode.WebPDecode(webpData.raw, bytes.length, config.raw);
		if (status != VP8_STATUS_OK)
		{
			trace('Failed to decode file with code $status');
			return null;
		}

		var output:WebPDecBuffer = config.value.output;
		var rgbaBuffer:WebPRGBABuffer = output.u.RGBA;
		var decodedData:UInt8Array = new UInt8Array(rgbaBuffer.size);

		// Convert pointer data into UInt8Array
		for (i in 0...rgbaBuffer.size)
			decodedData[i] = rgbaBuffer.rgba[i];

		return new Image(new ImageBuffer(decodedData, output.width, output.height, Std.int(rgbaBuffer.stride / output.width) * 8,
			#if windows BGRA32 #else RGBA32 #end));
		#else
		throw new Exception("Loading WebP files from bytes is not supported on this platform!");
		#end
	}
}
