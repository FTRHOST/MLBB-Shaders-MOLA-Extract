//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/EffectWater" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_BaseColor ("BaseColor", Color) = (1,1,1,1)

_MatcapTex ("Matcap Tex", 2D) = "white" { }

[Range] _MatcapStrong ("MatcapStrong", Range(0, 3)) = 1.0

[Range] _AlphaSpecFactor ("高光半透明因子", Range(0, 10)) = 0.0

[Toggle] _UseHue ("UseHue", Float) = 0.0

_Hue ("HUE", Range(-0.5, 0.5)) = 0.0

_Saturation ("Saturation", Range(0, 5)) = 1.0

_Brightness ("Brightness", Range(0, 5)) = 1.0

[Space(20)] _NormalTex ("Normal法线", 2D) = "bump" { }

_NormalScale1 ("NormalScale1", Range(0, 3)) = 1.0

_FlowSpeed1X ("FlowSpeed1X", Range(-1, 1)) = 0.0

_FlowSpeed1Y ("FlowSpeed1Y", Range(-1, 1)) = 0.0

_DetailNormal ("细节法线", 2D) = "bump" { }

_NormalScale2 ("NormalScale2", Range(0, 3)) = 1.0

_FlowSpeed2X ("FlowSpeed2X", Range(-1, 1)) = 0.0

_FlowSpeed2Y ("FlowSpeed2Y", Range(-1, 1)) = 0.0

[Space(20)] _VATex ("VATex", 2D) = "white" { }

_VA_Inten ("VA Inten", Range(-0.2, 0.2)) = 0.009999999776482582

[Space(20)] [Toggle] _UseFresnal ("UseFresnal", Float) = 0.0

_FresnalColor ("FresnalColor", Color) = (1,1,1,1)

_FresnalScale ("_FresnalScale", Range(0, 10)) = 1.0

_FresnalPower ("_FresnalPower", Range(0, 16)) = 3.0

[Space(20)] [Header(Noise Texture)] [WrapMode] _NoiseTex_Wrap ("Noise Wrap Mode", Float) = 0.0

_NoiseTex ("Noise Texture", 2D) = "white" { }

[ScaleOffset] _NoiseTex_Scroll ("Scroll", Vector) = (0,0,0,0)

_Noise_Strenght ("Noise Strenght", Float) = 0.0

[Space(20)] _DissolveValue ("Dissolve Value", Range(-1, 1)) = 0.0

_Smoothness ("Smoothness", Range(0.001, 1)) = 0.20000000298023224

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 2092
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
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(4) uniform mediump sampler2D _VATex;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TANGENT0;
in mediump vec3 in_NORMAL0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _VATex_ST.zw * _Time.yy;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _DetailNormal_ST.zw * _Time.yy;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DetailNormal;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _NoiseTex_Scroll.x * _Time.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_DissolveValue);
#else
    u_xlatb0 = 0.0<_DissolveValue;
#endif
    u_xlat16_7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7.x;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DissolveValue<0.0);
#else
    u_xlatb0 = _DissolveValue<0.0;
#endif
    u_xlat16_7.x = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=u_xlat16_7.x);
#else
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7.x;
#endif
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat16_0.xyz = texture(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat16_0.xyz = texture(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_UseHue);
#else
    u_xlatb0 = 0<_UseHue;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_UseFresnal);
#else
    u_xlatb18 = 0.0<_UseFresnal;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_7.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7.x + u_xlat16_1.x;
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
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(4) uniform mediump sampler2D _VATex;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TANGENT0;
in mediump vec3 in_NORMAL0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _VATex_ST.zw * _Time.yy;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _DetailNormal_ST.zw * _Time.yy;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DetailNormal;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _NoiseTex_Scroll.x * _Time.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_DissolveValue);
#else
    u_xlatb0 = 0.0<_DissolveValue;
#endif
    u_xlat16_7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7.x;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DissolveValue<0.0);
#else
    u_xlatb0 = _DissolveValue<0.0;
#endif
    u_xlat16_7.x = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=u_xlat16_7.x);
#else
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7.x;
#endif
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat16_0.xyz = texture(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat16_0.xyz = texture(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_UseHue);
#else
    u_xlatb0 = 0<_UseHue;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_7.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_UseFresnal);
#else
    u_xlatb18 = 0.0<_UseFresnal;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_7.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7.x + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
