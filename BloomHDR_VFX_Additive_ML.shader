//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "BloomHDR/VFX/Additive_ML" {
Properties {

_Usage ("仅能用于25年上半年SPD新皮肤", Float) = 1.0

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
  GpuProgramID 20649
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb9 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat16_0 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb9 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.xyz;
    u_xlatb9 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat16_1.xyz;
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
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
bool u_xlatb9;
void main()
{
    u_xlat10_0 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat0.xyz = u_xlat10_0.www * u_xlat10_0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_1.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_1.xyz = u_xlat16_2.xyz / u_xlat16_1.xyz;
    u_xlatb9 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat16_1.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" }
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat3.xyw = u_xlat16_2.www * u_xlat16_2.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat3.x>=u_xlat3.y);
#else
    u_xlatb4 = u_xlat3.x>=u_xlat3.y;
#endif
    u_xlat16_5.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat0.xy = u_xlat3.yx;
    u_xlat1.xy = u_xlat16_2.yz * u_xlat16_2.ww + (-u_xlat0.xy);
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
    u_xlat1.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat3.w>=u_xlat3.x);
#else
    u_xlatb8 = u_xlat3.w>=u_xlat3.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyw = u_xlat3.wyx;
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = vec4(u_xlat8) * u_xlat0 + u_xlat3;
    u_xlat8 = min(u_xlat0.y, u_xlat0.w);
    u_xlat8 = u_xlat0.x + (-u_xlat8);
    u_xlat15 = u_xlat8 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat15;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = u_xlat0.x + 1.00000001e-10;
    u_xlat8 = u_xlat8 / u_xlat15;
    u_xlat8 = u_xlat8 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat8) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb21 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat16_2 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat3.xyw = u_xlat16_2.www * u_xlat16_2.yzx;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat3.x>=u_xlat3.y);
#else
    u_xlatb4 = u_xlat3.x>=u_xlat3.y;
#endif
    u_xlat16_5.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat0.xy = u_xlat3.yx;
    u_xlat1.xy = u_xlat16_2.yz * u_xlat16_2.ww + (-u_xlat0.xy);
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
    u_xlat1.x = u_xlat16_2.x * u_xlat16_2.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = u_xlat0.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb8 = !!(u_xlat3.w>=u_xlat3.x);
#else
    u_xlatb8 = u_xlat3.w>=u_xlat3.x;
#endif
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyw = u_xlat3.wyx;
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = vec4(u_xlat8) * u_xlat0 + u_xlat3;
    u_xlat8 = min(u_xlat0.y, u_xlat0.w);
    u_xlat8 = u_xlat0.x + (-u_xlat8);
    u_xlat15 = u_xlat8 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat15;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = u_xlat0.x + 1.00000001e-10;
    u_xlat8 = u_xlat8 / u_xlat15;
    u_xlat8 = u_xlat8 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat8) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb21 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat3.xyw = u_xlat10_2.www * u_xlat10_2.yzx;
    u_xlatb4 = u_xlat3.x>=u_xlat3.y;
    u_xlat16_5.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat0.xy = u_xlat3.yx;
    u_xlat1.xy = u_xlat10_2.yz * u_xlat10_2.ww + (-u_xlat0.xy);
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
    u_xlat1.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = u_xlat0.xyw;
    u_xlatb8 = u_xlat3.w>=u_xlat3.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyw = u_xlat3.wyx;
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = vec4(u_xlat8) * u_xlat0 + u_xlat3;
    u_xlat8 = min(u_xlat0.y, u_xlat0.w);
    u_xlat8 = u_xlat0.x + (-u_xlat8);
    u_xlat15 = u_xlat8 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat15;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = u_xlat0.x + 1.00000001e-10;
    u_xlat8 = u_xlat8 / u_xlat15;
    u_xlat8 = u_xlat8 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat8) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb21 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	mediump float _Hue;
