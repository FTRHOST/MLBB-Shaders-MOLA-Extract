//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UiClipStarrySkyColor" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 1.0

[Header(public)] _Color ("Color", Color) = (1,1,1,1)

_U ("U", Float) = 8.0

_V ("V", Float) = 8.0

_Amount ("Amount", Range(0, 1)) = 1.0

_MinSize ("MinSize", Float) = 0.0

_MaxSize ("MaxSize", Float) = 1.0

_USpeed ("USpeed", Float) = 0.20000000298023224

_VSpeed ("VSpeed", Float) = 0.20000000298023224

_Noise ("Noise", 2D) = "white" { }

[Header(Stars)] [Toggle] _StarsToggle ("StarsToggle", Float) = 1.0

_StarsColor ("StarsColor", Color) = (0.985294,0.985294,0.985294,1)

_StarSize ("StarSize", Float) = 1.0

_StarsEmission ("StarsEmission", Float) = 1.0

_StarsPow ("StarsPow", Float) = 1.0

[Header(Golw)] [Toggle] _GlowToggle ("GlowToggle", Float) = 0.0

_GolwColor ("GolwColor", Color) = (1,1,1,1)

_GolwSize ("GolwSize", Float) = 1.0

_GolwEmission ("GolwEmission", Float) = 1.0

_GolwPow ("GolwPow", Float) = 1.0

[Header(Mask)] _Mask ("Mask", 2D) = "white" { }

_MaskEmission ("MaskEmission", Float) = 1.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull2 ("Cull", Float) = 0.0

[Enum(Off,0,On,1)] _ZWrite ("ZWrite", Float) = 0.0

[Enum(On,0,Off,4)] _ZTest2 ("总是在前", Float) = 4.0

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

_PanelRect ("PanelRect支持NGUI裁切", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo支持NGUI裁切", Vector) = (0,0,0,0)

}
SubShader {
 LOD 100
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "Unlit"
  LOD 100
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 13555
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Amount>=u_xlat1.x);
#else
    u_xlatb1 = _Amount>=u_xlat1.x;
#endif
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat16_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat16_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Amount>=u_xlat1.x);
#else
    u_xlatb1 = _Amount>=u_xlat1.x;
