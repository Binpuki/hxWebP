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
		Creates a BitmapData instance from a WebP file.
		@usage		var bitmap:Bitmap = new Bitmap(WebP.getBitmapData("/assets/images/coolimage.webp"));
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
		Creates an Image instance from a WebP file.
		@usage		var bitmap:Bitmap = new Bitmap(WebP.getImage("/assets/images/coolimage.webp"));
		@param	file		The asset path of the WebP
		@return		A new Image object
	**/
	public static function getImage(file:String):Image
	{
		#if cpp
		var webp:Bytes = File.getBytes(Sys.getCwd() + file);
		var webpData:Pointer<UInt8> = Stdlib.malloc(webp.length);
		if (webpData == null)
		{
			trace('Failed to allocate memory for file at path $file');
			return null;
		}

		for (i in 0...webp.length)
			webpData[i] = webp.getData()[i];

		// Initialize config
		var config:Pointer<WebPDecoderConfig> = Stdlib.malloc(Stdlib.sizeof(WebPDecoderConfig));
		Decode.WebPInitDecoderConfig(config.raw);

		// Assume its RGBA for now
		config.value.output.colorspace = #if windows untyped __cpp__("MODE_BGRA") #else untyped __cpp__("MODE_RGBA") #end;

		// The C Library
		var status:VP8StatusCode = Decode.WebPDecode(webpData.raw, webp.length, config.raw);
		if (status != VP8_STATUS_OK)
		{
			trace('Failed to decode file at path $file with code $status');
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
		#elseif (js && html5)
		return LimeAssets.getImage(file);
		#else
		throw new Exception("WebP files are not supported on this platform!");
		#end
	}
}