uniform 	mediump float _Saturation;
uniform 	mediump float _Contrast;
uniform 	mediump vec4 _SaturLeftColor;
uniform 	mediump vec4 _SaturRightColor;
uniform 	mediump float _SaturLeftColorWeights;
uniform 	mediump float _SaturRightColorWeights;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
bool u_xlatb8;
vec2 u_xlat14;
bool u_xlatb14;
float u_xlat15;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat10_2 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat3.xyw = u_xlat10_2.www * u_xlat10_2.yzx;
    u_xlatb4 = u_xlat3.x>=u_xlat3.y;
    u_xlat16_5.x = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat0.xy = u_xlat3.yx;
    u_xlat1.xy = u_xlat10_2.yz * u_xlat10_2.ww + (-u_xlat0.xy);
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
    u_xlat1.x = u_xlat10_2.x * u_xlat10_2.w + (-_SaturLeftColorWeights);
    u_xlat3.xyz = u_xlat0.xyw;
    u_xlatb8 = u_xlat3.w>=u_xlat3.x;
    u_xlat8 = u_xlatb8 ? 1.0 : float(0.0);
    u_xlat0.xyw = u_xlat3.wyx;
    u_xlat0 = u_xlat0 + (-u_xlat3);
    u_xlat0 = vec4(u_xlat8) * u_xlat0 + u_xlat3;
    u_xlat8 = min(u_xlat0.y, u_xlat0.w);
    u_xlat8 = u_xlat0.x + (-u_xlat8);
    u_xlat15 = u_xlat8 * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat15;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat15 = u_xlat0.x + 1.00000001e-10;
    u_xlat8 = u_xlat8 / u_xlat15;
    u_xlat8 = u_xlat8 * _Saturation;
    u_xlat7.xyz = vec3(u_xlat8) * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat1.x;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb21 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
bool u_xlatb12;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb4) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb12 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	float _Height;
uniform 	float _HeightGradient;
UNITY_LOCATION(0) uniform mediump sampler2D _Diffuse;
in highp vec2 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD1;
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
bool u_xlatb12;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat0.x = (u_xlatb4) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_1 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb12 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
bool u_xlatb12;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb4) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlatb12 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
uniform 	float _Height;
uniform 	float _HeightGradient;
uniform lowp sampler2D _Diffuse;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec3 u_xlat0;
lowp vec4 u_xlat10_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
bool u_xlatb4;
bool u_xlatb12;
void main()
{
    u_xlat0.x = vs_TEXCOORD1.y + (-_Height);
    u_xlatb4 = _Height>=vs_TEXCOORD1.y;
    u_xlat0.x = (u_xlatb4) ? 0.0 : u_xlat0.x;
    u_xlat0.x = u_xlat0.x / _HeightGradient;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat10_1 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat4.xyz = u_xlat10_1.www * u_xlat10_1.xyz;
    u_xlat4.xyz = u_xlat4.xyz * vs_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_2.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_2.xyz = u_xlat16_3.xyz / u_xlat16_2.xyz;
    u_xlatb12 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb12)) ? u_xlat0.xyz : u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
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
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat2 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb9 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat2 = (u_xlatb9) ? 0.0 : u_xlat2;
    u_xlat2 = u_xlat2 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat9.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat3 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat9.xyz = u_xlat9.xyz * vs_COLOR0.xyz;
    u_xlat4.xyw = vec3(u_xlat2) * u_xlat9.yzx;
    u_xlat0.xy = u_xlat4.yx;
    u_xlat1.xy = u_xlat9.yz * vec2(u_xlat2) + (-u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat0.y>=u_xlat4.y);
#else
    u_xlatb2 = u_xlat0.y>=u_xlat4.y;
#endif
    u_xlat16_5.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat4.w>=u_xlat0.x);
#else
    u_xlatb1 = u_xlat4.w>=u_xlat0.x;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat4.wyx;
    u_xlat0 = (-u_xlat4) + u_xlat0;
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat4;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat1.x = u_xlat1.x * _Saturation;
    u_xlat7.xyz = u_xlat1.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb21 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
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
uniform 	float _Intensity;
uniform 	vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec2 in_TEXCOORD0;
in mediump vec4 in_COLOR0;
out highp vec2 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD1;
out mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
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
in mediump vec3 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat2 = vs_TEXCOORD1.y + (-_Height);
#ifdef UNITY_ADRENO_ES3
    u_xlatb9 = !!(_Height>=vs_TEXCOORD1.y);
#else
    u_xlatb9 = _Height>=vs_TEXCOORD1.y;
#endif
    u_xlat2 = (u_xlatb9) ? 0.0 : u_xlat2;
    u_xlat2 = u_xlat2 / _HeightGradient;
