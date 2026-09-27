//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/ScreenGlitchNPRPost" {
Properties {

_MainTex ("Texture", 2D) = "white" { }

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "RenderType" = "Opaque" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 61479
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _isClamp;
uniform 	mediump vec2 _UVScale;
uniform 	mediump vec2 _UVOffset;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _UVScale.xy + vec2(_UVOffset.x, _UVOffset.y);
    u_xlat4.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = (int(_isClamp) != 0) ? u_xlat4.xy : u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
uniform 	vec2 _NoisePoint_Tiling;
uniform 	vec2 _ColorOffset;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	float _NoisePoint_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat0.zw = floor(u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
    u_xlat2.y = dot(u_xlat1.xy, vec2(269.5, 183.300003));
    u_xlat1.xy = u_xlat2.xy + _Time.yy;
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(43758.5469, 43758.5469);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.zw);
    u_xlat2 = u_xlat0.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
    u_xlat3.y = dot(u_xlat2.zw, vec2(269.5, 183.300003));
    u_xlat7.xy = u_xlat3.xy + _Time.yy;
    u_xlat7.xy = sin(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(43758.5469, 43758.5469);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3 = u_xlat0.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat3.zw);
    u_xlat1.x = (-u_xlat7.x) + u_xlat1.x;
    u_xlat13.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat14.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat14.xy;
    u_xlat1.x = u_xlat13.x * u_xlat1.x + u_xlat7.x;
    u_xlat4.x = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat0.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat4.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat12.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat2.xy, vec2(269.5, 183.300003));
    u_xlat6.xy = u_xlat4.xy + _Time.yy;
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat3.xy);
    u_xlat6.x = (-u_xlat0.x) + u_xlat6.x;
    u_xlat0.x = u_xlat13.x * u_xlat6.x + u_xlat0.x;
    u_xlat6.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat13.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat0.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat0.x;
    u_xlat1.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat1.y = _Time.y;
    u_xlat6.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 43758.5469;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(abs(u_xlat6.x)>=_ScanLineRate);
#else
    u_xlatb12 = abs(u_xlat6.x)>=_ScanLineRate;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat12.x * _ScanLineOffset;
    u_xlat1.x = u_xlat12.x * u_xlat6.x;
    u_xlat1.y = 0.0;
    u_xlat6.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat1.xy = u_xlat6.xy + _ColorOffset.xy;
    u_xlat1.x = texture(_MainTex, u_xlat1.xy).x;
    u_xlat2.xy = u_xlat6.xy + (-_ColorOffset.xy);
    u_xlat1.z = texture(_MainTex, u_xlat2.xy).z;
    u_xlat1.y = texture(_MainTex, u_xlat6.xy).y;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xw = u_xlat6.xy * vec2(_BlockTiling01.x, _BlockTiling01.y);
    u_xlat0.xw = floor(u_xlat0.xw);
    u_xlat0.xw = u_xlat0.xw + vec2(1.0, 1.0);
    u_xlat19 = float(_RandomSeed);
    u_xlat0.xw = u_xlat0.xw * vec2(u_xlat19);
    u_xlat0.x = dot(u_xlat0.xw, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat2.xy = u_xlat6.xy * _BlockTiling02.xy;
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat2.xy = vec2(u_xlat19) * u_xlat2.xy;
    u_xlat18 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat0.w = u_xlat18 * 43758.5469;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat18 = (-_NoisePower) + 1.0;
    u_xlat18 = max(u_xlat18, 0.00999999978);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat18);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat18;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat6.xy = vec2(u_xlat18) * u_xlat0.xx + u_xlat6.xy;
    u_xlat0.x = u_xlat0.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.00999999978);
#else
    u_xlatb0.x = u_xlat0.x>=0.00999999978;
#endif
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat2.xyw = texture(_MainTex, u_xlat6.xy).yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat2.x>=u_xlat2.y);
#else
    u_xlatb6 = u_xlat2.x>=u_xlat2.y;
