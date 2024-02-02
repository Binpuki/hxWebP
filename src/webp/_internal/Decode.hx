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

	@:native("WebPDecodeYUV")
	static function WebPDecodeYUV(data:RawConstPointer<UInt8>, data_size:SizeT, width:RawPointer<Int>, height:RawPointer<Int>,
		u:RawPointer<RawPointer<UInt8>>, v:RawPointer<RawPointer<UInt8>>, stride:RawPointer<Int>, uv_stride:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPDecodeRGBAInto")
	static function WebPDecodeRGBAInto(data:RawConstPointer<UInt8>, data_size:SizeT, output_buffer:RawPointer<UInt8>, output_buffer_size:SizeT,
		output_stride:Int):RawPointer<UInt8>;

	@:native("WebPDecodeARGBInto")
	static function WebPDecodeARGBInto(data:RawConstPointer<UInt8>, data_size:SizeT, output_buffer:RawPointer<UInt8>, output_buffer_size:SizeT,
		output_stride:Int):RawPointer<UInt8>;

	@:native("WebPDecodeBGRAInto")
	static function WebPDecodeBGRAInto(data:RawConstPointer<UInt8>, data_size:SizeT, output_buffer:RawPointer<UInt8>, output_buffer_size:SizeT,
		output_stride:Int):RawPointer<UInt8>;

	@:native("WebPDecodeRGBInto")
	static function WebPDecodeRGBInto(data:RawConstPointer<UInt8>, data_size:SizeT, output_buffer:RawPointer<UInt8>, output_buffer_size:SizeT,
		output_stride:Int):RawPointer<UInt8>;

	@:native("WebPDecodeBGRInto")
	static function WebPDecodeBGRInto(data:RawConstPointer<UInt8>, data_size:SizeT, output_buffer:RawPointer<UInt8>, output_buffer_size:SizeT,
		output_stride:Int):RawPointer<UInt8>;

	@:native("WebPDecodeYUVInto")
	static function WebPDecodeYUVInto(data:RawConstPointer<UInt8>, data_size:SizeT, luma:RawPointer<UInt8>, luma_size:SizeT, luma_stride:Int,
		u:RawPointer<UInt8>, u_size:SizeT, u_stride:Int, v:RawPointer<UInt8>, v_size:SizeT, v_stride:Int):RawPointer<UInt8>;

	@:native("WebPIsPremultipliedMode")
	static function WebPIsPremultipliedMode(mode:NativeWEBP_CSP_MODE):Int;

	@:native("WebPIsAlphaMode")
	static function WebPIsAlphaMode(mode:NativeWEBP_CSP_MODE):Int;

	@:native("WebPIsRGBMode")
	static function WebPIsRGBMode(mode:NativeWEBP_CSP_MODE):Int;

	@:native("WebPInitDecBuffer")
	static function WebPInitDecBuffer(buffer:RawPointer<WebPDecBuffer>):Int;

	@:native("WebPFreeDecBuffer")
	static function WebPFreeDecBuffer(buffer:RawPointer<WebPDecBuffer>):Void;

	@:native("WebPINewDecoder")
	static function WebPINewDecoder(output_buffer:RawPointer<WebPDecBuffer>):RawPointer<WebPIDecoder>;

	@:native("WebPINewRGB")
	static function WebPINewRGB(csp:NativeWEBP_CSP_MODE, output_buffer:RawPointer<UInt8>, output_buffer_size:SizeT, output_stride:Int):RawPointer<WebPIDecoder>;

	@:native("WebPINewYUVA")
	static function WebPINewYUVA(luma:RawPointer<UInt8>, luma_size:SizeT, luma_stride:Int, u:RawPointer<UInt8>, u_size:SizeT, u_stride:Int,
		v:RawPointer<UInt8>, v_size:SizeT, v_stride:Int, a:RawPointer<UInt8>, a_size:SizeT, a_stride:Int):RawPointer<WebPIDecoder>;

	@:native("WebPINewYUV")
	static function WebPINewYUV(luma:RawPointer<UInt8>, luma_size:SizeT, luma_stride:Int, u:RawPointer<UInt8>, u_size:SizeT, u_stride:Int,
		v:RawPointer<UInt8>, v_size:SizeT, v_stride:Int):RawPointer<WebPIDecoder>;

	@:native("WebPIDelete")
	static function WebPIDelete(idec:RawPointer<WebPIDecoder>):Void;

	@:native("WebPIAppend")
	static function WebPIAppend(idec:RawPointer<WebPIDecoder>, data:RawConstPointer<UInt8>, data_size:SizeT):VP8StatusCode;

	@:native("WebPIUpdate")
	static function WebPIUpdate(idec:RawPointer<WebPIDecoder>, data:RawConstPointer<UInt8>, data_size:SizeT):VP8StatusCode;

	@:native("WebPIDecGetRGB")
	static function WebPIDecGetRGB(idec:RawConstPointer<WebPIDecoder>, last_y:RawPointer<Int>, width:RawPointer<Int>, height:RawPointer<Int>,
		stride:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPIDecGetYUVA")
	static function WebPIDecGetYUVA(idec:RawConstPointer<WebPIDecoder>, last_y:RawPointer<Int>, u:RawPointer<RawPointer<UInt8>>,
		v:RawPointer<RawPointer<UInt8>>, a:RawPointer<RawPointer<UInt8>>, width:RawPointer<Int>, height:RawPointer<Int>, stride:RawPointer<Int>,
		uv_stride:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPIDecGetYUV")
	static function WebPIDecGetYUV(idec:RawConstPointer<WebPIDecoder>, last_y:RawPointer<Int>, u:RawPointer<RawPointer<UInt8>>,
		v:RawPointer<RawPointer<UInt8>>, width:RawPointer<Int>, height:RawPointer<Int>, stride:RawPointer<Int>, uv_stride:RawPointer<Int>):RawPointer<UInt8>;

	@:native("WebPIDecodedArea")
	static function WebPIDecodedArea(idec:RawConstPointer<WebPIDecoder>, left:RawPointer<Int>, top:RawPointer<Int>, width:RawPointer<Int>,
		height:RawPointer<Int>):RawPointer<WebPDecBuffer>;

	@:native("WebPGetFeatures")
	static function WebPGetFeatures(data:RawConstPointer<UInt8>, data_size:SizeT, features:RawPointer<WebPBitstreamFeatures>):VP8StatusCode;

	@:native("WebPInitDecoderConfig")
	static function WebPInitDecoderConfig(config:RawPointer<WebPDecoderConfig>):Int;

	@:native("WebPIDecode")
	static function WebPIDecode(data:RawConstPointer<UInt8>, data_size:SizeT, config:RawPointer<WebPDecoderConfig>):RawPointer<WebPIDecoder>;

	@:native("WebPDecode")
	static function WebPDecode(data:RawConstPointer<UInt8>, data_size:SizeT, config:RawPointer<WebPDecoderConfig>):VP8StatusCode;
}

// TODO: Maybe port over the rest so WebPIDecoder can actually be used in Haxe (if neccesary)

@:structAccess
@:native("WebPIDecoder")
extern class WebPIDecoder {}

@:native("VP8StatusCode")
@:include("webp/decode.h")
@:unreflective
extern class NativeVP8StatusCode {}

enum abstract VP8StatusCode(Int) from Int to Int
{
	@:to(NativeVP8StatusCode)
	@:unreflective
	inline public function toNative()
		return untyped __cpp__("((VP8StatusCode)({0}))", this);

	@:from(NativeVP8StatusCode)
	@:unreflective
	inline static public function fromNative(value:NativeVP8StatusCode)
		return cast(untyped value, VP8StatusCode);

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
@:include("webp/decode.h")
@:unreflective
extern class NativeWEBP_CSP_MODE {}

enum abstract WEBP_CSP_MODE(Int) from Int to Int
{
	@:to(NativeWEBP_CSP_MODE)
	@:unreflective
	inline public function toNative()
		return untyped __cpp__("((WEBP_CSP_MODE)({0}))", this);

	@:from(NativeWEBP_CSP_MODE)
	@:unreflective
	inline static public function fromNative(value:NativeWEBP_CSP_MODE)
		return cast(untyped value, WEBP_CSP_MODE);

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
	@:native("colorspace") var colorspace:NativeWEBP_CSP_MODE;
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
