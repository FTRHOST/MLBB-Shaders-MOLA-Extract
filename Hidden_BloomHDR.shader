//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/BloomHDR" {
Properties {

}
SubShader {
 Pass {
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 59772
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
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec3 _limitColor;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump float u_xlat16_11;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_3.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_2.xyz = u_xlat16_6.xyz / u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, _limitColor.xyz);
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_14 = max(u_xlat16_2.z, u_xlat16_14);
    u_xlat16_3.x = u_xlat16_14 + (-_threshold);
    u_xlat16_14 = max(u_xlat16_14, 9.99999975e-05);
    u_xlat16_7 = u_xlat16_3.x + _thresholdKnee;
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_11 = _thresholdKnee + _thresholdKnee;
    u_xlat16_7 = min(u_xlat16_11, u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_11 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_7 = u_xlat16_7 / u_xlat16_11;
    u_xlat16_3.x = max(u_xlat16_7, u_xlat16_3.x);
    u_xlat16_14 = u_xlat16_3.x / u_xlat16_14;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14);
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec3 _limitColor;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump float u_xlat16_11;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_2.xxx;
    u_xlat16_3.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat16_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_2.xyz = u_xlat16_6.xyz / u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, _limitColor.xyz);
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_14 = max(u_xlat16_2.z, u_xlat16_14);
    u_xlat16_3.x = u_xlat16_14 + (-_threshold);
    u_xlat16_14 = max(u_xlat16_14, 9.99999975e-05);
    u_xlat16_7 = u_xlat16_3.x + _thresholdKnee;
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_11 = _thresholdKnee + _thresholdKnee;
    u_xlat16_7 = min(u_xlat16_11, u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_11 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_7 = u_xlat16_7 / u_xlat16_11;
    u_xlat16_3.x = max(u_xlat16_7, u_xlat16_3.x);
    u_xlat16_14 = u_xlat16_3.x / u_xlat16_14;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14);
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec3 _limitColor;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump float u_xlat16_11;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_2.xxx;
    u_xlat16_3.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_2.xyz = u_xlat16_6.xyz / u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, _limitColor.xyz);
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_14 = max(u_xlat16_2.z, u_xlat16_14);
    u_xlat16_3.x = u_xlat16_14 + (-_threshold);
    u_xlat16_14 = max(u_xlat16_14, 9.99999975e-05);
    u_xlat16_7 = u_xlat16_3.x + _thresholdKnee;
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_11 = _thresholdKnee + _thresholdKnee;
    u_xlat16_7 = min(u_xlat16_11, u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_11 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_7 = u_xlat16_7 / u_xlat16_11;
    u_xlat16_3.x = max(u_xlat16_7, u_xlat16_3.x);
    u_xlat16_14 = u_xlat16_3.x / u_xlat16_14;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14);
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump vec3 _limitColor;
uniform 	mediump float _threshold;
uniform 	mediump float _thresholdKnee;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump float u_xlat16_7;
mediump float u_xlat16_11;
mediump float u_xlat16_14;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-1.0, -0.5, 0.0, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = float(1.0) / u_xlat16_2.x;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_2.xxx;
    u_xlat16_3.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(1.0, -0.5, -1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(0.0, 0.5, 1.0, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_3.x = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_1.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_3.x = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3.x = u_xlat16_3.x + 1.0;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_6.xyz = u_xlat10_0.xyz * u_xlat16_3.xxx + u_xlat16_6.xyz;
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_3.x;
    u_xlat16_2.xyz = u_xlat16_6.xyz / u_xlat16_2.xxx;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_2.xyz = min(u_xlat16_2.xyz, _limitColor.xyz);
    u_xlat16_14 = max(u_xlat16_2.y, u_xlat16_2.x);
    u_xlat16_14 = max(u_xlat16_2.z, u_xlat16_14);
    u_xlat16_3.x = u_xlat16_14 + (-_threshold);
    u_xlat16_14 = max(u_xlat16_14, 9.99999975e-05);
    u_xlat16_7 = u_xlat16_3.x + _thresholdKnee;
    u_xlat16_7 = max(u_xlat16_7, 0.0);
    u_xlat16_11 = _thresholdKnee + _thresholdKnee;
    u_xlat16_7 = min(u_xlat16_11, u_xlat16_7);
    u_xlat16_7 = u_xlat16_7 * u_xlat16_7;
    u_xlat16_11 = _thresholdKnee * 4.0 + 9.99999975e-05;
    u_xlat16_7 = u_xlat16_7 / u_xlat16_11;
    u_xlat16_3.x = max(u_xlat16_7, u_xlat16_3.x);
    u_xlat16_14 = u_xlat16_3.x / u_xlat16_14;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_14);
    SV_Target0.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
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
}
}
 Pass {
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 96227
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
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_0.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_7.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3);
    u_xlat16_2 = u_xlat16_3 * 4.0 + u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _MainTex_TexelSize;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2 = dot(u_xlat16_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_0.xyz = textureLod(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat16_0.xyz = textureLod(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat16_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_7.xyz = u_xlat16_0.xyz * vec3(u_xlat16_3);
    u_xlat16_2 = u_xlat16_3 * 4.0 + u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_7.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3);
    u_xlat16_2 = u_xlat16_3 * 4.0 + u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform lowp sampler2D _MainTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp vec3 u_xlat10_0;
lowp vec3 u_xlat10_1;
mediump float u_xlat16_2;
mediump float u_xlat16_3;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
void main()
{
    u_xlat0 = _MainTex_TexelSize.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat0.zw, 0.0).xyz;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_2 = dot(u_xlat10_1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_2 = u_xlat16_2 + 1.0;
    u_xlat16_2 = float(1.0) / u_xlat16_2;
    u_xlat16_6.xyz = u_xlat10_1.xyz * vec3(u_xlat16_2);
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(-0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat0.xy = _MainTex_TexelSize.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, u_xlat0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_6.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3) + u_xlat16_6.xyz;
    u_xlat16_2 = u_xlat16_2 + u_xlat16_3;
    u_xlat10_0.xyz = texture2DLodEXT(_MainTex, vs_TEXCOORD0.xy, 0.0).xyz;
    u_xlat16_3 = dot(u_xlat10_0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlat16_3 = u_xlat16_3 + 1.0;
    u_xlat16_3 = float(1.0) / u_xlat16_3;
    u_xlat16_7.xyz = u_xlat10_0.xyz * vec3(u_xlat16_3);
    u_xlat16_2 = u_xlat16_3 * 4.0 + u_xlat16_2;
    u_xlat16_6.xyz = u_xlat16_7.xyz * vec3(4.0, 4.0, 4.0) + u_xlat16_6.xyz;
    SV_Target0.xyz = u_xlat16_6.xyz / vec3(u_xlat16_2);
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
}
}
 Pass {
 ZTest Off
 ZWrite Off
 Cull Off
  GpuProgramID 164190
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
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
uniform 	mediump float _sampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomRrcTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(vec2(_sampleScale, _sampleScale));
    u_xlat1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat1.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat2.xy = u_xlat16_0.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat16_1.xyz = textureLod(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif

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
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
uniform 	mediump float _sampleScale;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _bloomRrcTex;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec2 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(vec2(_sampleScale, _sampleScale));
    u_xlat1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_2.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz + u_xlat16_3.xyz;
    u_xlat1.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat2.xy = u_xlat16_0.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat16_2.xyz = textureLod(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat16_4.xyz = textureLod(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_1.xyz = textureLod(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_0.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat16_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat16_1.xyz = textureLod(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_0.xyz + u_xlat16_1.xyz;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
uniform 	mediump float _sampleScale;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomRrcTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(vec2(_sampleScale, _sampleScale));
    u_xlat1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_2.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
    u_xlat1.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat2.xy = u_xlat16_0.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat10_1.xyz = texture2DLodEXT(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_0.xyz + u_xlat10_1.xyz;
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
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD0;
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
    return;
}

#endif
#ifdef FRAGMENT
#version 100
#ifdef GL_EXT_shader_texture_lod
#extension GL_EXT_shader_texture_lod : enable
#endif
#if !defined(GL_EXT_shader_texture_lod)
#define texture1DLodEXT texture1D
#define texture2DLodEXT texture2D
#define texture2DProjLodEXT texture2DProj
#define texture3DLodEXT texture3D
#define textureCubeLodEXT textureCube
#endif

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	mediump vec4 _MainTex_TexelSize;
uniform 	mediump float _scatter;
uniform 	mediump float _sampleScale;
uniform lowp sampler2D _MainTex;
uniform lowp sampler2D _bloomRrcTex;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
mediump vec3 u_xlat16_0;
vec4 u_xlat1;
lowp vec3 u_xlat10_1;
vec2 u_xlat2;
lowp vec3 u_xlat10_2;
mediump vec3 u_xlat16_3;
lowp vec3 u_xlat10_4;
void main()
{
    u_xlat16_0.xy = _MainTex_TexelSize.xy * vec2(vec2(_sampleScale, _sampleScale));
    u_xlat1 = u_xlat16_0.xyxy * vec4(-1.0, 0.0, -0.5, 0.5) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat10_2.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(0.0, 1.0, 1.0, 0.0) + vs_TEXCOORD0.xyxy;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat10_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz + u_xlat16_3.xyz;
    u_xlat1.xy = u_xlat16_0.xy * vec2(0.5, 0.5) + vs_TEXCOORD0.xy;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_3.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat1 = u_xlat16_0.xyxy * vec4(-0.5, -0.5, 0.5, -0.5) + vs_TEXCOORD0.xyxy;
    u_xlat2.xy = u_xlat16_0.xy * vec2(0.0, -1.0) + vs_TEXCOORD0.xy;
    u_xlat10_2.xyz = texture2DLodEXT(_MainTex, u_xlat2.xy, 0.0).xyz;
    u_xlat10_4.xyz = texture2DLodEXT(_MainTex, u_xlat1.zw, 0.0).xyz;
    u_xlat10_1.xyz = texture2DLodEXT(_MainTex, u_xlat1.xy, 0.0).xyz;
    u_xlat16_0.xyz = u_xlat10_4.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_3.xyz;
    u_xlat16_0.xyz = u_xlat10_2.xyz + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat10_1.xyz * vec3(2.0, 2.0, 2.0) + u_xlat16_0.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(0.0833333358, 0.0833333358, 0.0833333358);
    u_xlat10_1.xyz = texture2DLodEXT(_bloomRrcTex, vs_TEXCOORD0.xy, 0.0).xyz;
    SV_Target0.xyz = vec3(vec3(_scatter, _scatter, _scatter)) * u_xlat16_0.xyz + u_xlat10_1.xyz;
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
}
}
}
}