//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/ScreenSample_Radar" {
Properties {

_MainTex ("Sprite Texture", 2D) = "white" { }

_ScreenCap ("背景截图", 2D) = "white" { }

_Color ("Tint", Color) = (1,1,1,1)

_AlphaTex ("External Alpha", 2D) = "white" { }

[Enum(UnityEngine.Rendering.CullMode)] _Cull ("Cull", Float) = 2.0

[Enum(Off,0,On,1)] _ZWriteMode ("ZWrite", Float) = 0.0

_MainColor ("MainColor", Color) = (1,1,1,1)

[Enum(UnityEngine.Rendering.BlendMode)] _BlendSrc ("BlendSrc", Float) = 5.0

[Enum(UnityEngine.Rendering.BlendMode)] _BlendDst ("BlendDst", Float) = 10.0

_FindEdge_RampRangeSoft ("FindEdge_RampRangeSoft", Vector) = (0.54,0.63,0,0)

_AnnularMask_ArcXYRdsRdn ("AnnularMask_ArcXYRdsRdn", Vector) = (0.5,0.5,0.2,0)

_Color0 ("Color 0", Color) = (1,0,0,1)

_Color1 ("Color 1", Color) = (0,0.140436,1,1)

_AnnularMask_RoaHdwOsfIsf ("AnnularMask_RoaHdwOsfIsf", Vector) = (0,0,0.2,0.2)

_Int ("Int", Float) = 1.0

_Tiling ("Tiling", Vector) = (1,1,0,0)

_RatarPower ("RatarPower", Float) = 10.0

}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 18026
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _FindEdge_RampRangeSoft;
uniform 	vec2 _Tiling;
uniform 	vec4 _AnnularMask_ArcXYRdsRdn;
uniform 	vec4 _AnnularMask_RoaHdwOsfIsf;
uniform 	float _Int;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _RatarPower;
uniform 	vec4 _MainColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ScreenCap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = _Tiling.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat10.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.xy = u_xlat10.xy * _Tiling.xy + (-u_xlat0.xy);
    u_xlat16_0.xyz = texture(_ScreenCap, u_xlat0.xy).xyz;
    u_xlat16_1 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.x = (-_FindEdge_RampRangeSoft.y) * 0.5 + u_xlat16_1;
    u_xlat0.y = _FindEdge_RampRangeSoft.y * 0.5 + u_xlat16_1;
    u_xlat0.xy = u_xlat0.xy + (-_FindEdge_RampRangeSoft.xx);
    u_xlat0.z = _FindEdge_RampRangeSoft.z + 0.5;
    u_xlat15 = (-u_xlat0.z) + 1.0;
    u_xlat0.xyz = (-vec3(u_xlat15)) + u_xlat0.xyz;
    u_xlat10.x = float(1.0) / u_xlat0.z;
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat5.x = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat10.x * u_xlat5.x + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = _AnnularMask_RoaHdwOsfIsf.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat5.x);
    u_xlat3 = cos(u_xlat5.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat5.xy = vs_TEXCOORD0.xy + (-_AnnularMask_ArcXYRdsRdn.xy);
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat5.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat4.yz);
    u_xlat5.x = abs(u_xlat2.y) + abs(u_xlat2.x);
    u_xlat10.x = dot(abs(u_xlat2.xy), abs(u_xlat2.xy));
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat5.x = _AnnularMask_ArcXYRdsRdn.w * u_xlat5.x + u_xlat10.x;
    u_xlat10.x = _AnnularMask_ArcXYRdsRdn.z + -1.0;
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat10.x = (-u_xlat5.x) + _AnnularMask_RoaHdwOsfIsf.z;
    u_xlat5.y = u_xlat10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(1.0>=u_xlat5.x);
#else
    u_xlatb15 = 1.0>=u_xlat5.x;
