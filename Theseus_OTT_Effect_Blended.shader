//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/Blended" {
Properties {

_Diffuse ("Diffuse", 2D) = "white" { }

_Intensity ("Intensity", Float) = 0.0

_Color ("Color", Color) = (0.5,0.5,0.5,1)

_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5

[Toggle] _Crystal_UseCustomColor ("UseCustomColor", Float) = 0.0

_Crystal_CustomColorHSV ("CustomColorHsv", Vector) = (0,1,1,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 37014
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
uniform 	mediump vec4 _Diffuse_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
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
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
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
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
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
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
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
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat16_19 = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_19 * _Color.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
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
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
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
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
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
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
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
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat16_19 = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_19 * _Color.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
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
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat16_19 = u_xlat10_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_19 * _Color.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
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
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat1.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        u_xlat16_1.xyz = u_xlat1.xyz;
    }
    u_xlat16_19 = u_xlat10_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_19 * _Color.w;
    u_xlat2.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
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
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
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
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
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
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * _Color.w;
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
uniform 	mediump vec4 _Diffuse_ST;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
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
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
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
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
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
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
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
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat16_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * _Color.w;
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat10_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * _Color.w;
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
uniform 	mediump vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
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
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	mediump float _Intensity;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec4 _Crystal_CustomColorHSV;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec4 u_xlat4;
mediump float u_xlat16_5;
vec2 u_xlat8;
mediump float u_xlat16_11;
float u_xlat14;
mediump float u_xlat16_19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlatb2 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb2){
        u_xlatb2 = u_xlat16_1.y>=u_xlat16_1.z;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat8.xy = u_xlat16_0.yz * vec2(_Intensity) + (-u_xlat16_1.zy);
        u_xlat4.x = float(1.0);
        u_xlat4.y = float(-1.0);
        u_xlat8.xy = u_xlat8.xy * u_xlat2.xx;
        u_xlat3.xy = u_xlat16_0.zy * vec2(_Intensity) + u_xlat8.xy;
        u_xlat3.zw = u_xlat2.xx * u_xlat4.xy + vec2(-1.0, 0.666666687);
        u_xlatb2 = u_xlat16_1.x>=u_xlat3.x;
        u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_1.x);
        u_xlat0.x = u_xlat16_0.x * _Intensity + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat4.xyz = u_xlat2.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat2.x = u_xlat2.x * u_xlat0.w + u_xlat16_1.x;
        u_xlat8.x = min(u_xlat4.y, u_xlat2.x);
        u_xlat8.x = (-u_xlat8.x) + u_xlat4.x;
        u_xlat2.x = (-u_xlat4.y) + u_xlat2.x;
        u_xlat14 = u_xlat8.x * 6.0 + 1.00000001e-10;
        u_xlat2.x = u_xlat2.x / u_xlat14;
        u_xlat2.x = u_xlat2.x + u_xlat4.z;
        u_xlat14 = u_xlat4.x + 1.00000001e-10;
        u_xlat8.x = u_xlat8.x / u_xlat14;
        u_xlat16_19 = abs(u_xlat2.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5 = u_xlat8.x * _Crystal_CustomColorHSV.y;
        u_xlat16_11 = u_xlat4.x * _Crystal_CustomColorHSV.z;
        u_xlat2.xyz = vec3(u_xlat16_19) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat2.xyz = fract(u_xlat2.xyz);
        u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat2.xyz = vec3(u_xlat16_5) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_11);
        SV_Target0.xyz = u_xlat2.xyz;
    } else {
        SV_Target0.xyz = u_xlat16_1.xyz;
    }
    u_xlat16_1.x = u_xlat10_2.w * vs_COLOR0.w;
    SV_Target0.w = u_xlat16_1.x * _Color.w;
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