#endif
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat2.yx;
    u_xlat4.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_5) * u_xlat4 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(u_xlat2.w>=u_xlat3.x);
#else
    u_xlatb0.y = u_xlat2.w>=u_xlat3.x;
#endif
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat2.xyz = u_xlat3.xyw;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.yyyy * u_xlat3 + u_xlat2;
    u_xlat6.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat2.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat2.z;
    u_xlat12.x = abs(u_xlat12.x) + _HSV.x;
    u_xlat18 = u_xlat12.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=(-u_xlat18));
#else
    u_xlatb18 = u_xlat18>=(-u_xlat18);
#endif
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat8.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat2.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _HSV.y;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
    u_xlat6.xyz = _HSV.zzz * u_xlat6.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _isClamp;
uniform 	mediump vec2 _UVScale;
uniform 	mediump vec2 _UVOffset;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _UVScale.xy + vec2(_UVOffset.x, _UVOffset.y);
    u_xlat4.xy = u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    vs_TEXCOORD0.xy = (int(_isClamp) != 0) ? u_xlat4.xy : u_xlat0.xy;
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
uniform 	vec4 _Time;
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
uniform 	vec2 _NoisePoint_Tiling;
uniform 	vec2 _ColorOffset;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	float _NoisePoint_Intensity;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_Target0;
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat0.zw = floor(u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
    u_xlat2.y = dot(u_xlat1.xy, vec2(269.5, 183.300003));
    u_xlat1.xy = u_xlat2.xy + _Time.yy;
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(43758.5469, 43758.5469);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.zw);
    u_xlat2 = u_xlat0.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
    u_xlat3.y = dot(u_xlat2.zw, vec2(269.5, 183.300003));
    u_xlat7.xy = u_xlat3.xy + _Time.yy;
    u_xlat7.xy = sin(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(43758.5469, 43758.5469);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3 = u_xlat0.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat3.zw);
    u_xlat1.x = (-u_xlat7.x) + u_xlat1.x;
    u_xlat13.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat14.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat14.xy;
    u_xlat1.x = u_xlat13.x * u_xlat1.x + u_xlat7.x;
    u_xlat4.x = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat0.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat4.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat12.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat2.xy, vec2(269.5, 183.300003));
    u_xlat6.xy = u_xlat4.xy + _Time.yy;
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat3.xy);
    u_xlat6.x = (-u_xlat0.x) + u_xlat6.x;
    u_xlat0.x = u_xlat13.x * u_xlat6.x + u_xlat0.x;
    u_xlat6.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat13.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat0.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat0.x;
    u_xlat1.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat1.y = _Time.y;
    u_xlat6.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 43758.5469;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(abs(u_xlat6.x)>=_ScanLineRate);
#else
    u_xlatb12 = abs(u_xlat6.x)>=_ScanLineRate;
#endif
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat12.x * _ScanLineOffset;
    u_xlat1.x = u_xlat12.x * u_xlat6.x;
    u_xlat1.y = 0.0;
    u_xlat6.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat1.xy = u_xlat6.xy + _ColorOffset.xy;
    u_xlat1.x = texture(_MainTex, u_xlat1.xy).x;
    u_xlat2.xy = u_xlat6.xy + (-_ColorOffset.xy);
    u_xlat1.z = texture(_MainTex, u_xlat2.xy).z;
    u_xlat1.y = texture(_MainTex, u_xlat6.xy).y;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xw = u_xlat6.xy * vec2(_BlockTiling01.x, _BlockTiling01.y);
    u_xlat0.xw = floor(u_xlat0.xw);
    u_xlat0.xw = u_xlat0.xw + vec2(1.0, 1.0);
    u_xlat19 = float(_RandomSeed);
    u_xlat0.xw = u_xlat0.xw * vec2(u_xlat19);
    u_xlat0.x = dot(u_xlat0.xw, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat2.xy = u_xlat6.xy * _BlockTiling02.xy;
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat2.xy = vec2(u_xlat19) * u_xlat2.xy;
    u_xlat18 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat0.w = u_xlat18 * 43758.5469;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat18 = (-_NoisePower) + 1.0;
    u_xlat18 = max(u_xlat18, 0.00999999978);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat0.x>=u_xlat18);