#endif
    u_xlat5.x = u_xlat5.x + _AnnularMask_RoaHdwOsfIsf.w;
    u_xlat5.x = u_xlat5.x + -1.0;
    u_xlat5.xy = u_xlat5.xy / _AnnularMask_RoaHdwOsfIsf.wz;
    u_xlat2.x = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat10.x = u_xlat5.y * u_xlat2.x;
    u_xlat5.x = u_xlat5.x * u_xlat15 + u_xlat10.x;
    u_xlat10.x = (-_AnnularMask_RoaHdwOsfIsf.y) + 1.0;
    u_xlat5.x = u_xlat5.x / u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _RatarPower;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * _Int;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat5.xxxx * u_xlat1 + _Color0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _FindEdge_RampRangeSoft;
uniform 	vec2 _Tiling;
uniform 	vec4 _AnnularMask_ArcXYRdsRdn;
uniform 	vec4 _AnnularMask_RoaHdwOsfIsf;
uniform 	float _Int;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _RatarPower;
uniform 	vec4 _MainColor;
UNITY_LOCATION(0) uniform mediump sampler2D _ScreenCap;
in mediump vec4 vs_COLOR0;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD2;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = _Tiling.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat10.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.xy = u_xlat10.xy * _Tiling.xy + (-u_xlat0.xy);
    u_xlat16_0.xyz = texture(_ScreenCap, u_xlat0.xy).xyz;
    u_xlat16_1 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.x = (-_FindEdge_RampRangeSoft.y) * 0.5 + u_xlat16_1;
    u_xlat0.y = _FindEdge_RampRangeSoft.y * 0.5 + u_xlat16_1;
    u_xlat0.xy = u_xlat0.xy + (-_FindEdge_RampRangeSoft.xx);
    u_xlat0.z = _FindEdge_RampRangeSoft.z + 0.5;
    u_xlat15 = (-u_xlat0.z) + 1.0;
    u_xlat0.xyz = (-vec3(u_xlat15)) + u_xlat0.xyz;
    u_xlat10.x = float(1.0) / u_xlat0.z;
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat5.x = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat10.x * u_xlat5.x + (-u_xlat0.x);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.x = _AnnularMask_RoaHdwOsfIsf.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat5.x);
    u_xlat3 = cos(u_xlat5.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat5.xy = vs_TEXCOORD0.xy + (-_AnnularMask_ArcXYRdsRdn.xy);
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat5.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat4.yz);
    u_xlat5.x = abs(u_xlat2.y) + abs(u_xlat2.x);
    u_xlat10.x = dot(abs(u_xlat2.xy), abs(u_xlat2.xy));
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat5.x = _AnnularMask_ArcXYRdsRdn.w * u_xlat5.x + u_xlat10.x;
    u_xlat10.x = _AnnularMask_ArcXYRdsRdn.z + -1.0;
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat10.x = (-u_xlat5.x) + _AnnularMask_RoaHdwOsfIsf.z;
    u_xlat5.y = u_xlat10.x + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb15 = !!(1.0>=u_xlat5.x);
#else
    u_xlatb15 = 1.0>=u_xlat5.x;
#endif
    u_xlat5.x = u_xlat5.x + _AnnularMask_RoaHdwOsfIsf.w;
    u_xlat5.x = u_xlat5.x + -1.0;
    u_xlat5.xy = u_xlat5.xy / _AnnularMask_RoaHdwOsfIsf.wz;
    u_xlat2.x = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat10.x = u_xlat5.y * u_xlat2.x;
    u_xlat5.x = u_xlat5.x * u_xlat15 + u_xlat10.x;
    u_xlat10.x = (-_AnnularMask_RoaHdwOsfIsf.y) + 1.0;
    u_xlat5.x = u_xlat5.x / u_xlat10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _RatarPower;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * _Int;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat5.xxxx * u_xlat1 + _Color0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _FindEdge_RampRangeSoft;
