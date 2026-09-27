//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI/UISpecial_JB_MaintexAlpha" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull1 ("Cull", Float) = 3.0

_MainTex ("MainTex", 2D) = "white" { }

_ColorTint ("ColorTint", Color) = (1,1,1,1)

[Header(jianbian)] _A_Color ("A_Color", Color) = (1,1,1,1)

_B_Color ("B_Color", Color) = (1,1,1,1)

_pianyi ("pianyi", Float) = 0.0

_suofang ("suofang", Float) = 1.0

_CenterPoint_Rote_RoteSpeed ("CenterPoint_Rote_RoteSpeed", Vector) = (0.5,0.5,0,0)

[Toggle] _jingxiang ("jingxiang", Float) = 0.0

[Toggle] _togger ("toggershadow", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

_StencilRef ("StencilRef", Float) = 0.0

_PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

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
  GpuProgramID 17622
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat16_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat1.x = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat16_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat1.x = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat10_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.x = u_xlat10_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat10_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.x = u_xlat10_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat16_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat1.x = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat16_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xyz;
    u_xlat1.x = u_xlat16_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xy = min(max(u_xlat16_3.xy, 0.0), 1.0);
#else
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
#endif
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat10_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.x = u_xlat10_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD1;
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
    vs_TEXCOORD1.zw = in_TEXCOORD1.xy;
    vs_COLOR0 = _ColorTint;
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
uniform 	vec4 _A_Color;
uniform 	vec4 _B_Color;
uniform 	vec4 _CenterPoint_Rote_RoteSpeed;
uniform 	float _suofang;
uniform 	float _pianyi;
uniform 	float _jingxiang;
uniform 	float _togger;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_1;
vec3 u_xlat2;
mediump vec2 u_xlat16_3;
float u_xlat4;
float u_xlat8;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw + (-_CenterPoint_Rote_RoteSpeed.xy);
    u_xlat8 = _CenterPoint_Rote_RoteSpeed.w * _Time.y + _CenterPoint_Rote_RoteSpeed.z;
    u_xlat1.x = sin(u_xlat8);
    u_xlat2.x = cos(u_xlat8);
    u_xlat2.y = u_xlat1.x;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat2.xy);
    u_xlat0.x = u_xlat0.x + _CenterPoint_Rote_RoteSpeed.x;
    u_xlat4 = (-_suofang) + 1.0;
    u_xlat8 = (-u_xlat4) + _suofang;
    u_xlat0.x = u_xlat0.x * u_xlat8 + u_xlat4;
    u_xlat0.x = u_xlat0.x + _pianyi;
    u_xlat4 = u_xlat0.x + u_xlat0.x;
    u_xlat0.x = u_xlat0.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat4 = fract(u_xlat4);
    u_xlat4 = (-u_xlat4) * 0.5 + 0.25;
    u_xlat4 = abs(u_xlat4) * 4.0 + (-u_xlat0.x);
    u_xlat0.x = _jingxiang * u_xlat4 + u_xlat0.x;
    u_xlat1 = (-_A_Color) + _B_Color;
    u_xlat0 = u_xlat0.xxxx * u_xlat1 + _A_Color;
    u_xlat10_1 = texture2D(_MainTex, vs_TEXCOORD1.xy);
    u_xlat2.xyz = u_xlat0.xyz * u_xlat10_1.www;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat10_1.xyz;
    u_xlat1.x = u_xlat10_1.w * vs_COLOR0.w;
    u_xlat1.w = u_xlat0.w * u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat2.xyz * vs_COLOR0.xyz + (-u_xlat1.xyz);
    u_xlat0.w = 0.0;
    u_xlat0 = vec4(vec4(_togger, _togger, _togger, _togger)) * u_xlat0 + u_xlat1;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    SV_Target0 = u_xlat0 * u_xlat16_3.xxxx;
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