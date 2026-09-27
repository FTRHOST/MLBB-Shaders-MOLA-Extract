//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/UI/UISpecial_Mask_S_MaintexAlpha" {
Properties {

[Enum(UnityEngine.Rendering.BlendMode)] _Src ("Src", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _Dst ("Dst", Float) = 10.0

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 0.0

_ColorTint ("ColorTint", Color) = (0,0,0,0)

_MainTex ("MainTex", 2D) = "white" { }

[Header(saoguang)] [Header( )] _Saoguang_Color ("Saoguang_Color", Color) = (1,1,1,1)

_Saoguang_Intensity ("Saoguang_Intensity", Float) = 1.0

_Saoguang ("Saoguang", 2D) = "black" { }

_Saoguang_RatatorCenter ("Saoguang_RatatorCenter", Vector) = (0.5,0.5,0,0)

_Saoguang_RatatorIntensity ("Saoguang_RatatorIntensity", Float) = 0.0

_RotSpeed ("RotSpeed", Float) = 0.0

_Saoguang_Jiange ("Saoguang_Jiange", Float) = 1.0

_SmallTexUV_Scale ("SmallTexUV_Scale", Float) = 1.0

_MainTexSpeedx ("MainTexSpeedx", Float) = 0.0

_MainTexSpeedy ("MainTexSpeedy", Float) = 0.0

[Toggle] _MainTexTil ("MainTexTil", Float) = 0.0

_Mask_Tetxure ("Mask_Tetxure", 2D) = "white" { }

[Toggle] _MaskInMain ("MaskInMain", Float) = 0.0

_Mask_UVSpeed_Powe ("Mask_UVSpeed_Powe", Vector) = (0,0,1,0)

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
  GpuProgramID 10363
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask_Tetxure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat16_0 = texture(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat16_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat1.xy);
    u_xlati1.xy = ivec2(uvec2((uint(u_xlatb14.x) * 0xffffffffu) & (uint(u_xlatb15.x) * 0xffffffffu), (uint(u_xlatb14.y) * 0xffffffffu) & (uint(u_xlatb15.y) * 0xffffffffu)));
    u_xlat1.xy = uintBitsToFloat(uvec2(uint(u_xlati1.x) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat16_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask_Tetxure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat16_0 = texture(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat16_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat1.xy);
    u_xlati1.xy = ivec2(uvec2((uint(u_xlatb14.x) * 0xffffffffu) & (uint(u_xlatb15.x) * 0xffffffffu), (uint(u_xlatb14.y) * 0xffffffffu) & (uint(u_xlatb15.y) * 0xffffffffu)));
    u_xlat1.xy = uintBitsToFloat(uvec2(uint(u_xlati1.x) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat16_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask_Tetxure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
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
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat10_0 = texture2D(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat10_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat1.xy);
    u_xlati1.xy = op_and((ivec2(u_xlatb14.xy) * -1), (ivec2(u_xlatb15.xy) * -1));
    u_xlat1.xy = vec2(op_and(u_xlati1.xy, ivec2(1065353216, 1065353216)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat10_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat10_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat10_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelRect;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask_Tetxure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
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
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat10_0 = texture2D(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat10_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat1.xy);
    u_xlati1.xy = op_and((ivec2(u_xlatb14.xy) * -1), (ivec2(u_xlatb15.xy) * -1));
    u_xlat1.xy = vec2(op_and(u_xlati1.xy, ivec2(1065353216, 1065353216)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat10_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat10_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat10_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelRect.zw;
    u_xlat16_5.xy = u_xlat16_5.xy * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask_Tetxure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat16_0 = texture(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat16_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat1.xy);
    u_xlati1.xy = ivec2(uvec2((uint(u_xlatb14.x) * 0xffffffffu) & (uint(u_xlatb15.x) * 0xffffffffu), (uint(u_xlatb14.y) * 0xffffffffu) & (uint(u_xlatb15.y) * 0xffffffffu)));
    u_xlat1.xy = uintBitsToFloat(uvec2(uint(u_xlati1.x) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat16_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
UNITY_LOCATION(0) uniform mediump sampler2D _Mask_Tetxure;
UNITY_LOCATION(1) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(2) uniform mediump sampler2D _Saoguang;
in highp vec4 vs_TEXCOORD1;
in highp vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
mediump vec4 u_xlat16_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
mediump float u_xlat16_18;
void main()
{
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat16_0 = texture(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat16_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xy = min(max(u_xlat2.xy, 0.0), 1.0);
#else
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
#endif
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat16_4 = texture(_MainTex, u_xlat1.xy);
    u_xlati1.xy = ivec2(uvec2((uint(u_xlatb14.x) * 0xffffffffu) & (uint(u_xlatb15.x) * 0xffffffffu), (uint(u_xlatb14.y) * 0xffffffffu) & (uint(u_xlatb15.y) * 0xffffffffu)));
    u_xlat1.xy = uintBitsToFloat(uvec2(uint(u_xlati1.x) & uint(1065353216u), uint(u_xlati1.y) & uint(1065353216u)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat16_18 = texture(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat16_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat16_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xy = min(max(u_xlat16_5.xy, 0.0), 1.0);
#else
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
#endif
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask_Tetxure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
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
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat10_0 = texture2D(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat10_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat1.xy);
    u_xlati1.xy = op_and((ivec2(u_xlatb14.xy) * -1), (ivec2(u_xlatb15.xy) * -1));
    u_xlat1.xy = vec2(op_and(u_xlati1.xy, ivec2(1065353216, 1065353216)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat10_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat10_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat10_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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
uniform 	float _MainTexSpeedx;
uniform 	float _MainTexSpeedy;
uniform 	vec4 _Offset_Size;
uniform 	float _PrefabSize;
uniform 	float _SmallTexUV_Scale;
uniform 	float _MainTexTil;
uniform 	float _MaskInMain;
uniform 	vec4 _Saoguang_RatatorCenter;
uniform 	vec4 _Saoguang_ST;
uniform 	float _Saoguang_RatatorIntensity;
uniform 	float _RotSpeed;
uniform 	float _Saoguang_Jiange;
uniform 	vec4 _Saoguang_Color;
uniform 	float _Saoguang_Intensity;
uniform 	vec4 _Mask_UVSpeed_Powe;
uniform 	vec4 _Mask_Tetxure_ST;
uniform 	vec4 _ColorTint;
uniform 	mediump vec4 _PanelClipInfo;
uniform lowp sampler2D _Mask_Tetxure;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _Saoguang;
varying highp vec4 vs_TEXCOORD1;
varying highp vec4 vs_COLOR0;
varying mediump vec2 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
ivec2 u_xlati1;
vec2 u_xlat2;
vec3 u_xlat3;
lowp vec4 u_xlat10_4;
mediump vec2 u_xlat16_5;
vec2 u_xlat12;
vec2 u_xlat13;
bvec2 u_xlatb14;
bvec2 u_xlatb15;
float u_xlat18;
lowp float u_xlat10_18;
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
    u_xlat0.xy = vs_TEXCOORD1.zw * _Saoguang_ST.xy + _Saoguang_ST.zw;
    u_xlat0.xy = u_xlat0.xy + (-_Saoguang_RatatorCenter.xy);
    u_xlat12.x = _Time.y * _RotSpeed + _Saoguang_RatatorIntensity;
    u_xlat1.x = sin(u_xlat12.x);
    u_xlat2.x = cos(u_xlat12.x);
    u_xlat3.z = u_xlat1.x;
    u_xlat3.y = u_xlat2.x;
    u_xlat3.x = (-u_xlat1.x);
    u_xlat1.y = dot(u_xlat0.xy, u_xlat3.xy);
    u_xlat1.x = dot(u_xlat0.xy, u_xlat3.yz);
    u_xlat0.xy = u_xlat1.xy + _Saoguang_RatatorCenter.xy;
    u_xlat12.x = _Time.y * 0.300000012;
    u_xlat1.xy = _Saoguang_RatatorCenter.zw * _Saoguang_ST.xy;
    u_xlat0.xy = u_xlat12.xx * u_xlat1.xy + u_xlat0.xy;
    u_xlat12.xy = _Saoguang_ST.xy * vec2(vec2(_Saoguang_Jiange, _Saoguang_Jiange));
    u_xlat0.xy = u_xlat0.xy / u_xlat12.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat12.xy * u_xlat0.xy;
    u_xlat10_0 = texture2D(_Saoguang, u_xlat0.xy).x;
    u_xlat0.xyz = vec3(u_xlat10_0) * _Saoguang_Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * _Saoguang_Color.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Saoguang_Intensity);
    u_xlat1.xy = vs_TEXCOORD1.zw * _Mask_Tetxure_ST.xy + _Mask_Tetxure_ST.zw;
    u_xlat1.xy = _Time.yy * _Mask_UVSpeed_Powe.xy + u_xlat1.xy;
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat1.xy).x;
    u_xlat18 = u_xlat10_18 * _Mask_UVSpeed_Powe.z;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    u_xlat18 = _Offset_Size.z + _Offset_Size.x;
    u_xlat1.x = float(1.0) / _PrefabSize;
    u_xlat2.x = u_xlat18 * u_xlat1.x;
    u_xlat18 = (-_Offset_Size.y) + _PrefabSize;
    u_xlat2.y = u_xlat18 * u_xlat1.x;
    u_xlat18 = u_xlat18 + (-_Offset_Size.w);
    u_xlat3.y = u_xlat1.x * u_xlat18;
    u_xlat3.x = u_xlat1.x * _Offset_Size.x;
    u_xlat1.xy = u_xlat2.xy + (-u_xlat3.xy);
    u_xlat13.xy = _Time.yy * vec2(_MainTexSpeedx, _MainTexSpeedy) + vs_TEXCOORD1.xy;
    u_xlat13.xy = (-u_xlat3.xy) + u_xlat13.xy;
    u_xlat13.xy = u_xlat13.xy / u_xlat1.xy;
    u_xlat2.xy = fract(u_xlat13.xy);
    u_xlat18 = (-_SmallTexUV_Scale) + 1.0;
    u_xlat18 = u_xlat18 * 0.5;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlatb14.xy = greaterThanEqual(u_xlat2.xyxy, vec4(0.0, 0.0, 0.0, 0.0)).xy;
    u_xlatb15.xy = greaterThanEqual(vec4(1.0, 1.0, 1.0, 1.0), u_xlat2.xyxy).xy;
    u_xlat2.xy = u_xlat2.xy;
    u_xlat2.xy = clamp(u_xlat2.xy, 0.0, 1.0);
    u_xlat1.xy = u_xlat2.xy * u_xlat1.xy + u_xlat3.xy;
    u_xlat10_4 = texture2D(_MainTex, u_xlat1.xy);
    u_xlati1.xy = op_and((ivec2(u_xlatb14.xy) * -1), (ivec2(u_xlatb15.xy) * -1));
    u_xlat1.xy = vec2(op_and(u_xlati1.xy, ivec2(1065353216, 1065353216)));
    u_xlat13.xy = u_xlat13.xy * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat2.xy = vs_TEXCOORD1.zw * vec2(vec2(_SmallTexUV_Scale, _SmallTexUV_Scale)) + vec2(u_xlat18);
    u_xlat10_18 = texture2D(_Mask_Tetxure, u_xlat2.xy).y;
    u_xlat18 = u_xlat10_18 + -1.0;
    u_xlat18 = _MaskInMain * u_xlat18 + 1.0;
    u_xlat13.xy = floor(u_xlat13.xy);
    u_xlat13.xy = min(abs(u_xlat13.xy), vec2(1.0, 1.0));
    u_xlat13.xy = (-u_xlat13.xy) + vec2(1.0, 1.0);
    u_xlat13.x = u_xlat13.y * u_xlat13.x;
    u_xlat1.x = u_xlat1.x * u_xlat1.y + (-u_xlat13.x);
    u_xlat1.x = _MainTexTil * u_xlat1.x + u_xlat13.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat1.x = u_xlat10_4.w * u_xlat1.x;
    u_xlat18 = u_xlat18 * u_xlat1.x;
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz + u_xlat10_4.xyz;
    u_xlat0.w = u_xlat18 * vs_COLOR0.w;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat1 = u_xlat0 * _ColorTint;
    u_xlat16_5.xy = vs_TEXCOORD2.xy + vec2(-0.5, -0.5);
    u_xlat16_5.xy = u_xlat16_5.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = abs(u_xlat16_5.xy) * _PanelClipInfo.xy + (-_PanelClipInfo.zw);
    u_xlat16_5.xy = clamp(u_xlat16_5.xy, 0.0, 1.0);
    u_xlat16_5.x = max(u_xlat16_5.y, u_xlat16_5.x);
    u_xlat16_5.x = (-u_xlat16_5.x) + 1.0;
    SV_Target0 = u_xlat1 * u_xlat16_5.xxxx;
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