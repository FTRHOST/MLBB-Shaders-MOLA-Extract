//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/<effect>_AdditiveOnce_ML" {
Properties {

_Diffuse ("Diffuse", 2D) = "white" { }

_Mask ("Mask", 2D) = "white" { }

_Color ("Color", Float) = 1.0

[MaterialToggle] _V ("V", Float) = 0.0

[MaterialToggle] _U ("U", Float) = 0.0

_node_7590 ("node_7590", Color) = (0.5,0.5,0.5,1)

[Toggle] _Crystal_UseCustomColor ("UseCustomColor", Float) = 0.0

_Crystal_CustomColorHSV ("CustomColorHsv", Vector) = (0,1,1,0)

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "FORWARD"
  Tags { "IGNOREPROJECTOR" = "true" "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 12589
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
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.x>=u_xlat3.x);
#else
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
#endif
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat1.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.x>=u_xlat3.x);
#else
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
#endif
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat1.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat1.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    u_xlat1.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat1.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.x>=u_xlat3.x);
#else
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
#endif
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat16_2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
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
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat16_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.y>=u_xlat16_2.z);
#else
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
#endif
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
#ifdef UNITY_ADRENO_ES3
        u_xlatb1 = !!(u_xlat16_2.x>=u_xlat3.x);
#else
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
#endif
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
        u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat16_2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat16_2.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _V;
uniform 	mediump float _U;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec2 u_xlat6;
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
    u_xlat16_2 = in_COLOR0.w * 2.0 + -1.0;
    u_xlat0 = vec4(u_xlat16_2) * vec4(_V, _V, _U, _U);
    u_xlat0 = u_xlat0 * vec4(0.0, 1.0, 1.0, 0.0) + in_TEXCOORD0.xyxy;
    u_xlat6.xy = (-u_xlat0.xy) + u_xlat0.zw;
    u_xlat0.xy = u_xlat6.xy * vec2(0.5, 0.5) + u_xlat0.xy;
    vs_TEXCOORD0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    vs_TEXCOORD0.zw = in_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
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
uniform 	mediump float _Color;
uniform 	mediump vec4 _node_7590;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
bool u_xlatb1;
vec3 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec2 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec2 u_xlat13;
mediump float u_xlat16_18;
mediump float u_xlat16_20;
void main()
{
    u_xlat16_0.x = _Color * _Color;
    u_xlat16_6.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat10_1.x = texture2D(_Mask, vs_TEXCOORD0.zw).x;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_2.xyz;
    u_xlat16_6.xyz = u_xlat10_1.www * u_xlat16_6.xyz;
    u_xlat16_0.xyz = u_xlat16_6.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat10_1.xxx * u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * _node_7590.xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * _node_7590.www;
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
    if(u_xlatb1){
        u_xlatb1 = u_xlat16_2.y>=u_xlat16_2.z;
        u_xlat16_18 = (u_xlatb1) ? 1.0 : 0.0;
        u_xlat1.xy = u_xlat16_0.yz * _node_7590.ww + (-u_xlat16_2.zy);
        u_xlat13.x = float(1.0);
        u_xlat13.y = float(-1.0);
        u_xlat1.xy = vec2(u_xlat16_18) * u_xlat1.xy;
        u_xlat3.xy = u_xlat16_0.zy * _node_7590.ww + u_xlat1.xy;
        u_xlat3.zw = vec2(u_xlat16_18) * u_xlat13.xy + vec2(-1.0, 0.666666687);
        u_xlatb1 = u_xlat16_2.x>=u_xlat3.x;
        u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
        u_xlat4.xyz = (-u_xlat3.xyw);
        u_xlat4.w = (-u_xlat16_2.x);
        u_xlat0.x = u_xlat16_0.x * _node_7590.w + u_xlat4.x;
        u_xlat0.yzw = u_xlat3.yzx + u_xlat4.yzw;
        u_xlat7.xyz = u_xlat1.xxx * u_xlat0.xyz + u_xlat3.xyw;
        u_xlat1.x = u_xlat1.x * u_xlat0.w + u_xlat16_2.x;
        u_xlat3.x = min(u_xlat7.y, u_xlat1.x);
        u_xlat3.x = u_xlat7.x + (-u_xlat3.x);
        u_xlat1.x = (-u_xlat7.y) + u_xlat1.x;
        u_xlat13.x = u_xlat3.x * 6.0 + 1.00000001e-10;
        u_xlat1.x = u_xlat1.x / u_xlat13.x;
        u_xlat1.x = u_xlat1.x + u_xlat7.z;
        u_xlat13.x = u_xlat7.x + 1.00000001e-10;
        u_xlat7.y = u_xlat3.x / u_xlat13.x;
        u_xlat16_20 = abs(u_xlat1.x) + _Crystal_CustomColorHSV.x;
        u_xlat16_5.xy = u_xlat7.yx * _Crystal_CustomColorHSV.yz;
        u_xlat1.xyz = vec3(u_xlat16_20) + vec3(1.0, 0.666666687, 0.333333343);
        u_xlat1.xyz = fract(u_xlat1.xyz);
        u_xlat1.xyz = u_xlat1.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
        u_xlat1.xyz = abs(u_xlat1.xyz) + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
        u_xlat1.xyz = u_xlat1.xyz + vec3(-1.0, -1.0, -1.0);
        u_xlat1.xyz = u_xlat16_5.xxx * u_xlat1.xyz + vec3(1.0, 1.0, 1.0);
        u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.yyy;
        u_xlat16_2.xyz = u_xlat2.xyz;
    }
    SV_Target0.xyz = u_xlat16_2.xyz;
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