uniform lowp sampler2D _VATex;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec3 in_NORMAL0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = texture2DLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _DetailNormal;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _NoiseTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _Time.x * _NoiseTex_Scroll.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat10_0.x + -0.5;
    u_xlatb0 = 0.0<_DissolveValue;
    u_xlat16_7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7.x;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7.x;
    u_xlatb0 = _DissolveValue<0.0;
    u_xlat16_7.x = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7.x;
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat10_0.xyz = texture2D(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat10_0.xyz = texture2D(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture2D(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlatb0 = 0<_UseHue;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat10_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_7.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    u_xlatb18 = 0.0<_UseFresnal;
    u_xlat16_7.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_7.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7.x + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
uniform lowp sampler2D _VATex;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec3 in_NORMAL0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = texture2DLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _DetailNormal;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _NoiseTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _Time.x * _NoiseTex_Scroll.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat10_0.x + -0.5;
    u_xlatb0 = 0.0<_DissolveValue;
    u_xlat16_7.x = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7.x = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7.x;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7.x;
    u_xlatb0 = _DissolveValue<0.0;
    u_xlat16_7.x = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7.x;
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat10_0.xyz = texture2D(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat10_0.xyz = texture2D(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture2D(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlatb0 = 0<_UseHue;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat10_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_7.x = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7.x;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    u_xlatb18 = 0.0<_UseFresnal;
    u_xlat16_7.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_7.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat16_7.x = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7.x + u_xlat16_1.x;
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
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(4) uniform mediump sampler2D _VATex;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TANGENT0;
in mediump vec3 in_NORMAL0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _VATex_ST.zw * _Time.yy;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _DetailNormal_ST.zw * _Time.yy;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DetailNormal;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _NoiseTex_Scroll.x * _Time.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_DissolveValue);
#else
    u_xlatb0 = 0.0<_DissolveValue;
#endif
    u_xlat16_7 = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7 = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DissolveValue<0.0);
#else
    u_xlatb0 = _DissolveValue<0.0;
#endif
    u_xlat16_7 = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=u_xlat16_7);
#else
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7;
#endif
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat16_0.xyz = texture(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat16_0.xyz = texture(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_UseHue);
#else
    u_xlatb0 = 0<_UseHue;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_7 = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_UseFresnal);
#else
    u_xlatb18 = 0.0<_UseFresnal;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7 + u_xlat16_1.x;
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
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(4) uniform mediump sampler2D _VATex;
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TANGENT0;
in mediump vec3 in_NORMAL0;
out mediump vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _VATex_ST.zw * _Time.yy;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = textureLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _DetailNormal_ST.zw * _Time.yy;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
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
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _NormalTex;
UNITY_LOCATION(1) uniform mediump sampler2D _DetailNormal;
UNITY_LOCATION(2) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseTex;
in mediump vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in highp vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _NoiseTex_Scroll.x * _Time.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat16_0.x = texture(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_0.x + -0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_DissolveValue);
#else
    u_xlatb0 = 0.0<_DissolveValue;
#endif
    u_xlat16_7 = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7 = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_DissolveValue<0.0);
#else
    u_xlatb0 = _DissolveValue<0.0;
#endif
    u_xlat16_7 = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=u_xlat16_7);
#else
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7;
#endif
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat16_0.xyz = texture(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat16_0.xyz = texture(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_0 = texture(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.y>=u_xlat16_3.z);
#else
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_3.x>=u_xlat16_2.x);
#else
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
#endif
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0<_UseHue);
#else
    u_xlatb0 = 0<_UseHue;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat16_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_7 = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0<_UseFresnal);
#else
    u_xlatb18 = 0.0<_UseFresnal;
