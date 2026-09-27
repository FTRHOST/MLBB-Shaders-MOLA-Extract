//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_SpaceDistort" {
Properties {

_ZWrite ("ZWrite", Float) = 0.0

[Toggle] _EnableCustomData ("EnableCustomData", Float) = 0.0

_NoiseTex ("NoiseTex", 2D) = "black" { }

[Toggle] _EnableNoisePolarUV ("EnableNoisePolarUV", Float) = 0.0

_NoiseStrength ("NoiseStrength", Range(0, 10)) = 1.0

_NoiseSpeedX ("NoiseSpeedX", Range(-2, 2)) = 0.0

_NoiseSpeedY ("NoiseSpeedY", Range(-2, 2)) = 0.0

_MaskTex ("Mask", 2D) = "white" { }

_Sharpness ("Sharpness", Range(1, 128)) = 1.0

[Toggle] _EnableMaskPolarUV ("EnableMaskPolarUV", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 GrabPass {
 "_GrabTex_HotDissolve"
}
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 35952
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
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTex_HotDissolve;
in mediump vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec2 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = ivec2(uvec2((uint(u_xlatb11.x) * 0xffffffffu) & (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb11.y) * 0xffffffffu) & (uint(u_xlatb2.y) * 0xffffffffu)));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EnableCustomData>=0.5);
#else
    u_xlatb0 = _EnableCustomData>=0.5;
#endif
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat16_10 = texture(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat16_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.xyz = texture(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTex_HotDissolve;
in mediump vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec2 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = ivec2(uvec2((uint(u_xlatb11.x) * 0xffffffffu) & (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb11.y) * 0xffffffffu) & (uint(u_xlatb2.y) * 0xffffffffu)));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EnableCustomData>=0.5);
#else
    u_xlatb0 = _EnableCustomData>=0.5;
