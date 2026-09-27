//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ScreenGlitch" {
Properties {

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "ScreenGlitch"
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 14181
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _CameraShakeParams;
out highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec3 u_xlatu0;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatu0.x = uint(int(int_bitfieldInsert(0,gl_VertexID,1,1) ));
    u_xlatu0.z = uint(uint(gl_VertexID) & 2u);
    u_xlat0.xy = vec2(u_xlatu0.xz);
    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy + _CameraShakeParams.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec2 _NoisePoint_Tiling;
uniform 	float _NoisePoint_Intensity;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
vec2 u_xlat19;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat0.y = _Time.y;
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.x)>=_ScanLineRate);
#else
    u_xlatb7 = abs(u_xlat0.x)>=_ScanLineRate;
#endif
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat7 * _ScanLineOffset;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.xyxy * vec4(_BlockTiling01.x, _BlockTiling01.y, _BlockTiling02.x, _BlockTiling02.y);
    u_xlat1 = floor(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = float(_RandomSeed);
    u_xlat1 = u_xlat14.xxxx * u_xlat1;
    u_xlat14.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat14.y = dot(u_xlat1.zw, vec2(12.9898005, 78.2330017));
    u_xlat14.xy = sin(u_xlat14.xy);
    u_xlat14.xy = u_xlat14.xy * vec2(43758.5469, 43758.5469);
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat21 = (-_NoisePower) + 1.0;
    u_xlat21 = max(u_xlat21, 0.00999999978);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat14.x>=u_xlat21);
#else
    u_xlatb21 = u_xlat14.x>=u_xlat21;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat1.xy = vec2(u_xlat21) * u_xlat14.xx + u_xlat0.xy;
    u_xlat14.x = u_xlat14.x * u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.00999999978);
#else
    u_xlatb14 = u_xlat14.x>=0.00999999978;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat16_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_2.w = (-u_xlat1.x);
    u_xlat16_3.xy = (-u_xlat1.zy) + u_xlat1.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb22 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_17 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_4.xy = vec2(u_xlat16_17) * u_xlat16_3.xy + u_xlat1.zy;
    u_xlat16_3.x = float(1.0);
    u_xlat16_3.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_17) * u_xlat16_3.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_4.xyw);
    u_xlat16_3.yzw = u_xlat16_2.yzw + u_xlat16_4.yzx;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=u_xlat16_4.x);
#else
    u_xlatb8 = u_xlat1.x>=u_xlat16_4.x;
#endif
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_9.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyw;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_2.z) + u_xlat16_9.x;
    u_xlat16_16 = u_xlat16_2.x + (-u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_16 * 6.0 + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_3.x;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_2.w;
    u_xlat1.x = abs(u_xlat16_9.x) + _HSV.xxyz.y;
    u_xlat8.x = u_xlat1.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=(-u_xlat8.x));
