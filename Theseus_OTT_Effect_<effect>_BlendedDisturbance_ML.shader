//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/<effect>_BlendedDisturbance_ML" {
Properties {

_Diffuse ("Diffuse", 2D) = "white" { }

_Noise ("Noise", 2D) = "white" { }

_DisturbanceIntensity ("DisturbanceIntensity", Range(0, 1)) = 0.3887324035167694

_Mask ("Mask", 2D) = "white" { }

_ColorIntensity ("ColorIntensity", Float) = 5.0

_V ("V", Float) = 0.0

_U ("U", Float) = 2.0

_Color ("Color", Color) = (0.5,0.5,0.5,1)

[Toggle] _Crystal_UseCustomColor ("UseCustomColor", Float) = 0.0

_Crystal_CustomColorHSV ("CustomColorHSV", Vector) = (0,1,1,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 61981
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
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
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _TimeEditor.y + _Time.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = texture(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_2.x = texture(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat16_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
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
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _TimeEditor.y + _Time.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = texture(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_2.x = texture(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat16_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2.x = texture2D(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat10_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_2.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb8){
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat10_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat10_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2.x = texture2D(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat10_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_2.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb8){
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat10_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat10_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
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
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _TimeEditor.y + _Time.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = texture(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_2.x = texture(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat16_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
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
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _TimeEditor.y + _Time.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.x = texture(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat16_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = texture(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_2.x = texture(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb8){
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.y>=u_xlat16_1.z);
#else
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
#endif
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb8 = !!(u_xlat16_1.x>=u_xlat3.x);
#else
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
#endif
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat16_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2.x = texture2D(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat10_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_2.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb8){
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat10_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat10_2.x * u_xlat16_1.x;
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
uniform 	mediump vec4 _Noise_ST;
uniform 	float _V;
uniform 	float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
float u_xlat4;
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
    u_xlat0.xy = vec2(_U, _V) * vec2(0.5, 0.5);
    u_xlat4 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat4) + in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = u_xlat0.xy * _Noise_ST.xy + _Noise_ST.zw;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump float _DisturbanceIntensity;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _ColorIntensity;
uniform 	mediump vec4 _Color;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
bool u_xlatb8;
float u_xlat10;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_18;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2.x = texture2D(_Noise, vs_TEXCOORD0.zw).x;
    u_xlat2.xy = vec2(_DisturbanceIntensity) * u_xlat10_2.xx + vs_TEXCOORD0.xy;
    u_xlat16_3.xy = u_xlat2.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_2 = texture2D(_Diffuse, u_xlat16_3.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat2.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_2.x = texture2D(_Mask, u_xlat2.xy).x;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * u_xlat16_0.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_ColorIntensity);
    u_xlatb8 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb8){
        u_xlatb8 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat16_18 = (u_xlatb8) ? 1.0 : 0.0;
        u_xlat8.xy = u_xlat16_0.yz * vec2(_ColorIntensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = vec2(u_xlat16_18) * u_xlat8.xy;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_ColorIntensity) + u_xlat8.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb8 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat8.x = u_xlatb8 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _ColorIntensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat8.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat8.x = u_xlat8.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat14 = min(u_xlat4.y, u_xlat8.x);
        u_xlat14 = (-u_xlat14) + u_xlat4.x;
        u_xlat8.x = (-u_xlat4.y) + u_xlat8.x;
        u_xlat10 = u_xlat14 * 6.0 + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat10;
        u_xlat8.x = u_xlat8.x + u_xlat4.z;
        u_xlat10 = u_xlat4.x + 1.00000001e-10;
        u_xlat14 = u_xlat14 / u_xlat10;
        u_xlat16_19 = abs(u_xlat8.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat14 * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat4.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat4.xyz = fract(u_xlat4.xyz);
        u_xlat4.xyz = u_xlat4.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat4.xyz = abs(u_xlat4.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat4.xyz = vec3(u_xlat16_5) * u_xlat4.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat4.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat10_2.w * _Color.w;
    u_xlat16_1.x = u_xlat16_1.x * vs_COLOR0.w;
    SV_Target0.w = u_xlat10_2.x * u_xlat16_1.x;
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