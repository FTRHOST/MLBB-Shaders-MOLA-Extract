//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Scene/Compression_Simple_VertexOffsetDissolve" {
Properties {

_cull ("剔除模式", Float) = 2.0

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_MainTex ("Albedo贴图", 2D) = "white" { }

_MainColor ("Albedo颜色", Color) = (1,1,1,1)

_HDR_Intensity ("HDR强度限制", Range(0, 3)) = 1.0

_AlphaClip ("AlphaClip", Range(0, 1)) = 0.0

_UseVertical ("切换溶解方向", Float) = 0.0

_NoiseMap ("顶点偏移扰动贴图", 2D) = "white" { }

_NoiseWarp ("顶点偏移扰动", Range(0, 2)) = 0.5

_NoiseIntensity ("顶点偏移强度", Range(0, 2)) = 0.5

_DissolveRange ("顶点偏移范围", Range(0.2, 10)) = 1.0

_DissolveShrink ("溶解边缘压缩", Float) = 8.0

_DissolveParams ("顶点偏移溶解参数", Vector) = (1,0,0,0)

_FissureMask ("边缘裂缝贴图(与上图共用缩放)", 2D) = "white" { }

_FissureEdgeColor ("边缘裂缝颜色", Color) = (1,1,1,1)

_FissureOffset ("边缘裂缝偏移", Range(-1, 1)) = 0.0

_FissureShrink ("边缘裂缝压缩", Float) = 8.0

_FissureRange ("边缘裂缝范围", Range(0.2, 10)) = 1.0

_FogColor ("雾效颜色", Color) = (1,1,1,1)

_FogVector ("FogVector", Vector) = (9999,1,0,0)

_StencilRef ("StencilRef", Float) = 0.0

_StencilComp ("StencilComp", Float) = 8.0

}
SubShader {
 Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" }
 Cull Off
  GpuProgramID 30858
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_6 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_6;
    u_xlat16_6 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_6 = u_xlat16_6 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_11 = u_xlat16_6 * -2.0 + 3.0;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_6 = min(u_xlat16_6, 1.0);
    u_xlat16_1.x = u_xlat16_6 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.zxy;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_6 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_6;
    u_xlat16_6 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_6 = u_xlat16_6 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_11 = u_xlat16_6 * -2.0 + 3.0;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_6 = min(u_xlat16_6, 1.0);
    u_xlat16_1.x = u_xlat16_6 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.zxy;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_6 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_6;
    u_xlat16_6 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_6 = u_xlat16_6 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_11 = u_xlat16_6 * -2.0 + 3.0;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_6 = min(u_xlat16_6, 1.0);
    u_xlat16_1.x = u_xlat16_6 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.zxy;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_0.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(3) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump float u_xlat16_6;
mediump float u_xlat16_11;
float u_xlat15;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_6 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_6 + u_xlat16_1.x;
    u_xlat16_6 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_6;
    u_xlat16_6 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_6 = u_xlat16_6 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6 = min(max(u_xlat16_6, 0.0), 1.0);
#else
    u_xlat16_6 = clamp(u_xlat16_6, 0.0, 1.0);
#endif
    u_xlat16_11 = u_xlat16_6 * -2.0 + 3.0;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_6;
    u_xlat16_6 = u_xlat16_6 * u_xlat16_11;
    u_xlat16_6 = min(u_xlat16_6, 1.0);
    u_xlat16_1.x = u_xlat16_6 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.zxy;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_0.zxy / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat15 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat15);
    u_xlat1.x = u_xlat15 * 0.0625 + u_xlat1.y;
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_5.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_5.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
uniform 	mediump float _NoiseWarp;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat16_8 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat16_0 = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_8 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseVertical>=0.5);
#else
    u_xlatb4 = _UseVertical>=0.5;
#endif
    u_xlat16_5 = (u_xlatb4) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_9 = (u_xlatb4) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_5 = u_xlat16_9 + u_xlat16_5;
    u_xlat16_9 = u_xlat16_5 + _DissolveParams.z;
    u_xlat16_13 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_9 * u_xlat16_13 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat4 = (-u_xlat16_1.x) + 1.0;
    u_xlat4 = u_xlat4 + _AlphaClip;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4 = (-u_xlat4) + u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4<0.0);
