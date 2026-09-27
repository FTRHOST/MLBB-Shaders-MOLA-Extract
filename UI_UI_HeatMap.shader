//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "UI/UI_HeatMap" {
Properties {

[Enum(Add,1,Blend,10)] _Dst ("混合模式", Float) = 10.0

_HeatMap ("HeatMap", 2D) = "white" { }

_DataIndex ("DataIndex", Float) = 0.0

_Ramp ("Ramp", 2D) = "white" { }

_RampIntensity ("Ramp强度", Float) = 1.0

_Mask ("Mask", 2D) = "white" { }

_Alpha ("不透明度", Range(0, 1)) = 1.0

_Scale ("透视缩放XY", Vector) = (0.7,1,0,0)

}
SubShader {
 LOD 100
 Tags { "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "RenderType" = "Transparent" }
 ZWrite Off
  GpuProgramID 13540
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
uniform 	vec4 _HeatMap_ST;
uniform 	mediump vec2 _Scale;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _HeatMap_ST.xy + _HeatMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<in_POSITION0.y);
#else
    u_xlatb0 = 0.0<in_POSITION0.y;
#endif
    u_xlat2.xy = in_POSITION0.xy * _Scale.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat2.xy : in_POSITION0.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _RampIntensity;
uniform 	float _Alpha;
uniform 	int _DataIndex;
UNITY_LOCATION(0) uniform mediump sampler2D _HeatMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump float u_xlat16_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0 = texture(_HeatMap, vs_TEXCOORD0.xy);
    u_xlatb1.xyz = equal(ivec4(_DataIndex), ivec4(1, 2, 3, 0)).xyz;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat0.w : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat16_0 = texture(_Ramp, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * vec4(_RampIntensity);
    u_xlat16_1 = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat1 = u_xlat16_1 * _Alpha;
    u_xlat0.w = u_xlat0.w * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _HeatMap_ST;
uniform 	mediump vec2 _Scale;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in highp vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _HeatMap_ST.xy + _HeatMap_ST.zw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<in_POSITION0.y);
#else
    u_xlatb0 = 0.0<in_POSITION0.y;
#endif
    u_xlat2.xy = in_POSITION0.xy * _Scale.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat2.xy : in_POSITION0.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _RampIntensity;
uniform 	float _Alpha;
uniform 	int _DataIndex;
UNITY_LOCATION(0) uniform mediump sampler2D _HeatMap;
UNITY_LOCATION(1) uniform mediump sampler2D _Ramp;
UNITY_LOCATION(2) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in highp vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
float u_xlat1;
mediump float u_xlat16_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0 = texture(_HeatMap, vs_TEXCOORD0.xy);
    u_xlatb1.xyz = equal(ivec4(_DataIndex), ivec4(1, 2, 3, 0)).xyz;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat0.w : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat16_0 = texture(_Ramp, u_xlat0.xy);
    u_xlat0 = u_xlat16_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * vec4(_RampIntensity);
    u_xlat16_1 = texture(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat1 = u_xlat16_1 * _Alpha;
    u_xlat0.w = u_xlat0.w * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _HeatMap_ST;
uniform 	mediump vec2 _Scale;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _HeatMap_ST.xy + _HeatMap_ST.zw;
    u_xlatb0 = 0.0<in_POSITION0.y;
    u_xlat2.xy = in_POSITION0.xy * _Scale.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat2.xy : in_POSITION0.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _RampIntensity;
uniform 	float _Alpha;
uniform 	int _DataIndex;
uniform lowp sampler2D _HeatMap;
uniform lowp sampler2D _Ramp;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0 = texture2D(_HeatMap, vs_TEXCOORD0.xy);
    u_xlatb1.xyz = equal(ivec4(_DataIndex), ivec4(1, 2, 3, 0)).xyz;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat0.w : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat10_0 = texture2D(_Ramp, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * vec4(_RampIntensity);
    u_xlat10_1 = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat1 = u_xlat10_1 * _Alpha;
    u_xlat0.w = u_xlat0.w * u_xlat1;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _HeatMap_ST;
uniform 	mediump vec2 _Scale;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute highp vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
vec4 u_xlat0;
bool u_xlatb0;
vec4 u_xlat1;
vec2 u_xlat2;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _HeatMap_ST.xy + _HeatMap_ST.zw;
    u_xlatb0 = 0.0<in_POSITION0.y;
    u_xlat2.xy = in_POSITION0.xy * _Scale.xy;
    u_xlat0.xy = (bool(u_xlatb0)) ? u_xlat2.xy : in_POSITION0.xy;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	float _RampIntensity;
uniform 	float _Alpha;
uniform 	int _DataIndex;
uniform lowp sampler2D _HeatMap;
uniform lowp sampler2D _Ramp;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying highp vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec4 u_xlat10_0;
float u_xlat1;
lowp float u_xlat10_1;
bvec3 u_xlatb1;
void main()
{
    u_xlat0 = texture2D(_HeatMap, vs_TEXCOORD0.xy);
    u_xlatb1.xyz = equal(ivec4(_DataIndex), ivec4(1, 2, 3, 0)).xyz;
    u_xlat0.x = (u_xlatb1.z) ? u_xlat0.w : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.y) ? u_xlat0.z : u_xlat0.x;
    u_xlat0.x = (u_xlatb1.x) ? u_xlat0.y : u_xlat0.x;
    u_xlat0.y = 0.5;
    u_xlat10_0 = texture2D(_Ramp, u_xlat0.xy);
    u_xlat0 = u_xlat10_0 * vs_COLOR0;
    u_xlat0 = u_xlat0 * vec4(_RampIntensity);
    u_xlat10_1 = texture2D(_Mask, vs_TEXCOORD0.xy).x;
    u_xlat1 = u_xlat10_1 * _Alpha;
    u_xlat0.w = u_xlat0.w * u_xlat1;
    SV_Target0 = u_xlat0;
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