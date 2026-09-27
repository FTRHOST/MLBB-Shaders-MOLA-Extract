//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/<effect>_AdditiveUV" {
Properties {

_diffuse ("diffuse", 2D) = "white" { }

_Intensity ("Intensity", Float) = 1.0

_mask ("mask", 2D) = "white" { }

_Color ("Color", Color) = (0.5,0.5,0.5,1)

_Uspeed ("Uspeed", Float) = 0.0

_Vspeed ("Vspeed", Float) = 0.0

[Toggle] _Crystal_UseCustomColor ("UseCustomColor", Float) = 0.0

_Crystal_CustomColorHSV ("CustomColorHsv", Vector) = (0,1,1,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 58757
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _TimeEditor.y + _Time.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.x = texture(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat16_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb2){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _TimeEditor.y + _Time.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.x = texture(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat16_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb2){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _diffuse;
uniform lowp sampler2D _mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat10_2.x = texture2D(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat10_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat10_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _diffuse;
uniform lowp sampler2D _mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat10_2.x = texture2D(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat10_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat10_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _TimeEditor.y + _Time.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.x = texture(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat16_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb2){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
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
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _TimeEditor.y + _Time.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.x = texture(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat16_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat16_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb2){
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb2 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _diffuse;
uniform lowp sampler2D _mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat10_2.x = texture2D(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat10_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat10_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
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

uniform 	vec4 _Time;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _TimeEditor;
uniform 	vec4 _diffuse_ST;
uniform 	vec4 _mask_ST;
uniform 	float _Uspeed;
uniform 	float _Vspeed;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    u_xlat0.x = _Time.y + _TimeEditor.y;
    u_xlat0 = u_xlat0.xxxx * vec4(_Uspeed, _Uspeed, _Vspeed, _Vspeed);
    u_xlat0 = u_xlat0 * vec4(1.0, 0.0, 0.0, 1.0) + in_TEXCOORD0.xyxy;
    u_xlat4.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat4.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _diffuse_ST.xy + _diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _mask_ST.xy + _mask_ST.zw;
    vs_COLOR0 = in_COLOR0;
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
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _diffuse;
uniform lowp sampler2D _mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
vec3 u_xlat8;
vec2 u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat10_2.x = texture2D(_mask, vs_TEXCOORD0.zw).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _Color.www;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_18 = u_xlat10_2.w * vs_COLOR0.w;
    u_xlat16_18 = u_xlat10_2.x * u_xlat16_18;
    u_xlat16_1.xyz = vec3(u_xlat16_18) * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb2) ? 1.0 : 0.0;
        u_xlat2.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat14.x = float(1.0);
        u_xlat14.y = float(-1.0);
        u_xlat2.xy = vec2(u_xlat16_18) * u_xlat2.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat2.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat14.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat8.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat4.x = min(u_xlat8.y, u_xlat2.x);
        u_xlat4.x = u_xlat8.x + (-u_xlat4.x);
        u_xlat2.x = (-u_xlat8.y) + u_xlat2.x;
        u_xlat14.x = u_xlat4.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14.x;
        u_xlat2.x = u_xlat2.x + u_xlat8.z;
        u_xlat14.x = u_xlat8.x + 1.00000001e-10;
        u_xlat8.y = u_xlat4.x / u_xlat14.x;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat8.yx * _Crystal_CustomColorHSV.yz;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = u_xlat16_5.xxx * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * u_xlat16_5.yyy;
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    SV_Target0.xyz = u_xlat16_1.xyz;
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
}