package webp._internal;

#if cpp
import cpp.RawConstPointer;
import cpp.RawPointer;
import cpp.SizeT;
import cpp.UInt8;

@:buildXml('<include name="${haxelib:hxWebP}/project/Build.xml" />')
@:include("webp/decode.h")
@:unreflective
extern class Decode
{
	@:native("WebPGetDecoderVersion")
	static function WebPGetDecoderVersion():Int;

	@:native("WebPGetInfo")
	static function WebPGetInfo(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>):Int;

	@:native("WebPDecodeRGBA")
	static function WebPDecodeRGBA(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPDecodeARGB")
	static function WebPDecodeARGB(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPDecodeBGRA")
	static function WebPDecodeBGRA(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPDecodeRGB")
	static function WebPDecodeRGB(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPDecodeBGR")
	static function WebPDecodeBGR(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPInitDecoderConfig")
	static function WebPInitDecoderConfig(config:RawPointer<WebPDecoderConfig>):Int;

	@:native("WebPDecode")
	static function WebPDecode(data:RawConstPointer<UInt8>, data_size:SizeT, config:RawPointer<WebPDecoderConfig>):VP8StatusCode;
}

enum abstract VP8StatusCode(Int) from Int to Int
{
	final VP8_STATUS_OK = 0;
	final VP8_STATUS_OUT_OF_MEMORY = 1;
	final VP8_STATUS_INVALID_PARAM = 2;
	final VP8_STATUS_BITSTREAM_ERROR = 3;
	final VP8_STATUS_UNSUPPORTED_FEATURE = 4;
	final VP8_STATUS_SUSPENDED = 5;
	final VP8_STATUS_USER_ABORT = 6;
	final VP8_STATUS_NOT_ENOUGH_DATA = 7;
}

@:structAccess
@:native("WebPRGBABuffer")
extern class WebPRGBABuffer
{
	@:native("rgba") var rgba:RawPointer<UInt8>;
	@:native("stride") var stride:Int;
	@:native("size") var size:SizeT;
}

@:structAccess
@:native("WebPYUVABuffer")
extern class WebPYUVABuffer
{
	@:native("y") var y:RawPointer<UInt8>;
	@:native("u") var u:RawPointer<UInt8>;
	@:native("v") var v:RawPointer<UInt8>;
	@:native("a") var a:RawPointer<UInt8>;

	@:native("y_stride") var y_stride:Int;
	@:native("u_stride") var u_stride:Int;
	@:native("v_stride") var v_stride:Int;
	@:native("a_stride") var a_stride:Int;

	@:native("y_size") var y_size:SizeT;
	@:native("u_size") var u_size:SizeT;
	@:native("v_size") var v_size:SizeT;
	@:native("a_size") var a_size:SizeT;
}

@:structAccess
@:native("WebPBitstreamFeatures")
extern class WebPBitstreamFeatures
{
	@:native("width") var width:Int;
	@:native("height") var height:Int;
	@:native("has_alpha") var has_alpha:Int;
	@:native("has_animation") var has_animation:Int;
	@:native("format") var format:Int;
}

@:native("WEBP_CSP_MODE")
enum abstract WEBP_CSP_MODE(Int) from Int to Int
{
	final MODE_RGB = 0;
	final MODE_RGBA = 1;
	final MODE_BGR = 2;
	final MODE_BGRA = 3;
	final MODE_ARGB = 4;
	final MODE_RGBA_4444 = 5;
	final MODE_RGB_565 = 6;
	// RGB-premultiplied transparent modes (alpha value is preserved)
	final MODE_rgbA = 7;
	final MODE_bgrA = 8;
	final MODE_Argb = 9;
	final MODE_rgbA_4444 = 10;
	// YUV modes must come after RGB ones.
	final MODE_YUV = 11;
	final MODE_YUVA = 12; // yuv 4:2:0
	final MODE_LAST = 13;
}

@:structAccess
extern class WebPBuffers
{
	@:native("RGBA") var RGBA:WebPRGBABuffer;
	@:native("YUVA") var YUVA:WebPYUVABuffer;
}

@:structAccess
@:native("WebPDecBuffer")
extern class WebPDecBuffer
{
	@:native("colorspace") var colorspace:WEBP_CSP_MODE;
	@:native("width") var width:Int;
	@:native("height") var height:Int;
	@:native("is_external_memory") var is_external_memory:Int;
	@:native("u") var u:WebPBuffers;

	@:native("private_memory") var private_memory:RawPointer<UInt8>;
}

@:structAccess
@:native("WebPDecoderOptions")
extern class WebPDecoderOptions
{
	@:native("bypass_filtering") var bypass_filtering:Int;
	@:native("no_fancy_upsampling") var no_fancy_upsampling:Int;
	@:native("use_cropping") var use_cropping:Int;

	@:native("crop_left") var crop_left:Int;
	@:native("crop_top") var crop_top:Int;
	@:native("crop_width") var crop_width:Int;
	@:native("crop_height") var crop_height:Int;

	@:native("use_scaling") var use_scaling:Int;
	@:native("scaled_width") var scaled_width:Int;
	@:native("scaled_height") var scaled_height:Int;
	@:native("use_threads") var use_threads:Int;
	@:native("dithering_strength") var dithering_strength:Int;
	@:native("flip") var flip:Int;
	@:native("alpha_dithering_strength") var alpha_dithering_strength:Int;
}

@:structAccess
@:native("WebPDecoderConfig")
extern class WebPDecoderConfig
{
	@:native("input") var input:WebPBitstreamFeatures;
	@:native("output") var output:WebPDecBuffer;
	@:native("options") var options:WebPDecoderOptions;
}
#end
