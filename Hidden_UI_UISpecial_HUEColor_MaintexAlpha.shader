//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI/UISpecial_HUEColor_MaintexAlpha" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

_ColorTint ("ColorTint", Color) = (1,1,1,1)

_MainTex ("MainTex", 2D) = "white" { }

_PrefabSize ("PrefabSize", Float) = 1024.0

_Offset_Size ("Offset_Size", Vector) = (0,0,0,0)

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

_StencilRef ("StencilRef", Float) = 0.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_ColorScal ("明度", Float) = 1.0

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 Pass {
 Name "Unlit"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Off
  GpuProgramID 17056
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
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
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
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
    u_xlat0.xy = u_xlat0.xy / u_xlat0.ww;
    u_xlat0.xy = u_xlat0.xy + vec2(1.0, 1.0);
    vs_TEXCOORD2.xy = u_xlat0.xy * vec2(0.5, 0.5) + (-_PanelRect.xy);
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelRect.zw;
    u_xlat16_4.xy = u_xlat16_4.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
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
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
out highp vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat1.y>=u_xlat1.z);
#else
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
#endif
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat1.x>=u_xlat0.x);
#else
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
#endif
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xy = min(max(u_xlat16_4.xy, 0.0), 1.0);
#else
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
#endif
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD0;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat0.xy = hlslcc_mtx4x4unity_ObjectToWorld[3].xy * in_POSITION0.ww + u_xlat0.xy;
    vs_TEXCOORD2.xy = u_xlat0.xy * _PanelRect.zw + (-_PanelRect.xy);
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD1.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1.zw = vec2(0.0, 0.0);
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	vec4 _ColorTint;
uniform 	float _Hue;
uniform 	float _Saturation;
uniform 	float _Contrast;
uniform 	float _ColorScal;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
bool u_xlatb0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec2 u_xlat16_4;
vec3 u_xlat5;
float u_xlat7;
float u_xlat10;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat5.x = float(1.0) / _PrefabSize;
    u_xlat1.x = u_xlat5.x * u_xlat0.x;
    u_xlat0.x = (-_Offset_Size.y) + _PrefabSize;
    u_xlat10 = u_xlat0.x + (-_Offset_Size.w);
    u_xlat1.y = u_xlat0.x * u_xlat5.x;
    u_xlat2.y = u_xlat5.x * u_xlat10;
    u_xlat2.x = u_xlat5.x * _Offset_Size.x;
    u_xlat0.xy = u_xlat1.xy + (-u_xlat2.xy);
    u_xlat0.xy = vs_TEXCOORD1.xy * u_xlat0.xy + u_xlat2.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlatb0 = u_xlat1.y>=u_xlat1.z;
    u_xlat0.x = u_xlatb0 ? 1.0 : float(0.0);
    u_xlat2.xy = u_xlat1.zy;
    u_xlat3.xy = u_xlat0.yz * _ColorTint.yz + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat0 = u_xlat0.xxxx * u_xlat3.xywz + u_xlat2.xywz;
    u_xlatb2 = u_xlat1.x>=u_xlat0.x;
    u_xlat2.x = u_xlatb2 ? 1.0 : float(0.0);
    u_xlat3.z = u_xlat0.w;
    u_xlat0.w = u_xlat1.x;
    u_xlat3.xyw = u_xlat0.wyx;
    u_xlat3 = (-u_xlat0) + u_xlat3;
    u_xlat0 = u_xlat2.xxxx * u_xlat3 + u_xlat0;
    u_xlat2.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat2.x = u_xlat0.x + (-u_xlat2.x);
    u_xlat7 = u_xlat2.x * 6.0 + 1.00000001e-10;
    u_xlat5.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat5.x = u_xlat5.x / u_xlat7;
    u_xlat5.x = u_xlat5.x + u_xlat0.z;
    u_xlat5.x = abs(u_xlat5.x) + _Hue;
    u_xlat5.xyz = u_xlat5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat5.xyz = fract(u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat5.xyz = abs(u_xlat5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat7 = u_xlat0.x + 1.00000001e-10;
    u_xlat2.x = u_xlat2.x / u_xlat7;
    u_xlat2.x = u_xlat2.x * _Saturation;
    u_xlat5.xyz = u_xlat2.xxx * u_xlat5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat0.xyz = vec3(vec3(_Contrast, _Contrast, _Contrast)) * u_xlat0.xyz + vec3(0.5, 0.5, 0.5);
    u_xlat1.xyz = u_xlat0.xyz * vec3(vec3(_ColorScal, _ColorScal, _ColorScal));
    u_xlat16_4.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_4.xy = u_xlat16_4.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = abs(u_xlat16_4.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_4.xy = clamp(u_xlat16_4.xy, 0.0, 1.0);
    u_xlat16_4.x = max(u_xlat16_4.y, u_xlat16_4.x);
    u_xlat16_4.x = (-u_xlat16_4.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_4.xxxx;
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
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_PANEL_CLIP_NEW" }
""
}
}
}
}
}