#ifdef UNITY_ADRENO_ES3
    u_xlat2 = min(max(u_xlat2, 0.0), 1.0);
#else
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
#endif
    u_xlat16_3 = texture(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat9.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat3 = u_xlat16_3.x * u_xlat16_3.w + (-_SaturLeftColorWeights);
    u_xlat9.xyz = u_xlat9.xyz * vs_COLOR0.xyz;
    u_xlat4.xyw = vec3(u_xlat2) * u_xlat9.yzx;
    u_xlat0.xy = u_xlat4.yx;
    u_xlat1.xy = u_xlat9.yz * vec2(u_xlat2) + (-u_xlat0.xy);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(u_xlat0.y>=u_xlat4.y);
#else
    u_xlatb2 = u_xlat0.y>=u_xlat4.y;
#endif
    u_xlat16_5.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(u_xlat4.w>=u_xlat0.x);
#else
    u_xlatb1 = u_xlat4.w>=u_xlat0.x;
#endif
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat4.wyx;
    u_xlat0 = (-u_xlat4) + u_xlat0;
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat4;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb14 = !!(u_xlat14.x>=(-u_xlat14.x));
#else
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
#endif
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat1.x = u_xlat1.x * _Saturation;
    u_xlat7.xyz = u_xlat1.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb21 = !!(_COLOR_MODE!=2.0);
#else
    u_xlatb21 = _COLOR_MODE!=2.0;
#endif
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
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
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat2 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb9 = _Height>=vs_TEXCOORD1.y;
    u_xlat2 = (u_xlatb9) ? 0.0 : u_xlat2;
    u_xlat2 = u_xlat2 / _HeightGradient;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat9.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat3 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat9.xyz = u_xlat9.xyz * vs_COLOR0.xyz;
    u_xlat4.xyw = vec3(u_xlat2) * u_xlat9.yzx;
    u_xlat0.xy = u_xlat4.yx;
    u_xlat1.xy = u_xlat9.yz * vec2(u_xlat2) + (-u_xlat0.xy);
    u_xlatb2 = u_xlat0.y>=u_xlat4.y;
    u_xlat16_5.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
    u_xlatb1 = u_xlat4.w>=u_xlat0.x;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat4.wyx;
    u_xlat0 = (-u_xlat4) + u_xlat0;
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat4;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat1.x = u_xlat1.x * _Saturation;
    u_xlat7.xyz = u_xlat1.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb21 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	vec4 _Diffuse_ST;
uniform 	float _Intensity;
uniform 	vec4 _Color;
attribute highp vec4 in_POSITION0;
attribute highp vec2 in_TEXCOORD0;
attribute mediump vec4 in_COLOR0;
varying highp vec2 vs_TEXCOORD0;
varying highp vec3 vs_TEXCOORD1;
varying mediump vec3 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
float u_xlat9;
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
    u_xlat0.x = _Color.w;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat0.xyz = u_xlat0.xxx * _Color.xyz;
    u_xlat16_2.xyz = in_COLOR0.www * in_COLOR0.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_2.xyz;
    u_xlat9 = max(_Intensity, 0.0);
    u_xlat0.xyz = vec3(u_xlat9) * u_xlat0.xyz;
    vs_COLOR0.xyz = u_xlat0.xyz;
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
uniform 	mediump float _COLOR_MODE;
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
varying mediump vec3 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
vec4 u_xlat1;
bool u_xlatb1;
float u_xlat2;
bool u_xlatb2;
float u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
float u_xlat8;
vec3 u_xlat9;
bool u_xlatb9;
vec2 u_xlat14;
bool u_xlatb14;
bool u_xlatb21;
void main()
{
    u_xlat0.z = float(-1.0);
    u_xlat0.w = float(0.666666687);
    u_xlat1.z = float(1.0);
    u_xlat1.w = float(-1.0);
    u_xlat2 = vs_TEXCOORD1.y + (-_Height);
    u_xlatb9 = _Height>=vs_TEXCOORD1.y;
    u_xlat2 = (u_xlatb9) ? 0.0 : u_xlat2;
    u_xlat2 = u_xlat2 / _HeightGradient;
    u_xlat2 = clamp(u_xlat2, 0.0, 1.0);
    u_xlat10_3 = texture2D(_Diffuse, vs_TEXCOORD0.xy);
    u_xlat9.xyz = u_xlat10_3.www * u_xlat10_3.xyz;
    u_xlat3 = u_xlat10_3.x * u_xlat10_3.w + (-_SaturLeftColorWeights);
    u_xlat9.xyz = u_xlat9.xyz * vs_COLOR0.xyz;
    u_xlat4.xyw = vec3(u_xlat2) * u_xlat9.yzx;
    u_xlat0.xy = u_xlat4.yx;
    u_xlat1.xy = u_xlat9.yz * vec2(u_xlat2) + (-u_xlat0.xy);
    u_xlatb2 = u_xlat0.y>=u_xlat4.y;
    u_xlat16_5.x = (u_xlatb2) ? 1.0 : 0.0;
    u_xlat0 = u_xlat16_5.xxxx * u_xlat1 + u_xlat0;
    u_xlatb1 = u_xlat4.w>=u_xlat0.x;
    u_xlat1.x = u_xlatb1 ? 1.0 : float(0.0);
    u_xlat4.xyz = u_xlat0.xyw;
    u_xlat0.xyw = u_xlat4.wyx;
    u_xlat0 = (-u_xlat4) + u_xlat0;
    u_xlat0 = u_xlat1.xxxx * u_xlat0 + u_xlat4;
    u_xlat1.x = min(u_xlat0.y, u_xlat0.w);
    u_xlat1.x = u_xlat0.x + (-u_xlat1.x);
    u_xlat8 = u_xlat1.x * 6.0 + 1.00000001e-10;
    u_xlat7.x = (-u_xlat0.y) + u_xlat0.w;
    u_xlat7.x = u_xlat7.x / u_xlat8;
    u_xlat7.x = u_xlat7.x + u_xlat0.z;
    u_xlat7.x = abs(u_xlat7.x) + _Hue;
    u_xlat14.x = u_xlat7.x * 360.0;
    u_xlatb14 = u_xlat14.x>=(-u_xlat14.x);
    u_xlat14.xy = (bool(u_xlatb14)) ? vec2(360.0, 0.00277777785) : vec2(-360.0, -0.00277777785);
    u_xlat7.x = u_xlat14.y * u_xlat7.x;
    u_xlat7.x = fract(u_xlat7.x);
    u_xlat7.xyz = u_xlat14.xxx * u_xlat7.xxx + vec3(1.0, 0.666666687, 0.333333343);
    u_xlat7.xyz = fract(u_xlat7.xyz);
    u_xlat7.xyz = u_xlat7.xyz * vec3(6.0, 6.0, 6.0) + vec3(-3.0, -3.0, -3.0);
    u_xlat7.xyz = abs(u_xlat7.xyz) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
    u_xlat7.xyz = u_xlat7.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat8 = u_xlat0.x + 1.00000001e-10;
    u_xlat1.x = u_xlat1.x / u_xlat8;
    u_xlat1.x = u_xlat1.x * _Saturation;
    u_xlat7.xyz = u_xlat1.xxx * u_xlat7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx;
    u_xlat16_5.xyz = u_xlat0.xyz * vec3(vec3(_Contrast, _Contrast, _Contrast));
    u_xlat0.x = (-_SaturLeftColorWeights) + _SaturRightColorWeights;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat3;
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
    u_xlat7.x = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat7.x;
    u_xlat7.xyz = (-_SaturLeftColor.xyz) + _SaturRightColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat7.xyz + _SaturLeftColor.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xyz * vs_COLOR0.xyz;
    u_xlat16_5.xyz = max(u_xlat0.xyz, vec3(9.99999975e-06, 9.99999975e-06, 9.99999975e-06));
    u_xlat16_6.xyz = u_xlat16_5.xyz * vec3(1.79999995, 1.79999995, 1.79999995);
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(0.918190002, 0.918190002, 0.918190002) + vec3(4.86986494, 4.86986494, 4.86986494);
    u_xlat16_5.xyz = u_xlat16_6.xyz / u_xlat16_5.xyz;
    u_xlatb21 = _COLOR_MODE!=2.0;
    SV_Target0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat16_5.xyz;
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
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOUR_ON" "_HEIGHTGRADIENT_ON" }
""
}
}
}
}
CustomEditor "Prometheus.PrometheusShaderGUI_ShowTemp"
}