#else
    u_xlatb4 = u_xlat4<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_1.xzw = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_1.xzw = u_xlat16_2.zxy / u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xzw = max(u_xlat16_1.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_3.x = _DissolveParams.z + _FissureOffset;
    u_xlat16_5 = u_xlat16_5 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_5 * _FissureShrink + -0.100000001;
    u_xlat16_5 = u_xlat16_5 * _FissureShrink;
    u_xlat16_5 = dot(vec2(u_xlat16_5), vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_5 = u_xlat16_5 + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_7;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_5 = u_xlat16_5 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_5) * _FissureEdgeColor.zxy;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_1.xzw;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_4.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
uniform 	mediump float _NoiseWarp;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
UNITY_LOCATION(3) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
mediump float u_xlat16_9;
float u_xlat12;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat16_8 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat16_0 = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_8 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseVertical>=0.5);
#else
    u_xlatb4 = _UseVertical>=0.5;
#endif
    u_xlat16_5 = (u_xlatb4) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_9 = (u_xlatb4) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_5 = u_xlat16_9 + u_xlat16_5;
    u_xlat16_9 = u_xlat16_5 + _DissolveParams.z;
    u_xlat16_13 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_9 * u_xlat16_13 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat4 = (-u_xlat16_1.x) + 1.0;
    u_xlat4 = u_xlat4 + _AlphaClip;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4 = (-u_xlat4) + u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4<0.0);
#else
    u_xlatb4 = u_xlat4<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_1.xzw = (-u_xlat16_2.zxy) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_1.xzw = u_xlat16_2.zxy / u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainColor.zxy;
    u_xlat16_3.xyz = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xzw = max(u_xlat16_1.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_3.x = _DissolveParams.z + _FissureOffset;
    u_xlat16_5 = u_xlat16_5 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_5 * _FissureShrink + -0.100000001;
    u_xlat16_5 = u_xlat16_5 * _FissureShrink;
    u_xlat16_5 = dot(vec2(u_xlat16_5), vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_5 = u_xlat16_5 + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_7;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_5 = u_xlat16_5 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_5) * _FissureEdgeColor.zxy;
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_1.xzw;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat12 = floor(u_xlat1.x);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat12);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat12 * 0.0625 + u_xlat1.y;
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat2.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat2.xy, 0.0).xyz;
    u_xlat2.xyz = (-u_xlat16_4.xyz) + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz + u_xlat16_4.xyz;
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_5 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_5;
    u_xlat16_5 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_5 = u_xlat16_5 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_5 * -2.0 + 3.0;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_9;
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_5 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_5;
    u_xlat16_5 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_5 = u_xlat16_5 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_5 * -2.0 + 3.0;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_9;
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_5 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_5;
    u_xlat16_5 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_5 = u_xlat16_5 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_5 * -2.0 + 3.0;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_9;
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(2) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump vec3 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump float u_xlat16_5;
mediump float u_xlat16_9;
void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseVertical>=0.5);
#else
    u_xlatb0 = _UseVertical>=0.5;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_5 = (u_xlatb0) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_1.x = u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = _DissolveParams.z + _FissureOffset;
    u_xlat16_1.x = u_xlat16_1.x + u_xlat16_5;
    u_xlat16_5 = u_xlat16_1.x * _FissureShrink + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * _FissureShrink;
    u_xlat16_1.x = dot(u_xlat16_1.xx, vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_1.x = u_xlat16_1.x + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_5 = u_xlat16_5 * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_5 * -2.0 + 3.0;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 * u_xlat16_9;
    u_xlat16_5 = min(u_xlat16_5, 1.0);
    u_xlat16_1.x = u_xlat16_5 * u_xlat16_1.x;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _FissureEdgeColor.xyz;
    u_xlat16_0.xyz = texture(_MainTex, vs_TEXCOORD0.xy).xyz;
    u_xlat16_2.xyz = (-u_xlat16_0.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_2.xyz = u_xlat16_0.xyz / u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2.xyz = max(u_xlat16_2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_3.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FissureMask, u_xlat0.xy).x;
    SV_Target0.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
uniform 	mediump float _NoiseWarp;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat16_8 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat16_0 = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_8 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseVertical>=0.5);
#else
    u_xlatb4 = _UseVertical>=0.5;
#endif
    u_xlat16_5 = (u_xlatb4) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_9 = (u_xlatb4) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_5 = u_xlat16_9 + u_xlat16_5;
    u_xlat16_9 = u_xlat16_5 + _DissolveParams.z;
    u_xlat16_13 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_9 * u_xlat16_13 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat4 = (-u_xlat16_1.x) + 1.0;
    u_xlat4 = u_xlat4 + _AlphaClip;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4 = (-u_xlat4) + u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4<0.0);