#else
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
#endif
    u_xlat8.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat1.x = u_xlat8.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat16_3.xyz = u_xlat8.xxx * u_xlat1.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_3.xyz = fract(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_3.xyz = abs(u_xlat16_3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_16 / u_xlat16_9.x;
    u_xlat1.x = u_xlat16_9.x * _HSV.xxyz.z;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xxx;
    u_xlat1.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat1.zw = floor(u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5 = u_xlat1.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat5.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat5.xy, vec2(269.5, 183.300003));
    u_xlat5.xy = u_xlat6.xy + _Time.yy;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.zw);
    u_xlat3 = u_xlat1.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat3.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat6.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = u_xlat1.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat4.zw);
    u_xlat5.x = (-u_xlat12.x) + u_xlat5.x;
    u_xlat19.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat6.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat19.xy = u_xlat19.xy * u_xlat6.xy;
    u_xlat5.x = u_xlat19.x * u_xlat5.x + u_xlat12.x;
    u_xlat6.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat1.zw, vec2(269.5, 183.300003));
    u_xlat15.xy = u_xlat6.xy + _Time.yy;
    u_xlat15.xy = sin(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(43758.5469, 43758.5469);
    u_xlat15.xy = fract(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat15.xy, u_xlat1.xy);
    u_xlat6.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.xy, vec2(269.5, 183.300003));
    u_xlat8.xy = u_xlat6.xy + _Time.yy;
    u_xlat8.xy = sin(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.x = (-u_xlat1.x) + u_xlat8.x;
    u_xlat1.x = u_xlat19.x * u_xlat8.x + u_xlat1.x;
    u_xlat8.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = u_xlat19.y * u_xlat8.x + u_xlat1.x;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat1.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat1.x;
    u_xlat0.xyw = u_xlat16_0.xyw + u_xlat1.xxx;
    u_xlat1.xyz = vec3(_HSV.z, _HSV.z, _HSV.z) * u_xlat16_2.xyz + (-u_xlat0.xyw);
    SV_Target0.xyz = u_xlat14.xxx * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _CameraShakeParams;
out highp vec2 vs_TEXCOORD0;
vec2 u_xlat0;
uvec3 u_xlatu0;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlatu0.x = uint(int(int_bitfieldInsert(0,gl_VertexID,1,1) ));
    u_xlatu0.z = uint(uint(gl_VertexID) & 2u);
    u_xlat0.xy = vec2(u_xlatu0.xz);
    gl_Position.xy = u_xlat0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    vs_TEXCOORD0.xy = u_xlat0.xy + _CameraShakeParams.xy;
    gl_Position.zw = vec2(-1.0, 1.0);
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec2 _NoisePoint_Tiling;
uniform 	float _NoisePoint_Intensity;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
vec2 u_xlat19;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat0.y = _Time.y;
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(abs(u_xlat0.x)>=_ScanLineRate);
#else
    u_xlatb7 = abs(u_xlat0.x)>=_ScanLineRate;
#endif
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat7 * _ScanLineOffset;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.xyxy * vec4(_BlockTiling01.x, _BlockTiling01.y, _BlockTiling02.x, _BlockTiling02.y);
    u_xlat1 = floor(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = float(_RandomSeed);
    u_xlat1 = u_xlat14.xxxx * u_xlat1;
    u_xlat14.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat14.y = dot(u_xlat1.zw, vec2(12.9898005, 78.2330017));
    u_xlat14.xy = sin(u_xlat14.xy);
    u_xlat14.xy = u_xlat14.xy * vec2(43758.5469, 43758.5469);
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat21 = (-_NoisePower) + 1.0;
    u_xlat21 = max(u_xlat21, 0.00999999978);
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(u_xlat14.x>=u_xlat21);
#else
    u_xlatb21 = u_xlat14.x>=u_xlat21;
#endif
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat1.xy = vec2(u_xlat21) * u_xlat14.xx + u_xlat0.xy;
    u_xlat14.x = u_xlat14.x * u_xlat21;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=0.00999999978);
#else
    u_xlatb14 = u_xlat14.x>=0.00999999978;
#endif
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat16_0.xyw = texture(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xyz = texture(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_2.w = (-u_xlat1.x);
    u_xlat16_3.xy = (-u_xlat1.zy) + u_xlat1.yz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb22 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat16_17 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_4.xy = vec2(u_xlat16_17) * u_xlat16_3.xy + u_xlat1.zy;
    u_xlat16_3.x = float(1.0);
    u_xlat16_3.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_17) * u_xlat16_3.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_4.xyw);
    u_xlat16_3.yzw = u_xlat16_2.yzw + u_xlat16_4.yzx;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat1.x>=u_xlat16_4.x);
#else
    u_xlatb8 = u_xlat1.x>=u_xlat16_4.x;
#endif
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_9.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyw;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_2.z) + u_xlat16_9.x;
    u_xlat16_16 = u_xlat16_2.x + (-u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_16 * 6.0 + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_3.x;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_2.w;
    u_xlat1.x = abs(u_xlat16_9.x) + _HSV.xxyz.y;
    u_xlat8.x = u_xlat1.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat8.x>=(-u_xlat8.x));
