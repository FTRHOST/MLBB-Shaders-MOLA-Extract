//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_BlendedUV_ZTestAlways_ML" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_Intensity ("Intensity", Float) = 1.0

_Mask ("Mask", 2D) = "white" { }

_Vspeed ("Vspeed", Float) = 1.0

_Uspeed ("Uspeed", Float) = 1.0

_Color ("Color", Color) = (0.5,0.5,0.5,1)

_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZTest Always
 ZWrite Off
 Cull Off
  GpuProgramID 50169
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).x;
    u_xlat9 = u_xlat16_0.w * u_xlat16_1;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.x = u_xlat9 * vs_COLOR0.w;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_2;
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
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec2 u_xlat1;
mediump float u_xlat16_1;
mediump float u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_1 = texture(_Mask, u_xlat1.xy).x;
    u_xlat9 = u_xlat16_0.w * u_xlat16_1;
    u_xlat0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.x = u_xlat9 * vs_COLOR0.w;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_2;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
mediump float u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat9 = u_xlat10_0.w * u_xlat10_1;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.x = u_xlat9 * vs_COLOR0.w;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_2;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec2 u_xlat1;
lowp float u_xlat10_1;
mediump float u_xlat16_2;
float u_xlat6;
float u_xlat9;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_1 = texture2D(_Mask, u_xlat1.xy).x;
    u_xlat9 = u_xlat10_0.w * u_xlat10_1;
    u_xlat0.xyz = u_xlat10_0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    SV_Target0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat0.x = u_xlat9 * vs_COLOR0.w;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_2;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat3 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat3 = u_xlat16_0.x * u_xlat3 + 0.0125228781;
    u_xlat0.x = u_xlat3 * u_xlat16_0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_0.w;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
UNITY_LOCATION(1) uniform mediump sampler2D _Mask;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_0 = texture(_Diffuse, u_xlat0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat16_0.x = texture(_Mask, u_xlat0.xy).x;
    u_xlat3 = u_xlat16_0.x * 0.305306017 + 0.682171106;
    u_xlat3 = u_xlat16_0.x * u_xlat3 + 0.0125228781;
    u_xlat0.x = u_xlat3 * u_xlat16_0.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_0.w;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat3 = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat3 = u_xlat10_0.x * u_xlat3 + 0.0125228781;
    u_xlat0.x = u_xlat3 * u_xlat10_0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10_0.w;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.x = _Color.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
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
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	vec4 _TimeEditor;
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Mask_ST;
uniform 	float _Vspeed;
uniform 	float _Uspeed;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
uniform lowp sampler2D _Mask;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec3 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat3;
float u_xlat6;
void main()
{
    u_xlat0.xy = vec2(_Uspeed, _Vspeed) * vec2(0.5, 0.5);
    u_xlat6 = _Time.y + _TimeEditor.y;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat6) + vs_TEXCOORD0.xy;
    u_xlat0.xy = u_xlat0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat10_0 = texture2D(_Diffuse, u_xlat0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat16_2.xyz = vs_COLOR0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    SV_Target0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xy = vs_TEXCOORD0.xy * _Mask_ST.xy + _Mask_ST.zw;
    u_xlat10_0.x = texture2D(_Mask, u_xlat0.xy).x;
    u_xlat3 = u_xlat10_0.x * 0.305306017 + 0.682171106;
    u_xlat3 = u_xlat10_0.x * u_xlat3 + 0.0125228781;
    u_xlat0.x = u_xlat3 * u_xlat10_0.x;
    u_xlat0.x = u_xlat0.x * u_xlat10_0.w;
    u_xlat0.x = u_xlat0.x * vs_COLOR0.w;
    u_xlat16_2.x = _Color.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    SV_Target0.w = u_xlat0.x * u_xlat16_2.x;
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
CustomEditor "HeroShowRenderingGUI.VFX.ASEffectShaderGUI"
}