#else
    u_xlatb4 = u_xlat4<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_1.xzw = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_1.xzw = u_xlat16_2.xyz / u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xzw = max(u_xlat16_1.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_3.x = _DissolveParams.z + _FissureOffset;
    u_xlat16_5 = u_xlat16_5 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_5 * _FissureShrink + -0.100000001;
    u_xlat16_5 = u_xlat16_5 * _FissureShrink;
    u_xlat16_5 = dot(vec2(u_xlat16_5), vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_5 = u_xlat16_5 + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_7;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_5 = u_xlat16_5 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_5) * _FissureEdgeColor.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_1.xzw;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
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
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _DissolveRange;
uniform 	mediump float _NoiseWarp;
uniform 	mediump float _NoiseIntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM mediump float _COLOR_MODE;
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_WorldTransformParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(2) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseMap;
in highp vec4 in_POSITION0;
in mediump vec4 in_NORMAL0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
out mediump vec4 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
mediump vec2 u_xlat16_1;
float u_xlat2;
bool u_xlatb2;
mediump float u_xlat16_3;
mediump float u_xlat16_5;
void main()
{
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = in_TEXCOORD0.xy * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat0.x = textureLod(_NoiseMap, u_xlat0.xy, 0.0).x;
    u_xlat16_1.x = u_xlat0.x + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
    u_xlat0.x = (-in_TEXCOORD1.y);
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_UseVertical>=0.5);
#else
    u_xlatb2 = _UseVertical>=0.5;
#endif
    u_xlat0.x = u_xlatb2 ? u_xlat0.x : float(0.0);
    u_xlat2 = (u_xlatb2) ? 0.0 : in_TEXCOORD1.y;
    u_xlat0.x = u_xlat0.x + u_xlat2;
    u_xlat16_3 = u_xlat0.x + _DissolveParams.z;
    u_xlat16_5 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_3 * u_xlat16_5 + u_xlat16_1.x;
    u_xlat16_5 = dot(u_xlat16_1.xx, vec2(vec2(_DissolveRange, _DissolveRange)));
    u_xlat16_1.x = u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_5 + (-_DissolveRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_1.y = (-u_xlat16_5) + 1.0;
    u_xlat0.xy = u_xlat16_1.yy * in_NORMAL0.xz;
    vs_TEXCOORD4.xy = u_xlat16_1.xy;
    u_xlat0.xy = u_xlat0.xy * vec2(vec2(_NoiseIntensity, _NoiseIntensity)) + in_POSITION0.xz;
    u_xlat1 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = hlslcc_mtx4x4unity_ObjectToWorld[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * u_xlat0.yyyy + u_xlat1;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
uniform 	mediump float _HDR_Intensity;
uniform 	mediump vec4 _MainColor;
uniform 	mediump float _AlphaClip;
uniform 	mediump vec4 _NoiseMap_ST;
uniform 	mediump float _UseVertical;
uniform 	mediump vec4 _DissolveParams;
uniform 	mediump vec4 _FissureEdgeColor;
uniform 	mediump float _DissolveShrink;
uniform 	mediump float _FissureShrink;
uniform 	mediump float _FissureRange;
uniform 	mediump float _FissureOffset;
uniform 	mediump float _NoiseWarp;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerCamera {
#endif
	UNITY_UNIFORM vec4 _Time;
	UNITY_UNIFORM vec4 _SinTime;
	UNITY_UNIFORM vec4 _CosTime;
	UNITY_UNIFORM vec4 unity_DeltaTime;
	UNITY_UNIFORM vec4 _TimeParameters;
	UNITY_UNIFORM vec3 _WorldSpaceCameraPos;
	UNITY_UNIFORM vec4 _ProjectionParams;
	UNITY_UNIFORM vec4 _ScreenParams;
	UNITY_UNIFORM vec4 _ZBufferParams;
	UNITY_UNIFORM vec4 unity_OrthoParams;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseMap;
UNITY_LOCATION(2) uniform mediump sampler2D _FissureMask;
in mediump vec4 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec2 u_xlat0;
mediump float u_xlat16_0;
mediump vec4 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat16_3;
float u_xlat4;
bool u_xlatb4;
mediump float u_xlat16_5;
mediump float u_xlat16_7;
mediump float u_xlat16_8;
mediump float u_xlat16_9;
mediump float u_xlat16_13;
void main()
{
    u_xlat0.xy = _DissolveParams.xy * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_1.xy = vs_TEXCOORD0.zw * _NoiseMap_ST.xy + _NoiseMap_ST.zw;
    u_xlat0.xy = u_xlat0.xy + u_xlat16_1.xy;
    u_xlat16_8 = texture(_NoiseMap, u_xlat0.xy).x;
    u_xlat16_0 = texture(_FissureMask, u_xlat0.xy).x;
    u_xlat16_1.x = u_xlat16_8 + -0.5;
    u_xlat16_1.x = u_xlat16_1.x * _NoiseWarp;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_UseVertical>=0.5);
#else
    u_xlatb4 = _UseVertical>=0.5;
#endif
    u_xlat16_5 = (u_xlatb4) ? 0.0 : vs_TEXCOORD0.w;
    u_xlat16_9 = (u_xlatb4) ? (-vs_TEXCOORD0.w) : 0.0;
    u_xlat16_5 = u_xlat16_9 + u_xlat16_5;
    u_xlat16_9 = u_xlat16_5 + _DissolveParams.z;
    u_xlat16_13 = max(_DissolveShrink, 0.100000001);
    u_xlat16_1.x = u_xlat16_9 * u_xlat16_13 + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_9 = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_9;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat4 = (-u_xlat16_1.x) + 1.0;
    u_xlat4 = u_xlat4 + _AlphaClip;
    u_xlat16_2 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat4 = (-u_xlat4) + u_xlat16_2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(u_xlat4<0.0);
#else
    u_xlatb4 = u_xlat4<0.0;
#endif
    if(u_xlatb4){discard;}
    u_xlat16_1.xzw = (-u_xlat16_2.xyz) + vec3(1.01900005, 1.01900005, 1.01900005);
    u_xlat16_1.xzw = u_xlat16_2.xyz / u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainColor.xyz;
    u_xlat16_3.xyz = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001);
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.155000001, 0.155000001, 0.155000001) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1.xzw = max(u_xlat16_1.xzw, vec3(0.0, 0.0, 0.0));
    u_xlat16_3.xyz = u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(vec3(_HDR_Intensity, _HDR_Intensity, _HDR_Intensity)) + u_xlat16_3.xyz;
    u_xlat16_3.x = _DissolveParams.z + _FissureOffset;
    u_xlat16_5 = u_xlat16_5 + u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_5 * _FissureShrink + -0.100000001;
    u_xlat16_5 = u_xlat16_5 * _FissureShrink;
    u_xlat16_5 = dot(vec2(u_xlat16_5), vec2(vec2(_FissureRange, _FissureRange)));
    u_xlat16_5 = u_xlat16_5 + (-_FissureRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
    u_xlat16_5 = (-u_xlat16_5) + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_7 = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_7;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_5 = u_xlat16_5 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_5) * _FissureEdgeColor.xyz;
    SV_Target0.xyz = u_xlat16_3.xyz * vec3(u_xlat16_0) + u_xlat16_1.xzw;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
""
}
SubProgram "gles hw_tier01 " {
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles hw_tier00 " {
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
""
}
SubProgram "gles hw_tier01 " {
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
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
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier00 " {
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier01 " {
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
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
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_COLOR_HDR_" }
Local Keywords { "_ALPHA_CLIP" "_ISCOMPRESSED" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_Scene_Compression_Simple_VertexOffsetDissolveGUI"
}