#endif
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat16_10 = texture(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat16_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.xyz = texture(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat16_0.xyz;
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
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTex_HotDissolve;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec2 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
lowp float u_xlat10_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = op_and((ivec2(u_xlatb11.xy) * -1), (ivec2(u_xlatb2.xy) * -1));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
    u_xlatb0 = _EnableCustomData>=0.5;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat10_10 = texture2D(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat10_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat10_0.xyz = texture2D(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
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
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTex_HotDissolve;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec2 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
lowp float u_xlat10_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = op_and((ivec2(u_xlatb11.xy) * -1), (ivec2(u_xlatb2.xy) * -1));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
    u_xlatb0 = _EnableCustomData>=0.5;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat10_10 = texture2D(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat10_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat10_0.xyz = texture2D(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    SV_Target0.xyz = u_xlat10_0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTex_HotDissolve;
in mediump vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = ivec2(uvec2((uint(u_xlatb11.x) * 0xffffffffu) & (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb11.y) * 0xffffffffu) & (uint(u_xlatb2.y) * 0xffffffffu)));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EnableCustomData>=0.5);
#else
    u_xlatb0 = _EnableCustomData>=0.5;
#endif
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat16_10 = texture(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat16_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.xyz = texture(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
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
in highp vec4 in_POSITION0;
in mediump vec4 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
UNITY_LOCATION(0) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTex;
UNITY_LOCATION(2) uniform mediump sampler2D _GrabTex_HotDissolve;
in mediump vec4 vs_COLOR0;
in mediump vec4 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
mediump float u_xlat16_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = ivec2(uvec2((uint(u_xlatb11.x) * 0xffffffffu) & (uint(u_xlatb2.x) * 0xffffffffu), (uint(u_xlatb11.y) * 0xffffffffu) & (uint(u_xlatb2.y) * 0xffffffffu)));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_EnableCustomData>=0.5);
#else
    u_xlatb0 = _EnableCustomData>=0.5;
#endif
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat16_10 = texture(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat16_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat16_0.xyz = texture(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat16_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTex_HotDissolve;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
lowp float u_xlat10_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = op_and((ivec2(u_xlatb11.xy) * -1), (ivec2(u_xlatb2.xy) * -1));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
    u_xlatb0 = _EnableCustomData>=0.5;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat10_10 = texture2D(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat10_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat10_0.xyz = texture2D(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute mediump vec4 in_TEXCOORD0;
attribute mediump vec4 in_TEXCOORD1;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_COLOR0.xy = in_TEXCOORD1.zw;
    vs_COLOR0.zw = in_COLOR0.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.ww + u_xlat0.xy;
    vs_TEXCOORD1.zw = u_xlat0.zw;
    vs_TEXCOORD1.xy = u_xlat0.xy * vec2(0.5, 0.5);
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
uniform 	mediump vec4 _MaskTex_ST;
uniform 	mediump float _NoiseStrength;
uniform 	mediump float _NoiseSpeedX;
uniform 	mediump float _NoiseSpeedY;
uniform 	mediump float _Sharpness;
uniform 	mediump float _EnableCustomData;
uniform 	mediump float _EnableMaskPolarUV;
uniform 	mediump float _EnableNoisePolarUV;
uniform lowp sampler2D _MaskTex;
uniform lowp sampler2D _NoiseTex;
uniform lowp sampler2D _GrabTex_HotDissolve;
varying mediump vec4 vs_COLOR0;
varying mediump vec4 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
bvec3 u_xlatb2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
mediump float u_xlat16_8;
float u_xlat10;
lowp float u_xlat10_10;
vec2 u_xlat11;
ivec2 u_xlati11;
bvec2 u_xlatb11;
bvec2 u_xlatb12;
mediump vec2 u_xlat16_13;
const int BITWISE_BIT_COUNT = 32;
int op_modi(int x, int y) { return x - y * (x / y); }
ivec2 op_modi(ivec2 a, ivec2 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); return a; }
ivec3 op_modi(ivec3 a, ivec3 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); return a; }
ivec4 op_modi(ivec4 a, ivec4 b) { a.x = op_modi(a.x, b.x); a.y = op_modi(a.y, b.y); a.z = op_modi(a.z, b.z); a.w = op_modi(a.w, b.w); return a; }

int op_and(int a, int b) { int result = 0; int n = 1; for (int i = 0; i < BITWISE_BIT_COUNT; i++) { if ((op_modi(a, 2) != 0) && (op_modi(b, 2) != 0)) { result += n; } a = a / 2; b = b / 2; n = n * 2; if (!(a > 0 && b > 0)) { break; } } return result; }
ivec2 op_and(ivec2 a, ivec2 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); return a; }
ivec3 op_and(ivec3 a, ivec3 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); return a; }
ivec4 op_and(ivec4 a, ivec4 b) { a.x = op_and(a.x, b.x); a.y = op_and(a.y, b.y); a.z = op_and(a.z, b.z); a.w = op_and(a.w, b.w); return a; }

void main()
{
    u_xlat0 = vs_TEXCOORD0 + vec4(-0.5, -0.5, -0.5, -0.5);
    u_xlat1.xy = max(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = vec2(1.0, 1.0) / u_xlat1.xy;
    u_xlat11.xy = min(abs(u_xlat0.yw), abs(u_xlat0.xz));
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy;
    u_xlat11.xy = u_xlat1.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat11.xy * vec2(0.0208350997, 0.0208350997) + vec2(-0.0851330012, -0.0851330012);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.180141002, 0.180141002);
    u_xlat2.xy = u_xlat11.xy * u_xlat2.xy + vec2(-0.330299497, -0.330299497);
    u_xlat11.xy = u_xlat11.xy * u_xlat2.xy + vec2(0.999866009, 0.999866009);
    u_xlat2.xy = u_xlat11.xy * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(-2.0, -2.0) + vec2(1.57079637, 1.57079637);
    u_xlatb12.xy = lessThan(abs(u_xlat0.ywyw), abs(u_xlat0.xzxz)).xy;
    u_xlat2.x = u_xlatb12.x ? u_xlat2.x : 0.0;
    u_xlat2.y = u_xlatb12.y ? u_xlat2.y : 0.0;
;
    u_xlat1.xy = u_xlat1.xy * u_xlat11.xy + u_xlat2.xy;
    u_xlatb11.xy = lessThan(u_xlat0.ywyw, (-u_xlat0.ywyw)).xy;
    u_xlat11.x = u_xlatb11.x ? float(-3.14159274) : 0.0;
    u_xlat11.y = u_xlatb11.y ? float(-3.14159274) : 0.0;
;
    u_xlat1.xy = u_xlat11.xy + u_xlat1.xy;
    u_xlat11.xy = min(u_xlat0.yw, u_xlat0.xz);
    u_xlatb11.xy = lessThan(u_xlat11.xyxy, (-u_xlat11.xyxy)).xy;
    u_xlat2.xy = max(u_xlat0.yw, u_xlat0.xz);
    u_xlatb2.xy = greaterThanEqual(u_xlat2.xyxx, (-u_xlat2.xyxx)).xy;
    u_xlati11.xy = op_and((ivec2(u_xlatb11.xy) * -1), (ivec2(u_xlatb2.xy) * -1));
    {
        vec4 hlslcc_movcTemp = u_xlat1;
        hlslcc_movcTemp.x = (u_xlati11.x != 0) ? (-u_xlat1.x) : u_xlat1.x;
        hlslcc_movcTemp.y = (u_xlati11.y != 0) ? (-u_xlat1.y) : u_xlat1.y;
        u_xlat1 = hlslcc_movcTemp;
    }
    u_xlat1.zw = u_xlat1.xy * vec2(0.159154937, 0.159154937);
    u_xlatb2.xyz = lessThan(vec4(0.5, 0.5, 0.5, 0.0), vec4(_EnableMaskPolarUV, _EnableCustomData, _EnableNoisePolarUV, _EnableMaskPolarUV)).xyz;
    u_xlat10 = dot(u_xlat0.zw, u_xlat0.zw);
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat1.y = u_xlat0.x + u_xlat0.x;
    u_xlat16_3.xy = (u_xlatb2.x) ? u_xlat1.yz : vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _MaskTex_ST.xy + _MaskTex_ST.zw;
    u_xlat0.x = sqrt(u_xlat10);
    u_xlat1.x = u_xlat0.x + u_xlat0.x;
    u_xlat16_13.xy = (u_xlatb2.z) ? u_xlat1.xw : vs_TEXCOORD0.zw;
    u_xlatb0 = _EnableCustomData>=0.5;
    u_xlat16_4 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xy = vs_COLOR0.xy * vec2(u_xlat16_4) + vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * vec2(u_xlat16_4) + u_xlat16_3.xy;
    u_xlat10_10 = texture2D(_MaskTex, u_xlat16_3.xy).x;
    u_xlat16_3.x = log2(u_xlat10_10);
    u_xlat16_3.x = u_xlat16_3.x * _Sharpness;
    u_xlat16_3.x = exp2(u_xlat16_3.x);
    u_xlat0.xy = (u_xlatb2.y) ? u_xlat0.xy : vec2(_NoiseSpeedX, _NoiseSpeedY);
    u_xlat0.xy = u_xlat0.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_13.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat0.x = u_xlat10_0.x + -0.5;
    u_xlat16_8 = vs_COLOR0.w * _NoiseStrength;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_8;
    u_xlat0.xy = u_xlat0.xx * u_xlat16_3.xx + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD1.ww;
    u_xlat10_0.xyz = texture2D(_GrabTex_HotDissolve, u_xlat0.xy).xyz;
    u_xlat16_3.xyz = max(u_xlat10_0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_ASEffect_FX_SpaceDistortGUI"
}