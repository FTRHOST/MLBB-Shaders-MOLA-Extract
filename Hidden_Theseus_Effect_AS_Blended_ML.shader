//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Hidden/Theseus/Effect/AS_Blended_ML" {
Properties {

_Usage ("仅能用于Theseus工艺的皮肤特效", Float) = 1.0

_Diffuse ("Diffuse", 2D) = "white" { }

_Intensity ("Intensity", Float) = 0.0

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

_Cutoff ("Alpha cutoff", Range(0, 1)) = 0.5

[Toggle] _IsGray ("IsGray", Float) = 0.0

_TransparentStrong ("TransparentStrong", Float) = 1.0

_IsInvertGray ("IsInvertGray", Float) = 0.0

}
SubShader {
 Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "IGNOREPROJECTOR" = "true" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Off
  GpuProgramID 8813
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
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat16_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat9 = u_xlat9 * _TransparentStrong;
    u_xlat1.w = u_xlat9 * vs_COLOR0.w;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat16_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat9 = u_xlat9 * _TransparentStrong;
    u_xlat1.w = u_xlat9 * vs_COLOR0.w;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat9 = u_xlat10_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat9 = u_xlat9 * _TransparentStrong;
    u_xlat1.w = u_xlat9 * vs_COLOR0.w;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat9 = u_xlat10_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat9 = u_xlat9 * _TransparentStrong;
    u_xlat1.w = u_xlat9 * vs_COLOR0.w;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat16_0.w * u_xlat16_2;
    u_xlat0 = u_xlat16_0.x * u_xlat16_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat6 = u_xlat6 * _TransparentStrong;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.w>=u_xlat2.x);
#else
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x>=(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = u_xlat6 * u_xlat1.w;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat16_0.w * u_xlat16_2;
    u_xlat0 = u_xlat16_0.x * u_xlat16_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat6 = u_xlat6 * _TransparentStrong;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.w>=u_xlat2.x);
#else
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x>=(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = u_xlat6 * u_xlat1.w;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat6 = u_xlat10_0.w * u_xlat16_2;
    u_xlat0 = u_xlat10_0.x * u_xlat10_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat6 = u_xlat6 * _TransparentStrong;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = u_xlat6 * u_xlat1.w;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat6 = u_xlat10_0.w * u_xlat16_2;
    u_xlat0 = u_xlat10_0.x * u_xlat10_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat6 = u_xlat6 * _TransparentStrong;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = u_xlat6 * u_xlat1.w;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat16_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1 = min(max(u_xlat16_1, 0.0), 1.0);
#else
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat16_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat9 = u_xlat10_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
bvec2 u_xlatb2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat0.xyz = u_xlat0.xyz * _Color.xyz;
    u_xlat16_1 = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb2.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb2.x) ? vec3(u_xlat16_1) : u_xlat0.xyz;
    u_xlat2.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1 = _Color.w;
    u_xlat16_1 = clamp(u_xlat16_1, 0.0, 1.0);
    u_xlat9 = u_xlat10_0.w * u_xlat16_1;
    u_xlat2.xzw = vec3(u_xlat9) * u_xlat2.xzw;
    u_xlat1.xyz = (u_xlatb2.y) ? u_xlat2.xzw : u_xlat0.xyz;
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat16_0.w * u_xlat16_2;
    u_xlat0 = u_xlat16_0.x * u_xlat16_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.w>=u_xlat2.x);
#else
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x>=(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0 = (u_xlatb12) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat0 = u_xlat1.w * u_xlat0;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
float u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat6 = u_xlat16_0.w * u_xlat16_2;
    u_xlat0 = u_xlat16_0.x * u_xlat16_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.x>=u_xlat1.y);
#else
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
#endif
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(u_xlat1.w>=u_xlat2.x);
#else
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
#endif
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(u_xlat7.x>=(-u_xlat7.x));
#else
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
#endif
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0 = (u_xlatb12) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat0 = u_xlat1.w * u_xlat0;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat6 = u_xlat10_0.w * u_xlat16_2;
    u_xlat0 = u_xlat10_0.x * u_xlat10_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
    u_xlat0 = (u_xlatb12) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat0 = u_xlat1.w * u_xlat0;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
