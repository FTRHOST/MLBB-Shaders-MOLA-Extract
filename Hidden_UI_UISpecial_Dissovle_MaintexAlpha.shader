//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI/UISpecial_Dissovle_MaintexAlpha" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

_ColorTint ("ColorTint", Color) = (0,0,0,0)

_MainTex ("MainTex", 2D) = "white" { }

_SmallTexUV_Scale ("SmallTexUV_Scale", Float) = 1.0

_PrefabSize ("PrefabSize", Float) = 1024.0

_Offset_Size ("Offset_Size", Vector) = (0,0,0,0)

[Header(RongJie)] _Mask ("R:溶解走向 G:溶解纹理", 2D) = "white" { }

_Dissovle_TiOf ("溶解纹理Tiling", Vector) = (1,1,0,0)

_Dissovle_Speed ("溶解纹理UV流动", Vector) = (0,0,0,0)

_Dissovle_Rate ("溶解进度", Range(0, 1)) = 1.0

_Dissovle_Tint ("溶解硬度", Range(1, 100)) = 1.0

_Dissovle_Range ("溶解过渡范围", Range(0, 1)) = 1.0

_DissovleEdge_Color ("溶解颜色", Color) = (1,1,1,1)

_DissovleEdge ("溶解颜色范围", Range(0, 1)) = 0.5

_DissovleEdge_Intensity ("溶解颜色强度", Float) = 1.0

[Header(PanelClip)] _PanelRect ("PanelRect", Vector) = (0,0,0,0)

_PanelClipInfo ("ClipInfo", Vector) = (0,0,0,0)

[Header(Stencil)] _StencilRef ("StencilRef", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

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
  GpuProgramID 64621
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat16_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat16_9 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat16_9) + _DissovleEdge;
    u_xlat9.x = u_xlat16_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
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
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat16_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat16_9 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat16_9) + _DissovleEdge;
    u_xlat9.x = u_xlat16_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
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
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
lowp float u_xlat10_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat10_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat10_9 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat10_9) + _DissovleEdge;
    u_xlat9.x = u_xlat10_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
lowp float u_xlat10_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat10_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat10_9 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat10_9) + _DissovleEdge;
    u_xlat9.x = u_xlat10_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelRect.zw;
    u_xlat16_3.xy = u_xlat16_3.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat16_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat16_9 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat16_9) + _DissovleEdge;
    u_xlat9.x = u_xlat16_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
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
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
mediump float u_xlat16_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xy = min(max(u_xlat8.xy, 0.0), 1.0);
#else
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
#endif
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat16_0 = texture(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat16_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat16_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat16_9 = texture(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat16_9) + _DissovleEdge;
    u_xlat9.x = u_xlat16_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
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
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
lowp float u_xlat10_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat10_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat10_9 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat10_9) + _DissovleEdge;
    u_xlat9.x = u_xlat10_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	vec4 _Dissovle_TiOf;
uniform 	vec4 _Dissovle_Speed;
uniform 	float _Dissovle_Rate;
uniform 	float _Dissovle_Tint;
uniform 	float _Dissovle_Range;
uniform 	float _DissovleEdge;
uniform 	vec4 _DissovleEdge_Color;
uniform 	float _DissovleEdge_Intensity;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Mask;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
vec4 u_xlat2;
mediump vec2 u_xlat16_3;
vec3 u_xlat4;
vec3 u_xlat5;
vec2 u_xlat8;
vec2 u_xlat9;
lowp float u_xlat10_9;
float u_xlat13;
void main()
{
    u_xlat0.x = _Offset_Size.z + _Offset_Size.x;
    u_xlat0.y = (-_Offset_Size.y) + _PrefabSize;
    u_xlat1.y = u_xlat0.y + (-_Offset_Size.w);
    u_xlat1.x = _Offset_Size.x;
    u_xlat8.x = float(1.0) / _PrefabSize;
    u_xlat9.xy = u_xlat1.xy * u_xlat8.xx;
    u_xlat1.xy = (-u_xlat8.xx) * u_xlat1.xy + vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat8.xx * u_xlat0.xy + (-u_xlat9.xy);
    u_xlat8.xy = u_xlat1.xy / u_xlat0.xy;
    u_xlat8.xy = fract(u_xlat8.xy);
    u_xlat1.x = (-_SmallTexUV_Scale) + 1.0;
    u_xlat1.x = u_xlat1.x * 0.5;
    u_xlat8.xy = u_xlat8.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + u_xlat1.xx;
    u_xlat8.xy = clamp(u_xlat8.xy, 0.0, 1.0);
    u_xlat0.xy = u_xlat8.xy * u_xlat0.xy + u_xlat9.xy;
    u_xlat10_0 = texture2D(_MainTex, u_xlat0.xy);
    u_xlat0 = u_xlat10_0.wxyz * vs_COLOR0.wxyz;
    u_xlat0 = u_xlat0 * _ColorTint.wxyz;
    u_xlat1.xy = vs_TEXCOORD1.zw * _Dissovle_TiOf.xy + _Dissovle_TiOf.zw;
    u_xlat1.xy = _Dissovle_Speed.xy * _Time.yy + u_xlat1.xy;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).y;
    u_xlat1.x = u_xlat10_1 + -1.0;
    u_xlat1.y = u_xlat1.x + _DissovleEdge;
    u_xlat1.x = u_xlat1.x * _Dissovle_Range;
    u_xlat1.xy = u_xlat1.xy * vec2(_Dissovle_Tint, _Dissovle_Range);
    u_xlat5.x = u_xlat1.y * _Dissovle_Tint;
    u_xlat10_9 = texture2D(_Mask, vs_TEXCOORD1.zw).x;
    u_xlat13 = (-u_xlat10_9) + _DissovleEdge;
    u_xlat9.x = u_xlat10_9 + -1.0;
    u_xlat1.x = u_xlat9.x * _Dissovle_Tint + u_xlat1.x;
    u_xlat5.x = u_xlat13 * _Dissovle_Tint + u_xlat5.x;
    u_xlat9.x = (-_Dissovle_Rate) + 1.0;
    u_xlat9.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), u_xlat9.xx);
    u_xlat5.x = u_xlat9.x + u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _Dissovle_Rate;
    u_xlat5.x = u_xlat5.x + (-_Dissovle_Tint);
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat5.xyz = u_xlat5.xxx * _DissovleEdge_Color.xyz;
    u_xlat2.x = max(_DissovleEdge_Intensity, 0.0);
    u_xlat4.xyz = u_xlat5.xyz * u_xlat2.xxx + u_xlat0.yzw;
    u_xlat16_3.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_3.xy = u_xlat16_3.xy + u_xlat16_3.xy;
    u_xlat16_3.xy = abs(u_xlat16_3.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_3.xy = clamp(u_xlat16_3.xy, 0.0, 1.0);
    u_xlat16_3.x = max(u_xlat16_3.y, u_xlat16_3.x);
    u_xlat16_3.x = (-u_xlat16_3.x) + 1.0;
    u_xlat2.xyz = u_xlat4.xyz * u_xlat16_3.xxx;
    u_xlat4.x = dot(vec2(vec2(_Dissovle_Tint, _Dissovle_Tint)), vec2(_Dissovle_Rate));
    u_xlat4.x = u_xlat4.x + u_xlat1.x;
    u_xlat4.x = u_xlat4.x + _Dissovle_Rate;
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
    u_xlat2.w = u_xlat4.x * u_xlat0.x;
    SV_Target0 = u_xlat2;
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