uniform 	vec2 _Tiling;
uniform 	vec4 _AnnularMask_ArcXYRdsRdn;
uniform 	vec4 _AnnularMask_RoaHdwOsfIsf;
uniform 	float _Int;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _RatarPower;
uniform 	vec4 _MainColor;
uniform lowp sampler2D _ScreenCap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = _Tiling.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat10.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.xy = u_xlat10.xy * _Tiling.xy + (-u_xlat0.xy);
    u_xlat10_0.xyz = texture2D(_ScreenCap, u_xlat0.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.x = (-_FindEdge_RampRangeSoft.y) * 0.5 + u_xlat16_1;
    u_xlat0.y = _FindEdge_RampRangeSoft.y * 0.5 + u_xlat16_1;
    u_xlat0.xy = u_xlat0.xy + (-_FindEdge_RampRangeSoft.xx);
    u_xlat0.z = _FindEdge_RampRangeSoft.z + 0.5;
    u_xlat15 = (-u_xlat0.z) + 1.0;
    u_xlat0.xyz = (-vec3(u_xlat15)) + u_xlat0.xyz;
    u_xlat10.x = float(1.0) / u_xlat0.z;
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat5.x = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat10.x * u_xlat5.x + (-u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = _AnnularMask_RoaHdwOsfIsf.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat5.x);
    u_xlat3 = cos(u_xlat5.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat5.xy = vs_TEXCOORD0.xy + (-_AnnularMask_ArcXYRdsRdn.xy);
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat5.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat4.yz);
    u_xlat5.x = abs(u_xlat2.y) + abs(u_xlat2.x);
    u_xlat10.x = dot(abs(u_xlat2.xy), abs(u_xlat2.xy));
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat5.x = _AnnularMask_ArcXYRdsRdn.w * u_xlat5.x + u_xlat10.x;
    u_xlat10.x = _AnnularMask_ArcXYRdsRdn.z + -1.0;
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat10.x = (-u_xlat5.x) + _AnnularMask_RoaHdwOsfIsf.z;
    u_xlat5.y = u_xlat10.x + 1.0;
    u_xlatb15 = 1.0>=u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _AnnularMask_RoaHdwOsfIsf.w;
    u_xlat5.x = u_xlat5.x + -1.0;
    u_xlat5.xy = u_xlat5.xy / _AnnularMask_RoaHdwOsfIsf.wz;
    u_xlat2.x = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat10.x = u_xlat5.y * u_xlat2.x;
    u_xlat5.x = u_xlat5.x * u_xlat15 + u_xlat10.x;
    u_xlat10.x = (-_AnnularMask_RoaHdwOsfIsf.y) + 1.0;
    u_xlat5.x = u_xlat5.x / u_xlat10.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _RatarPower;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * _Int;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat5.xxxx * u_xlat1 + _Color0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
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
    u_xlat1 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat1;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    u_xlat0.y = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * vec3(0.5, 0.5, 0.5);
    vs_TEXCOORD2.zw = u_xlat0.zw;
    vs_TEXCOORD2.xy = u_xlat1.zz + u_xlat1.xw;
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
uniform 	vec3 _FindEdge_RampRangeSoft;
uniform 	vec2 _Tiling;
uniform 	vec4 _AnnularMask_ArcXYRdsRdn;
uniform 	vec4 _AnnularMask_RoaHdwOsfIsf;
uniform 	float _Int;
uniform 	vec4 _Color0;
uniform 	vec4 _Color1;
uniform 	float _RatarPower;
uniform 	vec4 _MainColor;
uniform lowp sampler2D _ScreenCap;
varying mediump vec4 vs_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_TEXCOORD2;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec2 u_xlat2;
float u_xlat3;
vec3 u_xlat4;
vec2 u_xlat5;
vec2 u_xlat10;
float u_xlat15;
bool u_xlatb15;
void main()
{
    u_xlat0.xy = _Tiling.xy + vec2(-1.0, -1.0);
    u_xlat0.xy = u_xlat0.xy * vec2(0.5, 0.5);
    u_xlat10.xy = vs_TEXCOORD2.xy / vs_TEXCOORD2.ww;
    u_xlat0.xy = u_xlat10.xy * _Tiling.xy + (-u_xlat0.xy);
    u_xlat10_0.xyz = texture2D(_ScreenCap, u_xlat0.xy).xyz;
    u_xlat16_1 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat0.x = (-_FindEdge_RampRangeSoft.y) * 0.5 + u_xlat16_1;
    u_xlat0.y = _FindEdge_RampRangeSoft.y * 0.5 + u_xlat16_1;
    u_xlat0.xy = u_xlat0.xy + (-_FindEdge_RampRangeSoft.xx);
    u_xlat0.z = _FindEdge_RampRangeSoft.z + 0.5;
    u_xlat15 = (-u_xlat0.z) + 1.0;
    u_xlat0.xyz = (-vec3(u_xlat15)) + u_xlat0.xyz;
    u_xlat10.x = float(1.0) / u_xlat0.z;
    u_xlat0.xy = u_xlat10.xx * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat10.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10.x;
    u_xlat10.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat5.x = u_xlat0.y * u_xlat0.y;
    u_xlat0.x = u_xlat10.x * u_xlat5.x + (-u_xlat0.x);
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat5.x = _AnnularMask_RoaHdwOsfIsf.x * 0.0174532942;
    u_xlat2.x = sin(u_xlat5.x);
    u_xlat3 = cos(u_xlat5.x);
    u_xlat4.z = u_xlat2.x;
    u_xlat5.xy = vs_TEXCOORD0.xy + (-_AnnularMask_ArcXYRdsRdn.xy);
    u_xlat4.y = u_xlat3;
    u_xlat4.x = (-u_xlat2.x);
    u_xlat2.y = dot(u_xlat5.xy, u_xlat4.xy);
    u_xlat2.x = dot(u_xlat5.xy, u_xlat4.yz);
    u_xlat5.x = abs(u_xlat2.y) + abs(u_xlat2.x);
    u_xlat10.x = dot(abs(u_xlat2.xy), abs(u_xlat2.xy));
    u_xlat10.x = sqrt(u_xlat10.x);
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat5.x = _AnnularMask_ArcXYRdsRdn.w * u_xlat5.x + u_xlat10.x;
    u_xlat10.x = _AnnularMask_ArcXYRdsRdn.z + -1.0;
    u_xlat5.x = (-u_xlat10.x) + u_xlat5.x;
    u_xlat10.x = (-u_xlat5.x) + _AnnularMask_RoaHdwOsfIsf.z;
    u_xlat5.y = u_xlat10.x + 1.0;
    u_xlatb15 = 1.0>=u_xlat5.x;
    u_xlat5.x = u_xlat5.x + _AnnularMask_RoaHdwOsfIsf.w;
    u_xlat5.x = u_xlat5.x + -1.0;
    u_xlat5.xy = u_xlat5.xy / _AnnularMask_RoaHdwOsfIsf.wz;
    u_xlat2.x = (u_xlatb15) ? 0.0 : 1.0;
    u_xlat15 = u_xlatb15 ? 1.0 : float(0.0);
    u_xlat10.x = u_xlat5.y * u_xlat2.x;
    u_xlat5.x = u_xlat5.x * u_xlat15 + u_xlat10.x;
    u_xlat10.x = (-_AnnularMask_RoaHdwOsfIsf.y) + 1.0;
    u_xlat5.x = u_xlat5.x / u_xlat10.x;
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
    u_xlat0.x = u_xlat5.x * u_xlat0.x;
    u_xlat5.x = log2(u_xlat5.x);
    u_xlat5.x = u_xlat5.x * _RatarPower;
    u_xlat5.x = exp2(u_xlat5.x);
    u_xlat0.x = u_xlat0.x * _Int;
    u_xlat1 = (-_Color0) + _Color1;
    u_xlat1 = u_xlat5.xxxx * u_xlat1 + _Color0;
    u_xlat0 = u_xlat0.xxxx * u_xlat1;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * _MainColor;
    SV_Target0.xyz = u_xlat0.www * u_xlat0.xyz;
    SV_Target0.w = u_xlat0.w;
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
}
}
}
}