#else
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
#endif
    u_xlat8.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat1.x = u_xlat8.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat16_3.xyz = u_xlat8.xxx * u_xlat1.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_3.xyz = fract(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_3.xyz = abs(u_xlat16_3.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_16 / u_xlat16_9.x;
    u_xlat1.x = u_xlat16_9.x * _HSV.xxyz.z;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xxx;
    u_xlat1.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat1.zw = floor(u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5 = u_xlat1.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat5.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat5.xy, vec2(269.5, 183.300003));
    u_xlat5.xy = u_xlat6.xy + _Time.yy;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.zw);
    u_xlat3 = u_xlat1.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat3.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat6.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = u_xlat1.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat4.zw);
    u_xlat5.x = (-u_xlat12.x) + u_xlat5.x;
    u_xlat19.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat6.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat19.xy = u_xlat19.xy * u_xlat6.xy;
    u_xlat5.x = u_xlat19.x * u_xlat5.x + u_xlat12.x;
    u_xlat6.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat1.zw, vec2(269.5, 183.300003));
    u_xlat15.xy = u_xlat6.xy + _Time.yy;
    u_xlat15.xy = sin(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(43758.5469, 43758.5469);
    u_xlat15.xy = fract(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat15.xy, u_xlat1.xy);
    u_xlat6.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.xy, vec2(269.5, 183.300003));
    u_xlat8.xy = u_xlat6.xy + _Time.yy;
    u_xlat8.xy = sin(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.x = (-u_xlat1.x) + u_xlat8.x;
    u_xlat1.x = u_xlat19.x * u_xlat8.x + u_xlat1.x;
    u_xlat8.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = u_xlat19.y * u_xlat8.x + u_xlat1.x;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat1.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat1.x;
    u_xlat0.xyw = u_xlat16_0.xyw + u_xlat1.xxx;
    u_xlat1.xyz = vec3(_HSV.z, _HSV.z, _HSV.z) * u_xlat16_2.xyz + (-u_xlat0.xyw);
    SV_Target0.xyz = u_xlat14.xxx * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _CameraShakeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _CameraShakeParams.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec2 _NoisePoint_Tiling;
uniform 	float _NoisePoint_Intensity;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
vec2 u_xlat19;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat0.y = _Time.y;
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlatb7 = abs(u_xlat0.x)>=_ScanLineRate;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat7 * _ScanLineOffset;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.xyxy * vec4(_BlockTiling01.x, _BlockTiling01.y, _BlockTiling02.x, _BlockTiling02.y);
    u_xlat1 = floor(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = float(_RandomSeed);
    u_xlat1 = u_xlat14.xxxx * u_xlat1;
    u_xlat14.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat14.y = dot(u_xlat1.zw, vec2(12.9898005, 78.2330017));
    u_xlat14.xy = sin(u_xlat14.xy);
    u_xlat14.xy = u_xlat14.xy * vec2(43758.5469, 43758.5469);
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat21 = (-_NoisePower) + 1.0;
    u_xlat21 = max(u_xlat21, 0.00999999978);
    u_xlatb21 = u_xlat14.x>=u_xlat21;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat1.xy = vec2(u_xlat21) * u_xlat14.xx + u_xlat0.xy;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlatb14 = u_xlat14.x>=0.00999999978;
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat10_0.xyw = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_2.w = (-u_xlat1.x);
    u_xlat16_3.xy = (-u_xlat1.zy) + u_xlat1.yz;
    u_xlatb22 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_17 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_4.xy = vec2(u_xlat16_17) * u_xlat16_3.xy + u_xlat1.zy;
    u_xlat16_3.x = float(1.0);
    u_xlat16_3.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_17) * u_xlat16_3.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_4.xyw);
    u_xlat16_3.yzw = u_xlat16_2.yzw + u_xlat16_4.yzx;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat1.x>=u_xlat16_4.x;
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_9.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyw;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_2.z) + u_xlat16_9.x;
    u_xlat16_16 = u_xlat16_2.x + (-u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_16 * 6.0 + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_3.x;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_2.w;
    u_xlat1.x = abs(u_xlat16_9.x) + _HSV.xxyz.y;
    u_xlat8.x = u_xlat1.x * 360.0;
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlat8.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat1.x = u_xlat8.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat16_3.xyz = u_xlat8.xxx * u_xlat1.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_3.xyz = fract(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_3.xyz = abs(u_xlat16_3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_16 / u_xlat16_9.x;
    u_xlat1.x = u_xlat16_9.x * _HSV.xxyz.z;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xxx;
    u_xlat1.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat1.zw = floor(u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5 = u_xlat1.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat5.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat5.xy, vec2(269.5, 183.300003));
    u_xlat5.xy = u_xlat6.xy + _Time.yy;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.zw);
    u_xlat3 = u_xlat1.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat3.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat6.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = u_xlat1.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat4.zw);
    u_xlat5.x = (-u_xlat12.x) + u_xlat5.x;
    u_xlat19.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat6.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat19.xy = u_xlat19.xy * u_xlat6.xy;
    u_xlat5.x = u_xlat19.x * u_xlat5.x + u_xlat12.x;
    u_xlat6.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat1.zw, vec2(269.5, 183.300003));
    u_xlat15.xy = u_xlat6.xy + _Time.yy;
    u_xlat15.xy = sin(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(43758.5469, 43758.5469);
    u_xlat15.xy = fract(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat15.xy, u_xlat1.xy);
    u_xlat6.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.xy, vec2(269.5, 183.300003));
    u_xlat8.xy = u_xlat6.xy + _Time.yy;
    u_xlat8.xy = sin(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.x = (-u_xlat1.x) + u_xlat8.x;
    u_xlat1.x = u_xlat19.x * u_xlat8.x + u_xlat1.x;
    u_xlat8.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = u_xlat19.y * u_xlat8.x + u_xlat1.x;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat1.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat1.x;
    u_xlat0.xyw = u_xlat10_0.xyw + u_xlat1.xxx;
    u_xlat1.xyz = vec3(_HSV.z, _HSV.z, _HSV.z) * u_xlat16_2.xyz + (-u_xlat0.xyw);
    SV_Target0.xyz = u_xlat14.xxx * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _CameraShakeParams;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
void main()
{
    gl_Position = in_POSITION0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy + _CameraShakeParams.xy;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec2 _NoisePoint_Tiling;
uniform 	float _NoisePoint_Intensity;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec4 u_xlat16_4;
vec4 u_xlat5;
vec2 u_xlat6;
float u_xlat7;
bool u_xlatb7;
vec2 u_xlat8;
bool u_xlatb8;
mediump vec3 u_xlat16_9;
vec2 u_xlat12;
vec2 u_xlat14;
bool u_xlatb14;
vec2 u_xlat15;
mediump float u_xlat16_16;
mediump float u_xlat16_17;
vec2 u_xlat19;
float u_xlat21;
bool u_xlatb21;
bool u_xlatb22;
void main()
{
    u_xlat0.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat0.y = _Time.y;
    u_xlat0.x = dot(u_xlat0.xy, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 2.0 + -1.0;
    u_xlatb7 = abs(u_xlat0.x)>=_ScanLineRate;
    u_xlat7 = u_xlatb7 ? 1.0 : float(0.0);
    u_xlat7 = u_xlat7 * _ScanLineOffset;
    u_xlat0.x = u_xlat7 * u_xlat0.x;
    u_xlat0.y = 0.0;
    u_xlat0.xy = u_xlat0.xy + vs_TEXCOORD0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.xyxy * vec4(_BlockTiling01.x, _BlockTiling01.y, _BlockTiling02.x, _BlockTiling02.y);
    u_xlat1 = floor(u_xlat1);
    u_xlat1 = u_xlat1 + vec4(1.0, 1.0, 1.0, 1.0);
    u_xlat14.x = float(_RandomSeed);
    u_xlat1 = u_xlat14.xxxx * u_xlat1;
    u_xlat14.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat14.y = dot(u_xlat1.zw, vec2(12.9898005, 78.2330017));
    u_xlat14.xy = sin(u_xlat14.xy);
    u_xlat14.xy = u_xlat14.xy * vec2(43758.5469, 43758.5469);
    u_xlat14.xy = fract(u_xlat14.xy);
    u_xlat14.x = u_xlat14.y * u_xlat14.x;
    u_xlat21 = (-_NoisePower) + 1.0;
    u_xlat21 = max(u_xlat21, 0.00999999978);
    u_xlatb21 = u_xlat14.x>=u_xlat21;
    u_xlat21 = u_xlatb21 ? 1.0 : float(0.0);
    u_xlat1.xy = vec2(u_xlat21) * u_xlat14.xx + u_xlat0.xy;
    u_xlat14.x = u_xlat14.x * u_xlat21;
    u_xlatb14 = u_xlat14.x>=0.00999999978;
    u_xlat14.x = u_xlatb14 ? 1.0 : float(0.0);
    u_xlat10_0.xyw = texture2D(_MainTex, u_xlat0.xy).xyz;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xyz = texture2D(_MainTex, u_xlat1.xy).xyz;
    u_xlat16_2.w = (-u_xlat1.x);
    u_xlat16_3.xy = (-u_xlat1.zy) + u_xlat1.yz;
    u_xlatb22 = u_xlat1.y>=u_xlat1.z;
    u_xlat16_17 = (u_xlatb22) ? 1.0 : 0.0;
    u_xlat16_4.xy = vec2(u_xlat16_17) * u_xlat16_3.xy + u_xlat1.zy;
    u_xlat16_3.x = float(1.0);
    u_xlat16_3.y = float(-1.0);
    u_xlat16_4.zw = vec2(u_xlat16_17) * u_xlat16_3.xy + vec2(-1.0, 0.666666687);
    u_xlat16_2.xyz = (-u_xlat16_4.xyw);
    u_xlat16_3.yzw = u_xlat16_2.yzw + u_xlat16_4.yzx;
    u_xlat16_3.x = u_xlat1.x + u_xlat16_2.x;
    u_xlatb8 = u_xlat1.x>=u_xlat16_4.x;
    u_xlat16_2.x = (u_xlatb8) ? 1.0 : 0.0;
    u_xlat16_9.x = u_xlat16_2.x * u_xlat16_3.w + u_xlat1.x;
    u_xlat16_2.xzw = u_xlat16_2.xxx * u_xlat16_3.xyz + u_xlat16_4.xyw;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_9.x);
    u_xlat16_9.x = (-u_xlat16_2.z) + u_xlat16_9.x;
    u_xlat16_16 = u_xlat16_2.x + (-u_xlat16_3.x);
    u_xlat16_3.x = u_xlat16_16 * 6.0 + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_9.x / u_xlat16_3.x;
    u_xlat16_9.x = u_xlat16_9.x + u_xlat16_2.w;
    u_xlat1.x = abs(u_xlat16_9.x) + _HSV.xxyz.y;
    u_xlat8.x = u_xlat1.x * 360.0;
    u_xlatb8 = u_xlat8.x>=(-u_xlat8.x);
    u_xlat8.xy = (bool(u_xlatb8)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat1.x = u_xlat8.y * u_xlat1.x;
    u_xlat1.x = fract(u_xlat1.x);
    u_xlat16_3.xyz = u_xlat8.xxx * u_xlat1.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_3.xyz = fract(u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_3.xyz = abs(u_xlat16_3.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_9.x = u_xlat16_2.x + 9.99999975e-05;
    u_xlat16_9.x = u_xlat16_16 / u_xlat16_9.x;
    u_xlat1.x = u_xlat16_9.x * _HSV.xxyz.z;
    u_xlat16_9.xyz = u_xlat1.xxx * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_9.xyz * u_xlat16_2.xxx;
    u_xlat1.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat1.zw = floor(u_xlat1.xy);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat5 = u_xlat1.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat6.x = dot(u_xlat5.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat5.xy, vec2(269.5, 183.300003));
    u_xlat5.xy = u_xlat6.xy + _Time.yy;
    u_xlat5.xy = sin(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(43758.5469, 43758.5469);
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat5.x = dot(u_xlat5.xy, u_xlat5.zw);
    u_xlat3 = u_xlat1.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat6.x = dot(u_xlat3.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat6.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4 = u_xlat1.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat12.x = dot(u_xlat12.xy, u_xlat4.zw);
    u_xlat5.x = (-u_xlat12.x) + u_xlat5.x;
    u_xlat19.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat6.xy = (-u_xlat1.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat19.xy = u_xlat19.xy * u_xlat6.xy;
    u_xlat5.x = u_xlat19.x * u_xlat5.x + u_xlat12.x;
    u_xlat6.x = dot(u_xlat1.zw, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat1.zw, vec2(269.5, 183.300003));
    u_xlat15.xy = u_xlat6.xy + _Time.yy;
    u_xlat15.xy = sin(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(43758.5469, 43758.5469);
    u_xlat15.xy = fract(u_xlat15.xy);
    u_xlat15.xy = u_xlat15.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat15.xy, u_xlat1.xy);
    u_xlat6.x = dot(u_xlat3.xy, vec2(127.099998, 311.700012));
    u_xlat6.y = dot(u_xlat3.xy, vec2(269.5, 183.300003));
    u_xlat8.xy = u_xlat6.xy + _Time.yy;
    u_xlat8.xy = sin(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(43758.5469, 43758.5469);
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat8.xy = u_xlat8.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat8.x = dot(u_xlat8.xy, u_xlat4.xy);
    u_xlat8.x = (-u_xlat1.x) + u_xlat8.x;
    u_xlat1.x = u_xlat19.x * u_xlat8.x + u_xlat1.x;
    u_xlat8.x = (-u_xlat1.x) + u_xlat5.x;
    u_xlat1.x = u_xlat19.y * u_xlat8.x + u_xlat1.x;
    u_xlat1.x = dot(u_xlat1.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat1.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat1.x;
    u_xlat0.xyw = u_xlat10_0.xyw + u_xlat1.xxx;
    u_xlat1.xyz = vec3(_HSV.z, _HSV.z, _HSV.z) * u_xlat16_2.xyz + (-u_xlat0.xyw);
    SV_Target0.xyz = u_xlat14.xxx * u_xlat1.xyz + u_xlat0.xyw;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
}
}
}
}