float u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
float u_xlat6;
bvec2 u_xlatb6;
vec3 u_xlat7;
bool u_xlatb7;
float u_xlat12;
bool u_xlatb12;
float u_xlat18;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(_Intensity);
    u_xlat1.xyz = u_xlat1.xyz * _Color.xyz;
    u_xlat16_2 = dot(u_xlat1.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb6.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat1.xyz = (u_xlatb6.x) ? vec3(u_xlat16_2) : u_xlat1.xyz;
    u_xlat3.xyz = (-u_xlat1.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2 = _Color.w;
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
    u_xlat6 = u_xlat10_0.w * u_xlat16_2;
    u_xlat0 = u_xlat10_0.x * u_xlat10_0.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = vec3(u_xlat6) * u_xlat3.xyz;
    u_xlat1.xyw = (u_xlatb6.y) ? u_xlat3.yzx : u_xlat1.yzx;
    u_xlatb12 = u_xlat1.x>=u_xlat1.y;
    u_xlat16_2 = (u_xlatb12) ? 1.0 : 0.0;
    u_xlat3.z = float(-1.0);
    u_xlat3.w = float(0.666666687);
    u_xlat3.xy = u_xlat1.yx;
    u_xlat4.xy = u_xlat1.xy + (-u_xlat3.xy);
    u_xlat4.z = float(1.0);
    u_xlat4.w = float(-1.0);
    u_xlat2 = vec4(u_xlat16_2) * u_xlat4 + u_xlat3;
    u_xlatb12 = u_xlat1.w>=u_xlat2.x;
    u_xlat12 = u_xlatb12 ? 1.0 : float(0.0);
    u_xlat1.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat1.wyx;
    u_xlat2 = (-u_xlat1) + u_xlat2;
    u_xlat1 = vec4(u_xlat12) * u_xlat2 + u_xlat1;
    u_xlat12 = min(u_xlat1.y, u_xlat1.w);
    u_xlat12 = (-u_xlat12) + u_xlat1.x;
    u_xlat18 = u_xlat12 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat1.y) + u_xlat1.w;
    u_xlat18 = u_xlat7.x / u_xlat18;
    u_xlat18 = u_xlat18 + u_xlat1.z;
    u_xlat18 = abs(u_xlat18) + _Hue;
    u_xlat7.x = u_xlat18 * 360.0;
    u_xlatb7 = u_xlat7.x>=(-u_xlat7.x);
    u_xlat7.xy = (bool(u_xlatb7)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat18 = u_xlat18 * u_xlat7.y;
    u_xlat18 = fract(u_xlat18);
    u_xlat7.xyz = u_xlat7.xxx * vec3(u_xlat18) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat18 = u_xlat1.x + 1.00000001e-10;
    u_xlat12 = u_xlat12 / u_xlat18;
    u_xlat12 = u_xlat12 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat12) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat1.xyz = u_xlat7.xyz * u_xlat1.xxx;
    u_xlat16_5.xyz = u_xlat1.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat12 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat12 = float(1.0) / u_xlat12;
    u_xlat0 = u_xlat12 * u_xlat0;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat12 = u_xlat0 * -2.0 + 3.0;
    u_xlat0 = u_xlat0 * u_xlat0;
    u_xlat0 = u_xlat0 * u_xlat12;
    u_xlat1 = (-_SaturLeftColor) + _SaturRightColor;
    u_xlat1 = vec4(u_xlat0) * u_xlat1 + _SaturLeftColor;
    u_xlat2.xyz = u_xlat1.xyz * u_xlat16_5.xyz;
    u_xlat0 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb12 = _Height>=vs_TEXCOORD1.y;
    u_xlat0 = (u_xlatb12) ? 0.0 : u_xlat0;
    u_xlat0 = u_xlat0 / _HeightGradient;
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
    u_xlat0 = u_xlat0 * u_xlat6;
    u_xlat0 = u_xlat1.w * u_xlat0;
    u_xlat2.w = u_xlat0 * vs_COLOR0.w;
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat16_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat12) * u_xlat1.xzw;
    u_xlat12 = u_xlat12 * _TransparentStrong;
    u_xlat2.w = u_xlat12 * vs_COLOR0.w;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat12 = u_xlat16_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat12) * u_xlat1.xzw;
    u_xlat12 = u_xlat12 * _TransparentStrong;
    u_xlat2.w = u_xlat12 * vs_COLOR0.w;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat12 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat12) * u_xlat1.xzw;
    u_xlat12 = u_xlat12 * _TransparentStrong;
    u_xlat2.w = u_xlat12 * vs_COLOR0.w;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat2;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat12;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat12 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat12) * u_xlat1.xzw;
    u_xlat12 = u_xlat12 * _TransparentStrong;
    u_xlat2.w = u_xlat12 * vs_COLOR0.w;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_3.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_3.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0 = u_xlat2;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat7 = u_xlat7 * _TransparentStrong;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.x>=u_xlat0.y);