#else
    u_xlatb18 = u_xlat0.x>=u_xlat18;
#endif
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat6.xy = vec2(u_xlat18) * u_xlat0.xx + u_xlat6.xy;
    u_xlat0.x = u_xlat0.x * u_xlat18;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat0.x>=0.00999999978);
#else
    u_xlatb0.x = u_xlat0.x>=0.00999999978;
#endif
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat2.xyw = texture(_MainTex, u_xlat6.xy).yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(u_xlat2.x>=u_xlat2.y);
#else
    u_xlatb6 = u_xlat2.x>=u_xlat2.y;
#endif
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat2.yx;
    u_xlat4.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_5) * u_xlat4 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.y = !!(u_xlat2.w>=u_xlat3.x);
#else
    u_xlatb0.y = u_xlat2.w>=u_xlat3.x;
#endif
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat2.xyz = u_xlat3.xyw;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.yyyy * u_xlat3 + u_xlat2;
    u_xlat6.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat2.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat2.z;
    u_xlat12.x = abs(u_xlat12.x) + _HSV.x;
    u_xlat18 = u_xlat12.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18>=(-u_xlat18));
#else
    u_xlatb18 = u_xlat18>=(-u_xlat18);
#endif
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat8.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat2.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _HSV.y;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
    u_xlat6.xyz = _HSV.zzz * u_xlat6.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _isClamp;
uniform 	mediump vec2 _UVScale;
uniform 	mediump vec2 _UVOffset;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _UVScale.xy + vec2(_UVOffset.x, _UVOffset.y);
    u_xlat4.xy = u_xlat0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    vs_TEXCOORD0.xy = (int(_isClamp) != 0) ? u_xlat4.xy : u_xlat0.xy;
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
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
uniform 	vec2 _NoisePoint_Tiling;
uniform 	vec2 _ColorOffset;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	float _NoisePoint_Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat0.zw = floor(u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
    u_xlat2.y = dot(u_xlat1.xy, vec2(269.5, 183.300003));
    u_xlat1.xy = u_xlat2.xy + _Time.yy;
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(43758.5469, 43758.5469);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.zw);
    u_xlat2 = u_xlat0.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
    u_xlat3.y = dot(u_xlat2.zw, vec2(269.5, 183.300003));
    u_xlat7.xy = u_xlat3.xy + _Time.yy;
    u_xlat7.xy = sin(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(43758.5469, 43758.5469);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3 = u_xlat0.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat3.zw);
    u_xlat1.x = (-u_xlat7.x) + u_xlat1.x;
    u_xlat13.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat14.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat14.xy;
    u_xlat1.x = u_xlat13.x * u_xlat1.x + u_xlat7.x;
    u_xlat4.x = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat0.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat4.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat12.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat2.xy, vec2(269.5, 183.300003));
    u_xlat6.xy = u_xlat4.xy + _Time.yy;
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat3.xy);
    u_xlat6.x = (-u_xlat0.x) + u_xlat6.x;
    u_xlat0.x = u_xlat13.x * u_xlat6.x + u_xlat0.x;
    u_xlat6.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat13.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat0.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat0.x;
    u_xlat1.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat1.y = _Time.y;
    u_xlat6.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 43758.5469;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlatb12 = abs(u_xlat6.x)>=_ScanLineRate;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat12.x * _ScanLineOffset;
    u_xlat1.x = u_xlat12.x * u_xlat6.x;
    u_xlat1.y = 0.0;
    u_xlat6.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat1.xy = u_xlat6.xy + _ColorOffset.xy;
    u_xlat1.x = texture2D(_MainTex, u_xlat1.xy).x;
    u_xlat2.xy = u_xlat6.xy + (-_ColorOffset.xy);
    u_xlat1.z = texture2D(_MainTex, u_xlat2.xy).z;
    u_xlat1.y = texture2D(_MainTex, u_xlat6.xy).y;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xw = u_xlat6.xy * vec2(_BlockTiling01.x, _BlockTiling01.y);
    u_xlat0.xw = floor(u_xlat0.xw);
    u_xlat0.xw = u_xlat0.xw + vec2(1.0, 1.0);
    u_xlat19 = float(_RandomSeed);
    u_xlat0.xw = u_xlat0.xw * vec2(u_xlat19);
    u_xlat0.x = dot(u_xlat0.xw, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat2.xy = u_xlat6.xy * _BlockTiling02.xy;
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat2.xy = vec2(u_xlat19) * u_xlat2.xy;
    u_xlat18 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat0.w = u_xlat18 * 43758.5469;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat18 = (-_NoisePower) + 1.0;
    u_xlat18 = max(u_xlat18, 0.00999999978);
    u_xlatb18 = u_xlat0.x>=u_xlat18;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat6.xy = vec2(u_xlat18) * u_xlat0.xx + u_xlat6.xy;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlatb0.x = u_xlat0.x>=0.00999999978;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat2.xyw = texture2D(_MainTex, u_xlat6.xy).yzx;
    u_xlatb6 = u_xlat2.x>=u_xlat2.y;
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat2.yx;
    u_xlat4.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_5) * u_xlat4 + u_xlat3;
    u_xlatb0.y = u_xlat2.w>=u_xlat3.x;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat2.xyz = u_xlat3.xyw;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.yyyy * u_xlat3 + u_xlat2;
    u_xlat6.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat2.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat2.z;
    u_xlat12.x = abs(u_xlat12.x) + _HSV.x;
    u_xlat18 = u_xlat12.x * 360.0;
    u_xlatb18 = u_xlat18>=(-u_xlat18);
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat8.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat2.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _HSV.y;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
    u_xlat6.xyz = _HSV.zzz * u_xlat6.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	int _isClamp;