#endif
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7 + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
uniform lowp sampler2D _VATex;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec3 in_NORMAL0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = texture2DLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _DetailNormal;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _NoiseTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _Time.x * _NoiseTex_Scroll.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat10_0.x + -0.5;
    u_xlatb0 = 0.0<_DissolveValue;
    u_xlat16_7 = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7 = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7;
    u_xlatb0 = _DissolveValue<0.0;
    u_xlat16_7 = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7;
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat10_0.xyz = texture2D(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat10_0.xyz = texture2D(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture2D(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlatb0 = 0<_UseHue;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat10_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_7 = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    u_xlatb18 = 0.0<_UseFresnal;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7 + u_xlat16_1.x;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _VATex_ST;
uniform 	mediump float _VA_Inten;
uniform 	mediump vec4 _NormalTex_ST;
uniform 	mediump vec4 _DetailNormal_ST;
uniform lowp sampler2D _VATex;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec2 in_TEXCOORD1;
attribute mediump vec4 in_TANGENT0;
attribute mediump vec3 in_NORMAL0;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
float u_xlat12;
void main()
{
    u_xlat0.xy = _Time.yy * _VATex_ST.zw;
    u_xlat0.xy = in_TEXCOORD1.xy * _VATex_ST.xy + u_xlat0.xy;
    u_xlat0.x = texture2DLod(_VATex, u_xlat0.xy, 0.0).x;
    u_xlat0.x = u_xlat0.x * 0.100000001;
    u_xlat0.x = u_xlat0.x * _VA_Inten;
    u_xlat4.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat4.xyz;
    u_xlat4.xyz = u_xlat4.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1.xyz = u_xlat4.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat2 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat2;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat2;
    u_xlat1.xy = _Time.yy * _DetailNormal_ST.zw;
    u_xlat1.xy = in_TEXCOORD1.xy * _DetailNormal_ST.xy + u_xlat1.xy;
    vs_TEXCOORD0.zw = u_xlat1.xy;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = in_TEXCOORD0.xy * _NormalTex_ST.xy + _NormalTex_ST.zw;
    vs_TEXCOORD1.xy = in_TEXCOORD1.xy;
    u_xlat16_3.x = dot(in_NORMAL0.xyz, in_NORMAL0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_NORMAL0.xyz;
    u_xlat1.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat1.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD2.w = u_xlat4.x;
    vs_TEXCOORD3.w = u_xlat4.y;
    vs_TEXCOORD4.w = u_xlat4.z;
    u_xlat16_3.x = dot(in_TANGENT0.xyz, in_TANGENT0.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_3.xyz = u_xlat16_3.xxx * in_TANGENT0.xyz;
    u_xlat0.xyz = u_xlat16_3.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat16_3.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat16_3.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_TEXCOORD3.xyz = u_xlat0.xyz;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy;
    u_xlat0.xyz = u_xlat1.yzx * u_xlat0.zxy + (-u_xlat2.xyz);
    vs_TEXCOORD4.xyz = u_xlat0.xyz * in_TANGENT0.www;
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
uniform 	vec3 _WorldSpaceCameraPos;
uniform 	vec4 hlslcc_mtx4x4unity_MatrixV[4];
uniform 	mediump vec4 _BaseColor;
uniform 	mediump float _MatcapStrong;
uniform 	int _UseHue;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Brightness;
uniform 	mediump float _NormalScale1;
uniform 	mediump float _FlowSpeed1X;
uniform 	mediump float _FlowSpeed1Y;
uniform 	mediump float _NormalScale2;
uniform 	mediump float _FlowSpeed2X;
uniform 	mediump float _FlowSpeed2Y;
uniform 	mediump float _AlphaSpecFactor;
uniform 	mediump float _DissolveValue;
uniform 	mediump vec4 _NoiseTex_ST;
uniform 	mediump vec2 _NoiseTex_Scroll;
uniform 	mediump float _Noise_Strenght;
uniform 	mediump float _UseFresnal;
uniform 	mediump vec4 _FresnalColor;
uniform 	mediump float _FresnalScale;
uniform 	mediump float _FresnalPower;
uniform lowp sampler2D _NormalTex;
uniform lowp sampler2D _DetailNormal;
uniform lowp sampler2D _MatcapTex;
uniform lowp sampler2D _NoiseTex;
varying mediump vec4 vs_TEXCOORD0;
varying mediump vec4 vs_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
float u_xlat5;
mediump float u_xlat16_7;
mediump vec3 u_xlat16_8;
float u_xlat12;
mediump float u_xlat16_13;
bool u_xlatb18;
mediump float u_xlat16_19;
mediump float u_xlat16_21;
void main()
{
    u_xlat0.x = _Time.x * _NoiseTex_Scroll.x;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_1.xy = vs_TEXCOORD1.xy * _NoiseTex_ST.xy + _NoiseTex_ST.zw;
    u_xlat0.xy = u_xlat0.xx + u_xlat16_1.xy;
    u_xlat10_0.x = texture2D(_NoiseTex, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat10_0.x + -0.5;
    u_xlatb0 = 0.0<_DissolveValue;
    u_xlat16_7 = (-vs_TEXCOORD1.x) + 1.0;
    u_xlat16_7 = (u_xlatb0) ? vs_TEXCOORD1.x : u_xlat16_7;
    u_xlat16_1.x = u_xlat16_1.x * _Noise_Strenght + u_xlat16_7;
    u_xlatb0 = _DissolveValue<0.0;
    u_xlat16_7 = (u_xlatb0) ? abs(_DissolveValue) : _DissolveValue;
    u_xlatb0 = u_xlat16_1.x>=u_xlat16_7;
    if(!u_xlatb0){discard;}
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed2X, _FlowSpeed2Y) + vs_TEXCOORD0.zw;
    u_xlat10_0.xyz = texture2D(_DetailNormal, u_xlat0.xy).xyz;
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_1.xy = vec2(u_xlat16_13) * u_xlat16_1.xy;
    u_xlat16_1.xy = u_xlat16_1.xy * vec2(_NormalScale2);
    u_xlat0.xy = _Time.yy * vec2(_FlowSpeed1X, _FlowSpeed1Y) + vs_TEXCOORD1.zw;
    u_xlat10_0.xyz = texture2D(_NormalTex, u_xlat0.xy).xyz;
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_13 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat16_13 = inversesqrt(u_xlat16_13);
    u_xlat16_2.xyz = vec3(u_xlat16_13) * u_xlat16_2.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy * vec2(_NormalScale1) + u_xlat16_1.xy;
    u_xlat0.x = vs_TEXCOORD3.x;
    u_xlat0.y = vs_TEXCOORD4.x;
    u_xlat0.z = vs_TEXCOORD2.x;
    u_xlat16_1.x = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.y;
    u_xlat0.y = vs_TEXCOORD4.y;
    u_xlat0.z = vs_TEXCOORD2.y;
    u_xlat16_1.y = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat0.x = vs_TEXCOORD3.z;
    u_xlat0.y = vs_TEXCOORD4.z;
    u_xlat0.z = vs_TEXCOORD2.z;
    u_xlat16_1.z = dot(u_xlat16_2.xyz, u_xlat0.xyz);
    u_xlat16_19 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat16_19 = inversesqrt(u_xlat16_19);
    u_xlat16_1.xyz = vec3(u_xlat16_19) * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * u_xlat16_1.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * u_xlat16_1.zzz + u_xlat0.xyz;
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xy = vec2(u_xlat12) * u_xlat0.xy;
    u_xlat16_2.xy = u_xlat0.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat10_0 = texture2D(_MatcapTex, u_xlat16_2.xy);
    u_xlat16_2.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(_MatcapStrong);
    u_xlatb0 = u_xlat16_3.y>=u_xlat16_3.z;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.xy = u_xlat16_3.zy;
    u_xlat16_2.xy = u_xlat16_2.yz * vec2(_MatcapStrong) + (-u_xlat16_4.xy);
    u_xlat16_4.z = float(-1.0);
    u_xlat16_4.w = float(0.666666687);
    u_xlat16_2.z = float(1.0);
    u_xlat16_2.w = float(-1.0);
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_2.xywz + u_xlat16_4.xywz;
    u_xlatb0 = u_xlat16_3.x>=u_xlat16_2.x;
    u_xlat16_19 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_4.z = u_xlat16_2.w;
    u_xlat16_2.w = u_xlat16_3.x;
    u_xlat16_4.xyw = u_xlat16_2.wyx;
    u_xlat16_4 = (-u_xlat16_2) + u_xlat16_4;
    u_xlat16_2 = vec4(u_xlat16_19) * u_xlat16_4 + u_xlat16_2;
    u_xlat16_19 = min(u_xlat16_2.y, u_xlat16_2.w);
    u_xlat16_19 = (-u_xlat16_19) + u_xlat16_2.x;
    u_xlat16_21 = u_xlat16_19 * 6.0 + 1.00000001e-10;
    u_xlat16_8.x = (-u_xlat16_2.y) + u_xlat16_2.w;
    u_xlat16_8.x = u_xlat16_8.x / u_xlat16_21;
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_2.z;
    u_xlat16_8.x = abs(u_xlat16_8.x) + _Hue;
    u_xlat16_8.xyz = u_xlat16_8.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_21 = u_xlat16_2.x + 1.00000001e-10;
    u_xlat16_19 = u_xlat16_19 / u_xlat16_21;
    u_xlat16_19 = u_xlat16_19 * _Saturation;
    u_xlat16_8.xyz = vec3(u_xlat16_19) * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.xyz = u_xlat16_8.xyz * u_xlat16_2.xxx;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_Brightness, _Brightness, _Brightness));
    u_xlatb0 = 0<_UseHue;
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_2.xyz : u_xlat16_3.xyz;
    u_xlat16_3.xyz = _BaseColor.xyz * _BaseColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _FresnalColor.xyz * _FresnalColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat0.x = vs_TEXCOORD3.w;
    u_xlat0.y = vs_TEXCOORD4.w;
    u_xlat0.z = vs_TEXCOORD2.w;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat5 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat5 = inversesqrt(u_xlat5);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat5);
    u_xlat16_1.x = dot(u_xlat16_1.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 0.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat0.x = log2(u_xlat16_1.x);
    u_xlat16_1.x = u_xlat10_0.w + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * _AlphaSpecFactor + -0.0199999996;
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
    u_xlat16_7 = exp2(_FresnalPower);
    u_xlat0.x = u_xlat0.x * u_xlat16_7;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _FresnalScale;
    u_xlat0.xyz = u_xlat16_3.xyz * u_xlat0.xxx + u_xlat16_2.xyz;
    u_xlatb18 = 0.0<_UseFresnal;
    SV_Target0.xyz = (bool(u_xlatb18)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    u_xlat16_7 = (-u_xlat16_1.x) + 1.0;
    SV_Target0.w = _BaseColor.w * u_xlat16_7 + u_xlat16_1.x;
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
}