#else
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
#endif
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.w>=u_xlat2.x);
#else
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
#endif
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat7 = u_xlat7 * _TransparentStrong;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.x>=u_xlat0.y);
#else
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
#endif
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.w>=u_xlat2.x);
#else
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
#endif
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat7 = u_xlat16_0.x * u_xlat10_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat7 = u_xlat7 * _TransparentStrong;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _TransparentStrong;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat7 = u_xlat16_0.x * u_xlat10_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat7 = u_xlat7 * _TransparentStrong;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat16_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat16_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat16_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat9 = u_xlat16_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat9 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
vec4 u_xlat1;
bvec2 u_xlatb1;
mediump vec3 u_xlat16_2;
bool u_xlatb3;
float u_xlat9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat1.xyz = u_xlat10_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat1.xyz = u_xlat10_0.xyz * u_xlat1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.xyz = u_xlat10_0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vec3(_Intensity);
    u_xlat16_2.xyz = _Color.xyz * _Color.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat0.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb1.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat0.xyz = (u_xlatb1.x) ? u_xlat16_2.xxx : u_xlat0.xyz;
    u_xlat1.xzw = (-u_xlat0.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_2.x = _Color.w;
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
    u_xlat9 = u_xlat10_0.w * u_xlat16_2.x;
    u_xlat1.xzw = vec3(u_xlat9) * u_xlat1.xzw;
    u_xlat0.xyz = (u_xlatb1.y) ? u_xlat1.xzw : u_xlat0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat16_2.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb3 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb3) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.x = u_xlat0.x * u_xlat9;
    u_xlat1.w = u_xlat0.x * vs_COLOR0.w;
    SV_Target0 = u_xlat1;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.x>=u_xlat0.y);
#else
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
#endif
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.w>=u_xlat2.x);
#else
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
#endif
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb19 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat13 = (u_xlatb19) ? 0.0 : u_xlat13;
    u_xlat13 = u_xlat13 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat13 * u_xlat7;
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat16_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat16_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat16_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_0.x = min(max(u_xlat16_0.x, 0.0), 1.0);
#else
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat16_0.x * u_xlat16_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.x>=u_xlat0.y);
#else
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
#endif
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
#ifdef UNITY_ADRENO_ES3
    u_xlatb13 = !!(u_xlat0.w>=u_xlat2.x);
#else
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
#endif
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat2.x>=(-u_xlat2.x));
#else
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
#endif
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb19 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat13 = (u_xlatb19) ? 0.0 : u_xlat13;
    u_xlat13 = u_xlat13 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat13 = min(max(u_xlat13, 0.0), 1.0);