uniform 	mediump vec2 _UVScale;
uniform 	mediump vec2 _UVOffset;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
vec2 u_xlat4;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0.xy = in_TEXCOORD0.xy * _UVScale.xy + vec2(_UVOffset.x, _UVOffset.y);
    u_xlat4.xy = u_xlat0.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    vs_TEXCOORD0.xy = (int(_isClamp) != 0) ? u_xlat4.xy : u_xlat0.xy;
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
uniform 	int _RandomSeed;
uniform 	vec2 _BlockTiling01;
uniform 	vec2 _BlockTiling02;
uniform 	float _NoisePower;
uniform 	vec3 _HSV;
uniform 	vec2 _NoisePoint_Tiling;
uniform 	vec2 _ColorOffset;
uniform 	float _ScanLineOffset;
uniform 	float _ScanLineWidth;
uniform 	float _ScanLineRate;
uniform 	float _NoisePoint_Intensity;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
bvec2 u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec3 u_xlat6;
bool u_xlatb6;
vec2 u_xlat7;
vec3 u_xlat8;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
vec2 u_xlat14;
float u_xlat18;
bool u_xlatb18;
float u_xlat19;
void main()
{
    u_xlat0.xy = vs_TEXCOORD0.xy * _NoisePoint_Tiling.xy;
    u_xlat0.zw = floor(u_xlat0.xy);
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat1 = u_xlat0.zwxy + vec4(1.0, 1.0, -1.0, -1.0);
    u_xlat2.x = dot(u_xlat1.xy, vec2(127.099998, 311.700012));
    u_xlat2.y = dot(u_xlat1.xy, vec2(269.5, 183.300003));
    u_xlat1.xy = u_xlat2.xy + _Time.yy;
    u_xlat1.xy = sin(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(43758.5469, 43758.5469);
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat1.xy = u_xlat1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.zw);
    u_xlat2 = u_xlat0.zwzw + vec4(1.0, 0.0, 0.0, 1.0);
    u_xlat3.x = dot(u_xlat2.zw, vec2(127.099998, 311.700012));
    u_xlat3.y = dot(u_xlat2.zw, vec2(269.5, 183.300003));
    u_xlat7.xy = u_xlat3.xy + _Time.yy;
    u_xlat7.xy = sin(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(43758.5469, 43758.5469);
    u_xlat7.xy = fract(u_xlat7.xy);
    u_xlat7.xy = u_xlat7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3 = u_xlat0.xyxy + vec4(-1.0, -0.0, -0.0, -1.0);
    u_xlat7.x = dot(u_xlat7.xy, u_xlat3.zw);
    u_xlat1.x = (-u_xlat7.x) + u_xlat1.x;
    u_xlat13.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat14.xy = (-u_xlat0.xy) * vec2(2.0, 2.0) + vec2(3.0, 3.0);
    u_xlat13.xy = u_xlat13.xy * u_xlat14.xy;
    u_xlat1.x = u_xlat13.x * u_xlat1.x + u_xlat7.x;
    u_xlat4.x = dot(u_xlat0.zw, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat0.zw, vec2(269.5, 183.300003));
    u_xlat12.xy = u_xlat4.xy + _Time.yy;
    u_xlat12.xy = sin(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(43758.5469, 43758.5469);
    u_xlat12.xy = fract(u_xlat12.xy);
    u_xlat12.xy = u_xlat12.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat0.x = dot(u_xlat12.xy, u_xlat0.xy);
    u_xlat4.x = dot(u_xlat2.xy, vec2(127.099998, 311.700012));
    u_xlat4.y = dot(u_xlat2.xy, vec2(269.5, 183.300003));
    u_xlat6.xy = u_xlat4.xy + _Time.yy;
    u_xlat6.xy = sin(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(43758.5469, 43758.5469);
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat6.xy = u_xlat6.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.x = dot(u_xlat6.xy, u_xlat3.xy);
    u_xlat6.x = (-u_xlat0.x) + u_xlat6.x;
    u_xlat0.x = u_xlat13.x * u_xlat6.x + u_xlat0.x;
    u_xlat6.x = (-u_xlat0.x) + u_xlat1.x;
    u_xlat0.x = u_xlat13.y * u_xlat6.x + u_xlat0.x;
    u_xlat0.x = dot(u_xlat0.xx, vec2(vec2(_NoisePoint_Intensity, _NoisePoint_Intensity)));
    u_xlat0.x = (-_NoisePoint_Intensity) * 0.100000001 + u_xlat0.x;
    u_xlat1.x = vs_TEXCOORD0.y * _ScanLineWidth;
    u_xlat1.y = _Time.y;
    u_xlat6.x = dot(u_xlat1.xy, vec2(12.9898005, 78.2330017));
    u_xlat6.x = sin(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 43758.5469;
    u_xlat6.x = fract(u_xlat6.x);
    u_xlat6.x = u_xlat6.x * 2.0 + -1.0;
    u_xlatb12 = abs(u_xlat6.x)>=_ScanLineRate;
    u_xlat12.x = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat12.x = u_xlat12.x * _ScanLineOffset;
    u_xlat1.x = u_xlat12.x * u_xlat6.x;
    u_xlat1.y = 0.0;
    u_xlat6.xy = u_xlat1.xy + vs_TEXCOORD0.xy;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat1.xy = u_xlat6.xy + _ColorOffset.xy;
    u_xlat1.x = texture2D(_MainTex, u_xlat1.xy).x;
    u_xlat2.xy = u_xlat6.xy + (-_ColorOffset.xy);
    u_xlat1.z = texture2D(_MainTex, u_xlat2.xy).z;
    u_xlat1.y = texture2D(_MainTex, u_xlat6.xy).y;
    u_xlat1.xyz = u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xw = u_xlat6.xy * vec2(_BlockTiling01.x, _BlockTiling01.y);
    u_xlat0.xw = floor(u_xlat0.xw);
    u_xlat0.xw = u_xlat0.xw + vec2(1.0, 1.0);
    u_xlat19 = float(_RandomSeed);
    u_xlat0.xw = u_xlat0.xw * vec2(u_xlat19);
    u_xlat0.x = dot(u_xlat0.xw, vec2(12.9898005, 78.2330017));
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * 43758.5469;
    u_xlat2.xy = u_xlat6.xy * _BlockTiling02.xy;
    u_xlat2.xy = floor(u_xlat2.xy);
    u_xlat2.xy = u_xlat2.xy + vec2(1.0, 1.0);
    u_xlat2.xy = vec2(u_xlat19) * u_xlat2.xy;
    u_xlat18 = dot(u_xlat2.xy, vec2(12.9898005, 78.2330017));
    u_xlat18 = sin(u_xlat18);
    u_xlat0.w = u_xlat18 * 43758.5469;
    u_xlat0.xw = fract(u_xlat0.xw);
    u_xlat0.x = u_xlat0.w * u_xlat0.x;
    u_xlat18 = (-_NoisePower) + 1.0;
    u_xlat18 = max(u_xlat18, 0.00999999978);
    u_xlatb18 = u_xlat0.x>=u_xlat18;
    u_xlat18 = u_xlatb18 ? 1.0 : float(0.0);
    u_xlat6.xy = vec2(u_xlat18) * u_xlat0.xx + u_xlat6.xy;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlatb0.x = u_xlat0.x>=0.00999999978;
    u_xlat6.xy = fract(u_xlat6.xy);
    u_xlat2.xyw = texture2D(_MainTex, u_xlat6.xy).yzx;
    u_xlatb6 = u_xlat2.x>=u_xlat2.y;
    u_xlat16_5 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat3.xy = u_xlat2.yx;
    u_xlat4.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat3 = vec4(u_xlat16_5) * u_xlat4 + u_xlat3;
    u_xlatb0.y = u_xlat2.w>=u_xlat3.x;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
;
    u_xlat2.xyz = u_xlat3.xyw;
    u_xlat3.xyw = u_xlat2.wyx;
    u_xlat3 = (-u_xlat2) + u_xlat3;
    u_xlat2 = u_xlat0.yyyy * u_xlat3 + u_xlat2;
    u_xlat6.x = min(u_xlat2.y, u_xlat2.w);
    u_xlat6.x = (-u_xlat6.x) + u_xlat2.x;
    u_xlat12.x = u_xlat6.x * 6.0 + 1.00000001e-10;
    u_xlat18 = (-u_xlat2.y) + u_xlat2.w;
    u_xlat12.x = u_xlat18 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x + u_xlat2.z;
    u_xlat12.x = abs(u_xlat12.x) + _HSV.x;
    u_xlat18 = u_xlat12.x * 360.0;
    u_xlatb18 = u_xlat18>=(-u_xlat18);
    u_xlat8.xy = (bool(u_xlatb18)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat12.x = u_xlat12.x * u_xlat8.y;
    u_xlat12.x = fract(u_xlat12.x);
    u_xlat8.xyz = u_xlat8.xxx * u_xlat12.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat8.xyz = fract(u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat8.xyz = abs(u_xlat8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
    u_xlat8.xyz = u_xlat8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat12.x = u_xlat2.x + 1.00000001e-10;
    u_xlat6.x = u_xlat6.x / u_xlat12.x;
    u_xlat6.x = u_xlat6.x * _HSV.y;
    u_xlat6.xyz = u_xlat6.xxx * u_xlat8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat6.xyz = u_xlat6.xyz * u_xlat2.xxx;
    u_xlat6.xyz = _HSV.zzz * u_xlat6.xyz + (-u_xlat1.xyz);
    SV_Target0.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat1.xyz;
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