#endif
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat16_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat16_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
lowp float u_xlat10_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
float trunc(float x) { return sign(x)*floor(abs(x)); }
vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture2D(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
    u_xlatb1 = _Amount>=u_xlat1.x;
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat10_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat10_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
lowp float u_xlat10_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
float trunc(float x) { return sign(x)*floor(abs(x)); }
vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture2D(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
    u_xlatb1 = _Amount>=u_xlat1.x;
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat10_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat10_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelRect.zw;
    u_xlat16_2.xy = u_xlat16_2.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Amount>=u_xlat1.x);
#else
    u_xlatb1 = _Amount>=u_xlat1.x;
#endif
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat16_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat16_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Noise;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
mediump float u_xlat16_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(_Amount>=u_xlat1.x);
#else
    u_xlatb1 = _Amount>=u_xlat1.x;
#endif
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.x = min(max(u_xlat16_8.x, 0.0), 1.0);
#else
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_5 = texture(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat16_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat16_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat16_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.w = min(max(u_xlat16_0.w, 0.0), 1.0);
#else
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
#endif
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.xyz = min(max(u_xlat16_0.xyz, 0.0), 1.0);
#else
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
#endif
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
lowp float u_xlat10_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
float trunc(float x) { return sign(x)*floor(abs(x)); }
vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture2D(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
    u_xlatb1 = _Amount>=u_xlat1.x;
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat10_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat10_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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
uniform 	vec4 _Time;
uniform 	mediump vec4 _Color;
uniform 	mediump vec4 _GolwColor;
uniform 	mediump float _GolwEmission;
uniform 	mediump float _U;
uniform 	mediump float _V;
uniform 	mediump float _USpeed;
uniform 	mediump float _VSpeed;
uniform 	mediump float _MinSize;
uniform 	mediump float _MaxSize;
uniform 	mediump float _GolwSize;
uniform 	mediump float _Amount;
uniform 	mediump float _GolwPow;
uniform 	mediump vec4 _Mask_ST;
uniform 	mediump float _MaskEmission;
uniform 	mediump float _GlowToggle;
uniform 	mediump vec4 _StarsColor;
uniform 	mediump float _StarsEmission;
uniform 	mediump float _StarSize;
uniform 	mediump float _StarsPow;
uniform 	mediump float _StarsToggle;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Noise;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
bool u_xlatb1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_4;
vec2 u_xlat5;
lowp float u_xlat10_5;
mediump vec2 u_xlat16_8;
vec2 u_xlat9;
mediump float u_xlat16_12;
float trunc(float x) { return sign(x)*floor(abs(x)); }
vec2 trunc(vec2 x) { return sign(x)*floor(abs(x)); }
vec3 trunc(vec3 x) { return sign(x)*floor(abs(x)); }
vec4 trunc(vec4 x) { return sign(x)*floor(abs(x)); }

void main()
{
    u_xlat16_0.xy = vs_TEXCOORD1.xy * vec2(_U, _V);
    u_xlat16_8.xy = trunc(u_xlat16_0.xy);
    u_xlat16_0.xy = fract(u_xlat16_0.xy);
    u_xlat16_8.xy = u_xlat16_8.xy / vec2(_U, _V);
    u_xlat1.x = _Time.y * 0.00100000005;
    u_xlat16_2.x = u_xlat1.x * _USpeed;
    u_xlat16_2.y = u_xlat1.x * _VSpeed;
    u_xlat16_8.xy = u_xlat16_8.xy + u_xlat16_2.xy;
    u_xlat1.x = texture2D(_Noise, u_xlat16_8.xy).x;
    u_xlat16_8.x = u_xlat1.x * 1.5;
    u_xlatb1 = _Amount>=u_xlat1.x;
    u_xlat16_12 = (u_xlatb1) ? 1.0 : 0.0;
    u_xlat16_2.x = (-_MinSize) + _MaxSize;
    u_xlat16_8.x = u_xlat16_8.x * u_xlat16_2.x + _MinSize;
    u_xlat16_8.x = (-u_xlat16_8.x) + 1.0;
    u_xlat16_8.x = clamp(u_xlat16_8.x, 0.0, 1.0);
    u_xlat1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat9.xy = u_xlat16_0.xy + vec2(-0.5, -0.5);
    u_xlat9.xy = abs(u_xlat9.xy) + abs(u_xlat9.xy);
    u_xlat9.xy = sqrt(u_xlat9.xy);
    u_xlat16_0.x = u_xlat9.y + u_xlat9.x;
    u_xlat16_0.x = min(u_xlat16_0.x, 1.0);
    u_xlat16_0.x = (-u_xlat16_0.x) + 1.0;
    u_xlat16_0.x = (-u_xlat16_8.x) + u_xlat16_0.x;
    u_xlat1.x = dot(u_xlat1.xy, u_xlat1.xy);
    u_xlat1.x = sqrt(u_xlat1.x);
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat1.x = (-u_xlat16_8.x) + u_xlat1.x;
    u_xlat16_4 = (-_GolwSize) + 1.0;
    u_xlat1.x = (-u_xlat16_4) + u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat1.x * _GolwEmission;
    u_xlat1.x = u_xlat16_12 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _GolwColor.w;
    u_xlat1.x = u_xlat1.x * vs_COLOR0.w;
    u_xlat1.x = log2(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * _GolwPow;
    u_xlat1.x = exp2(u_xlat1.x);
    u_xlat16_2.xyz = u_xlat1.xxx + _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _GolwColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat5.xy = vs_TEXCOORD1.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_5 = texture2D(_Mask, u_xlat5.xy).x;
    u_xlat16_2.xyz = vec3(u_xlat10_5) * u_xlat16_2.xyz;
    u_xlat16_4 = u_xlat10_5 * u_xlat1.x;
    u_xlat16_2.w = u_xlat16_4 * _MaskEmission;
    u_xlat16_2 = u_xlat16_2 * vec4(vec4(_GlowToggle, _GlowToggle, _GlowToggle, _GlowToggle));
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_4 = (-_StarSize) + 1.0;
    u_xlat16_0.x = (-u_xlat16_4) + u_xlat16_0.x;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat16_0.x = u_xlat16_0.x * _StarsEmission;
    u_xlat16_0.x = log2(u_xlat16_0.x);
    u_xlat16_0.x = u_xlat16_0.x * _StarsPow;
    u_xlat16_0.x = exp2(u_xlat16_0.x);
    u_xlat16_3.xyz = u_xlat16_0.xxx * _StarsColor.xyz;
    u_xlat16_0.x = u_xlat16_12 * u_xlat16_0.x;
    u_xlat16_0.x = u_xlat16_0.x * _StarsColor.w;
    u_xlat1.x = u_xlat16_0.x * vs_COLOR0.w;
    u_xlat1.x = u_xlat10_5 * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * _MaskEmission;
    u_xlat16_0.w = u_xlat1.x * _StarsToggle;
    u_xlat16_0.w = clamp(u_xlat16_0.w, 0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_3.xyz * vs_COLOR0.xyz;
    u_xlat16_0.xyz = u_xlat16_3.xyz * vec3(vec3(_StarsToggle, _StarsToggle, _StarsToggle));
    u_xlat16_0.xyz = clamp(u_xlat16_0.xyz, 0.0, 1.0);
    u_xlat16_0 = u_xlat16_0 + u_xlat16_2;
    u_xlat16_0 = u_xlat16_0 * _Color;
    u_xlat16_2.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_2.xy = u_xlat16_2.xy + u_xlat16_2.xy;
    u_xlat16_2.xy = abs(u_xlat16_2.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
    u_xlat16_2.x = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_2.x = (-u_xlat16_2.x) + 1.0;
    SV_Target0 = u_xlat16_0 * u_xlat16_2.xxxx;
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