#else
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
#endif
    u_xlat7 = u_xlat13 * u_xlat7;
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat7 = u_xlat16_0.x * u_xlat10_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb19 = _Height>=vs_TEXCOORD1.y;
    u_xlat13 = (u_xlatb19) ? 0.0 : u_xlat13;
    u_xlat13 = u_xlat13 / _HeightGradient;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat7 = u_xlat13 * u_xlat7;
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
    SV_Target0 = u_xlat0;
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
uniform 	vec4 _Diffuse_ST;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat1 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    vs_TEXCOORD1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat0 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat1.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat1.zzzz + u_xlat0;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat1.wwww + u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy * _Diffuse_ST.xy + _Diffuse_ST.zw;
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
uniform 	float _IsGray;
uniform 	float _IsInvertGray;
uniform 	float _Intensity;
uniform 	vec4 _Color;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
vec3 u_xlat1;
lowp vec4 u_xlat10_1;
vec4 u_xlat2;
bool u_xlatb2;
vec4 u_xlat3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
float u_xlat7;
bvec2 u_xlatb7;
float u_xlat13;
bool u_xlatb13;
float u_xlat19;
bool u_xlatb19;
void main()
{
    u_xlat16_0.xyz = _Color.xyz * _Color.xyz;
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat2.xyz = u_xlat10_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat2.xyz = u_xlat10_1.xyz * u_xlat2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat1.xyz = u_xlat10_1.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat1.xyz * vec3(_Intensity);
    u_xlat1.x = u_xlat1.x * u_xlat10_1.w + (-_SaturLeftColorWeights);
    u_xlat2.xyz = u_xlat16_0.xyz * u_xlat2.xyz;
    u_xlat16_0.x = dot(u_xlat2.xyz, vec3(0.219999999, 0.707000017, 0.0710000023));
    u_xlatb7.xy = lessThan(vec4(0.0, 0.0, 0.0, 0.0), vec4(_IsGray, _IsInvertGray, _IsGray, _IsGray)).xy;
    u_xlat2.xyz = (u_xlatb7.x) ? u_xlat16_0.xxx : u_xlat2.xyz;
    u_xlat3.xyz = (-u_xlat2.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_0.x = _Color.w;
    u_xlat16_0.x = clamp(u_xlat16_0.x, 0.0, 1.0);
    u_xlat7 = u_xlat16_0.x * u_xlat10_1.w;
    u_xlat3.xyz = vec3(u_xlat7) * u_xlat3.xyz;
    u_xlat0.xyw = (u_xlatb7.y) ? u_xlat3.yzx : u_xlat2.yzx;
    u_xlatb13 = u_xlat0.x>=u_xlat0.y;
    u_xlat16_4.x = (u_xlatb13) ? 1.0 : 0.0;
    u_xlat2.xy = u_xlat0.yx;
    u_xlat3.xy = u_xlat0.xy + (-u_xlat2.xy);
    u_xlat2.z = float(-1.0);
    u_xlat2.w = float(0.666666687);
    u_xlat3.z = float(1.0);
    u_xlat3.w = float(-1.0);
    u_xlat2 = u_xlat16_4.xxxx * u_xlat3 + u_xlat2;
    u_xlatb13 = u_xlat0.w>=u_xlat2.x;
    u_xlat13 = u_xlatb13 ? 1.0 : float(0.0);
    u_xlat0.xyz = u_xlat2.xyw;
    u_xlat2.xyw = u_xlat0.wyx;
    u_xlat2 = (-u_xlat0) + u_xlat2;
    u_xlat0 = vec4(u_xlat13) * u_xlat2 + u_xlat0;
    u_xlat13 = min(u_xlat0.y, u_xlat0.w);
    u_xlat13 = u_xlat0.x + (-u_xlat13);
    u_xlat19 = u_xlat13 * 6.0 + 1.00000001e-10;
    u_xlat2.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat19 = u_xlat2.x / u_xlat19;
    u_xlat19 = u_xlat0.z + u_xlat19;
    u_xlat19 = abs(u_xlat19) + _Hue;
    u_xlat2.x = u_xlat19 * 360.0;
    u_xlatb2 = u_xlat2.x>=(-u_xlat2.x);
    u_xlat2.xy = (bool(u_xlatb2)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat19 = u_xlat19 * u_xlat2.y;
    u_xlat19 = fract(u_xlat19);
    u_xlat2.xyz = u_xlat2.xxx * vec3(u_xlat19) + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat2.xyz = fract(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat2.xyz = abs(u_xlat2.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
    u_xlat2.xyz = u_xlat2.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat19 = u_xlat0.x + 1.00000001e-10;
    u_xlat13 = u_xlat13 / u_xlat19;
    u_xlat13 = u_xlat13 * _Saturation;
    u_xlat2.xyz = vec3(u_xlat13) * u_xlat2.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat2.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat16_4.xyz = u_xlat2.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat13 = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat13 = float(1.0) / u_xlat13;
    u_xlat1.x = u_xlat13 * u_xlat1.x;
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
    u_xlat13 = u_xlat1.x * -2.0 + 3.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat13;
    u_xlat16_5.xyz = _SaturLeftColor.xyz * _SaturLeftColor.xyz;
    u_xlat2.xyz = _SaturRightColor.xyz * _SaturRightColor.xyz + (-u_xlat16_5.xyz);
    u_xlat2.xyz = u_xlat1.xxx * u_xlat2.xyz + u_xlat16_5.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_4.xyz;
    u_xlat16_4.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat16_4.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat2.xyz = exp2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat13 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb19 = _Height>=vs_TEXCOORD1.y;
    u_xlat13 = (u_xlatb19) ? 0.0 : u_xlat13;
    u_xlat13 = u_xlat13 / _HeightGradient;
    u_xlat13 = clamp(u_xlat13, 0.0, 1.0);
    u_xlat7 = u_xlat13 * u_xlat7;
    u_xlat13 = (-_SaturLeftColor.w) + _SaturRightColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat13 + _SaturLeftColor.w;
    u_xlat1.x = u_xlat1.x * u_xlat7;
    u_xlat0.w = u_xlat1.x * vs_COLOR0.w;
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
CustomEditor "HeroShowRenderingGUI.VFX.ASEffectShaderGUI"
}