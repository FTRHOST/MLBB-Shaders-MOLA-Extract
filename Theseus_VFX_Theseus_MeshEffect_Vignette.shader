//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/VFX/Theseus_MeshEffect_Vignette" {
Properties {

_VignetteColor ("Vignette Color", Color) = (0,0,0,1)

_VignetteCenter ("Vignette Center", Vector) = (0.5,0.5,0,0)

_VignetteIntensity ("Vignette Intensity", Range(0, 15)) = 0.5

_VignetteSmoothness ("Vignette Smoothness", Range(0.01, 4)) = 0.5

_VignetteRoundness ("Vignette Roundness", Range(0, 1)) = 1.0

}
SubShader {
 LOD 100
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  LOD 100
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Off
  GpuProgramID 47447
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = _ScreenParams.x / _ScreenParams.y;
    u_xlat0 = u_xlat0 + -1.0;
    u_xlat0 = _VignetteRoundness * u_xlat0 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0 * u_xlat1.y;
    u_xlat0 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _VignetteSmoothness;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = _VignetteColor.xyz;
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = _ScreenParams.x / _ScreenParams.y;
    u_xlat0 = u_xlat0 + -1.0;
    u_xlat0 = _VignetteRoundness * u_xlat0 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0 * u_xlat1.y;
    u_xlat0 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _VignetteSmoothness;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = _VignetteColor.xyz;
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
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = _ScreenParams.x / _ScreenParams.y;
    u_xlat0 = u_xlat0 + -1.0;
    u_xlat0 = _VignetteRoundness * u_xlat0 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0 * u_xlat1.y;
    u_xlat0 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _VignetteSmoothness;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = _VignetteColor.xyz;
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
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0 = _ScreenParams.x / _ScreenParams.y;
    u_xlat0 = u_xlat0 + -1.0;
    u_xlat0 = _VignetteRoundness * u_xlat0 + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0 * u_xlat1.y;
    u_xlat0 = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0 = (-u_xlat0) + 1.0;
    u_xlat0 = max(u_xlat0, 0.0);
    u_xlat0 = log2(u_xlat0);
    u_xlat0 = u_xlat0 * _VignetteSmoothness;
    u_xlat0 = exp2(u_xlat0);
    u_xlat0 = (-u_xlat0) + 1.0;
    SV_Target0.w = u_xlat0;
    SV_Target0.xyz = _VignetteColor.xyz;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = _VignetteRoundness * u_xlat0.x + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteSmoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.w = u_xlat0.x * u_xlat0.x;
    u_xlat0.xyz = _VignetteColor.xyz * _VignetteColor.xyz;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = _VignetteRoundness * u_xlat0.x + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteSmoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.w = u_xlat0.x * u_xlat0.x;
    u_xlat0.xyz = _VignetteColor.xyz * _VignetteColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = _VignetteRoundness * u_xlat0.x + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteSmoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.w = u_xlat0.x * u_xlat0.x;
    u_xlat0.xyz = _VignetteColor.xyz * _VignetteColor.xyz;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
"#ifdef VERTEX
#version 100

uniform 	vec4 _ProjectionParams;
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
varying highp vec4 vs_TEXCOORD0;
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
    u_xlat1.x = u_xlat0.y * _ProjectionParams.x;
    u_xlat1.w = u_xlat1.x * 0.5;
    u_xlat1.xz = u_xlat0.xw * vec2(0.5, 0.5);
    vs_TEXCOORD0.xy = u_xlat1.zz + u_xlat1.xw;
    vs_TEXCOORD0.zw = u_xlat0.zw;
    gl_Position = u_xlat0;
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
uniform 	vec4 _ScreenParams;
uniform 	vec4 _VignetteCenter;
uniform 	mediump vec4 _VignetteColor;
uniform 	float _VignetteIntensity;
uniform 	float _VignetteSmoothness;
uniform 	float _VignetteRoundness;
varying highp vec4 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec3 u_xlat1;
vec2 u_xlat2;
void main()
{
    u_xlat0.x = _ScreenParams.x / _ScreenParams.y;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.x = _VignetteRoundness * u_xlat0.x + 1.0;
    u_xlat2.xy = vs_TEXCOORD0.xy / vs_TEXCOORD0.ww;
    u_xlat2.xy = u_xlat2.xy + (-_VignetteCenter.xy);
    u_xlat1.yz = abs(u_xlat2.xy) * vec2(_VignetteIntensity);
    u_xlat1.x = u_xlat0.x * u_xlat1.y;
    u_xlat0.x = dot(u_xlat1.xz, u_xlat1.xz);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _VignetteSmoothness;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.w = u_xlat0.x * u_xlat0.x;
    u_xlat0.xyz = _VignetteColor.xyz * _VignetteColor.xyz;
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