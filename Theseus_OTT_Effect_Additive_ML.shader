//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/OTT_Effect/Additive_ML" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_Intensity ("Intensity", Float) = 1.0

_Color ("Color", Color) = (0.5,0.5,0.5,1)

[Toggle(_COLOUR_ON)] _COLOUR_ON ("色彩开关(禁动画中K开关)", Float) = 0.0

_Hue ("色相", Range(-0.5, 0.5)) = 0.0

_Saturation ("饱和度", Range(0, 2)) = 1.0

_Contrast ("对比度", Range(0, 2)) = 1.0

_SaturRightColor ("灰度渐变亮色", Color) = (1,1,1,1)

_SaturLeftColor ("灰度渐变暗色", Color) = (1,1,1,1)

_SaturRightColorWeights ("灰度渐变亮色权重", Range(0.5, 1)) = 1.0

_SaturLeftColorWeights ("灰度渐变暗色权重", Range(0, 0.5)) = 0.0

[Toggle(_HEIGHTGRADIENT_ON)] _HEIGHTGRADIENT_ON ("高度渐变开关(禁动画中K开关)", Float) = 0.0

_Height ("平面高度", Float) = 0.0

_HeightGradient ("高度渐变值", Float) = 0.5

_StencilRef ("StencilRef", Float) = 0.0

[Enum(UnityEngine.Rendering.CompareFunction)] _StencilComp ("StencilComp", Float) = 8.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilPass ("StencilPass", Float) = 0.0

_StencilReadMask ("StencilReadMask", Float) = 255.0

_StencilWriteMask ("StencilWriteMask", Float) = 255.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilFail ("StencilFail", Float) = 0.0

[Enum(UnityEngine.Rendering.StencilOp)] _StencilZFail ("StencilZFail", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 5643
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat16_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat16_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_0.y>=u_xlat16_4.y);
#else
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
#endif
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4.w>=u_xlat16_4.x);
#else
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
#endif
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat16_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat16_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_0.y>=u_xlat16_4.y);
#else
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
#endif
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4.w>=u_xlat16_4.x);
#else
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
#endif
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat10_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat10_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat10_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat10_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    u_xlat2.xyz = log2(abs(u_xlat16_0.xyz));
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_1.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb5) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * u_xlat0.xx + (-u_xlat5.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat5.y>=u_xlat5.z);
#else
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
#endif
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * u_xlat0.xx + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat5.x>=u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_17>=(-u_xlat16_17));
#else
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb5) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * u_xlat0.xx + (-u_xlat5.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat5.y>=u_xlat5.z);
#else
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
#endif
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * u_xlat0.xx + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat5.x>=u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_17>=(-u_xlat16_17));
#else
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb5) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * u_xlat0.xx + (-u_xlat5.zy);
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * u_xlat0.xx + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb5) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * u_xlat0.xx + (-u_xlat5.zy);
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * u_xlat0.xx + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0.x + u_xlat16_3.x;
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = log2(abs(u_xlat16_2.xyz));
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat16_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat16_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_0.y>=u_xlat16_4.y);
#else
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
#endif
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4.w>=u_xlat16_4.x);
#else
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
#endif
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat16_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat16_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_0.y>=u_xlat16_4.y);
#else
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
#endif
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_4.w>=u_xlat16_4.x);
#else
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
#endif
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat16_10.x>=(-u_xlat16_10.x));
#else
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_15 = min(max(u_xlat16_15, 0.0), 1.0);
#else
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat10_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat10_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
mediump vec4 u_xlat16_0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_8;
mediump vec2 u_xlat16_10;
mediump float u_xlat16_15;
void main()
{
    u_xlat16_0.z = float(-1.0);
    u_xlat16_0.w = float(0.666666687);
    u_xlat16_1.z = float(1.0);
    u_xlat16_1.w = float(-1.0);
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_3.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat10_2.xyz * u_xlat16_3.xyz;
    u_xlat16_4.xyw = u_xlat10_2.www * u_xlat16_3.yzx;
    u_xlat16_0.xy = u_xlat16_4.yx;
    u_xlat16_1.xy = u_xlat16_3.yz * u_xlat10_2.ww + (-u_xlat16_0.xy);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlatb2 = u_xlat16_0.y>=u_xlat16_4.y;
    u_xlat16_8 = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0 = vec4(u_xlat16_8) * u_xlat16_1 + u_xlat16_0;
    u_xlat16_4.xyz = u_xlat16_0.xyw;
    u_xlatb2 = u_xlat16_4.w>=u_xlat16_4.x;
    u_xlat16_1.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat16_0.xyw = u_xlat16_4.wyx;
    u_xlat16_0 = u_xlat16_0 + (-u_xlat16_4);
    u_xlat16_0 = u_xlat16_1.xxxx * u_xlat16_0 + u_xlat16_4;
    u_xlat16_1.x = min(u_xlat16_0.y, u_xlat16_0.w);
    u_xlat16_1.x = u_xlat16_0.x + (-u_xlat16_1.x);
    u_xlat16_6 = u_xlat16_1.x * 6.0 + 9.99999975e-05;
    u_xlat16_5.x = (-u_xlat16_0.y) + u_xlat16_0.w;
    u_xlat16_5.x = u_xlat16_5.x / u_xlat16_6;
    u_xlat16_5.x = u_xlat16_5.x + u_xlat16_0.z;
    u_xlat16_5.x = abs(u_xlat16_5.x) + _Hue;
    u_xlat16_10.x = u_xlat16_5.x * 360.0;
    u_xlatb2 = u_xlat16_10.x>=(-u_xlat16_10.x);
    u_xlat16_10.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_5.x = u_xlat16_10.y * u_xlat16_5.x;
    u_xlat16_5.x = fract(u_xlat16_5.x);
    u_xlat16_5.xyz = u_xlat16_10.xxx * u_xlat16_5.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_5.xyz = fract(u_xlat16_5.xyz);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_5.xyz = abs(u_xlat16_5.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_5.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_6 = u_xlat16_0.x + 9.99999975e-05;
    u_xlat16_1.x = u_xlat16_1.x / u_xlat16_6;
    u_xlat16_1.x = u_xlat16_1.x * _Saturation;
    u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.xyz = u_xlat16_5.xyz * u_xlat16_0.xxx;
    u_xlat16_0.xyz = u_xlat16_0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_15 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_15 = float(1.0) / u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_3.x;
    u_xlat16_15 = clamp(u_xlat16_15, 0.0, 1.0);
    u_xlat16_1.x = u_xlat16_15 * -2.0 + 3.0;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_15;
    u_xlat16_15 = u_xlat16_15 * u_xlat16_1.x;
    u_xlat16_1.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_3.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_1.xyz);
    u_xlat16_1.xyz = vec3(u_xlat16_15) * u_xlat16_3.xyz + u_xlat16_1.xyz;
    u_xlat16_0.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat16_0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
bool u_xlatb2;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat10_0.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat10_0.www * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vs_COLOR0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb2 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb2) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    SV_Target0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0 = (u_xlatb5) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * vec2(u_xlat0) + (-u_xlat5.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat5.y>=u_xlat5.z);
#else
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
#endif
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * vec2(u_xlat0) + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat5.x>=u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_17>=(-u_xlat16_17));
#else
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out mediump vec3 vs_COLOR0;
out highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in mediump vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
in highp vec3 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb5 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0 = (u_xlatb5) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat16_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * vec2(u_xlat0) + (-u_xlat5.zy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb10 = !!(u_xlat5.y>=u_xlat5.z);
#else
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
#endif
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * vec2(u_xlat0) + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat5.x>=u_xlat16_1.x);
#else
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
#endif
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_17>=(-u_xlat16_17));
#else
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
#endif
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_8.xyz = min(max(u_xlat16_8.xyz, 0.0), 1.0);
#else
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
    u_xlat0 = (u_xlatb5) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * vec2(u_xlat0) + (-u_xlat5.zy);
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * vec2(u_xlat0) + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0 + u_xlat16_3.x;
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Diffuse_ST;
uniform 	mediump vec4 _Color;
uniform 	mediump float _Intensity;
attribute highp vec4 in_POSITION0;
attribute mediump vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_6;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat16_2 = u_xlat16_2 * in_COLOR0.w;
    u_xlat16_6.x = max(_Intensity, 0.0);
    u_xlat16_2 = u_xlat16_6.x * u_xlat16_2;
    u_xlat16_6.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_3.xyz = in_COLOR0.xyz * in_COLOR0.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_3.xyz;
    vs_COLOR0.xyz = vec3(u_xlat16_2) * u_xlat16_6.xyz;
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
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump float _SaturRightColorWeights;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying mediump vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
varying highp vec3 vs_TEXCOORD1;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
bool u_xlatb5;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
bool u_xlatb10;
mediump vec2 u_xlat16_12;
mediump float u_xlat16_13;
mediump float u_xlat16_17;
void main()
{
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb5 = _Height>=vs_TEXCOORD1.y;
    u_xlat0 = (u_xlatb5) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat16_2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat10_1.xyz * u_xlat16_2.xyz;
    u_xlat16_7.xyz = u_xlat10_1.www * u_xlat16_2.xyz;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat16_7.xyz = u_xlat16_7.xyz * vs_COLOR0.xyz;
    u_xlat5.xyz = vec3(u_xlat0) * u_xlat16_7.xyz;
    u_xlat16_3.xy = u_xlat16_7.yz * vec2(u_xlat0) + (-u_xlat5.zy);
    u_xlatb10 = u_xlat5.y>=u_xlat5.z;
    u_xlat16_13 = (u_xlatb10) ? 1.0 : 0.0;
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(u_xlat16_13);
    u_xlat16_1.xy = u_xlat16_7.zy * vec2(u_xlat0) + u_xlat16_3.xy;
    u_xlat16_12.x = float(1.0);
    u_xlat16_12.y = float(-1.0);
    u_xlat16_1.zw = vec2(u_xlat16_13) * u_xlat16_12.xy + vec2(-1.0, 0.666666687);
    u_xlat16_3.xyz = (-u_xlat16_1.xyw);
    u_xlat16_3.w = (-u_xlat5.x);
    u_xlat16_4.yzw = u_xlat16_1.yzx + u_xlat16_3.yzw;
    u_xlat16_4.x = u_xlat16_7.x * u_xlat0 + u_xlat16_3.x;
    u_xlatb0 = u_xlat5.x>=u_xlat16_1.x;
    u_xlat16_7.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_3.xyz = u_xlat16_7.xxx * u_xlat16_4.xyz + u_xlat16_1.xyw;
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_4.w + u_xlat5.x;
    u_xlat16_12.x = min(u_xlat16_3.y, u_xlat16_7.x);
    u_xlat16_7.x = (-u_xlat16_3.y) + u_xlat16_7.x;
    u_xlat16_12.x = (-u_xlat16_12.x) + u_xlat16_3.x;
    u_xlat16_17 = u_xlat16_12.x * 6.0 + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_7.x / u_xlat16_17;
    u_xlat16_7.x = u_xlat16_7.x + u_xlat16_3.z;
    u_xlat16_7.x = abs(u_xlat16_7.x) + _Hue;
    u_xlat16_17 = u_xlat16_7.x * 360.0;
    u_xlatb0 = u_xlat16_17>=(-u_xlat16_17);
    u_xlat16_8.xy = (bool(u_xlatb0)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat16_7.x = u_xlat16_7.x * u_xlat16_8.y;
    u_xlat16_7.x = fract(u_xlat16_7.x);
    u_xlat16_8.xyz = u_xlat16_8.xxx * u_xlat16_7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat16_8.xyz = fract(u_xlat16_8.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat16_8.xyz = abs(u_xlat16_8.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_8.xyz = clamp(u_xlat16_8.xyz, 0.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_8.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_7.x = u_xlat16_3.x + 9.99999975e-05;
    u_xlat16_7.x = u_xlat16_12.x / u_xlat16_7.x;
    u_xlat16_7.x = u_xlat16_7.x * _Saturation;
    u_xlat16_7.xyz = u_xlat16_7.xxx * u_xlat16_8.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_3.xxx;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat16_3.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat16_3.x = float(1.0) / u_xlat16_3.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat16_3.x = u_xlat16_2.x * -2.0 + 3.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_3.x;
    u_xlat16_3.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat16_4.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_3.xyz);
    u_xlat16_3.xyz = u_xlat16_2.xxx * u_xlat16_4.xyz + u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat16_2.xyz * vs_COLOR0.xyz;
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
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
}
}
}
}