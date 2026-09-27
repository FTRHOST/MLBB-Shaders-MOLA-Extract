//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/ToonLambert(InkFlow_NprStockings)" {
Properties {

_cull ("剔除模式", Float) = 2.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_toonLambertThreshold ("二分光照阈值", Range(0, 1)) = 0.5

_toonLambertColor ("二分光照阴影颜色", Color) = (1,1,1,1)

_materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

_normalMap ("法线贴图", 2D) = "bump" { }

_directSpecularColor ("直接光高光颜色", Color) = (1,1,1,1)

_emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

[Tex] _inkFlowMap ("rg:flow map dir, b:流动范围, a:流动文字mask", 2D) = "white" { }

_inkFlowSpeed ("流动速度", Range(0, 1)) = 0.0

_inkFlowScale ("流动范围", Float) = 0.0

[Tex] _MendsLightMask ("补光遮罩", 2D) = "white" { }

_MendsLightDirection ("补光方向", Vector) = (1,0,1,0)

_MendsLightColor ("补光颜色", Color) = (1,1,1,0)

_MendsLightFallOff ("补光衰减", Range(0, 1)) = 0.0

_MendsLightDirection2 ("补光2方向", Vector) = (1,0,1,0)

_MendsLightColor2 ("补光2颜色", Color) = (1,1,1,0)

_MendsLightFallOff2 ("补光2衰减", Range(0, 1)) = 0.0

[Tex] _outlineNoiseMap ("R:描边噪声, G:描边宽度", 2D) = "white" { }

[Toggle] _use_Outline_UV2 ("use uv2", Float) = 0.0

_outlineColor ("描边颜色", Color) = (1,1,1,1)

_outlineWidth ("描边宽度", Range(0, 10)) = 0.5

_outlineAlphaThreshold ("描边噪声范围", Range(0, 1)) = 0.5

_outlineAlphaWidth ("描边噪声过渡", Range(0, 1)) = 0.5

_outlineClip ("描边clip阈值", Range(0, 1)) = 0.10000000149011612

_OutlineZOffset ("_OutlineZOffset", Range(0, 1)) = 0.0

_MatcapTex ("丝袜高光Matcap", 2D) = "white" { }

_StockingsID ("丝袜遮罩", 2D) = "white" { }

_matCapSpeEffectedByLightDir ("丝袜Matcap受灯光方向影响强弱", Range(0, 1)) = 0.20999999344348907

_customMatcapCol ("丝袜伪各项异性高光颜色", Color) = (0.5,0.5,0.5,1)

_customMatcapFresnelStrPow ("丝袜对比度", Float) = 3.0

_customMatcapFresnelStr ("丝袜边缘光强度", Float) = 18.0

_stockingFresnelCol ("丝袜边缘光颜色", Color) = (1,1,1,1)

}
SubShader {
 Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Pass {
 Name "InkOutline"
  Tags { "QUEUE" = "Geometry" "RenderType" = "Opaque" }
 Cull Front
  GpuProgramID 9787
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
uniform 	mediump float _outlineWidth;
uniform 	mediump float _OutlineZOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb6;
float u_xlat8;
float u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.yyy;
    u_xlat1.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.z = 0.00999999978;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat8 = in_COLOR0.w * _outlineWidth;
    u_xlat12 = textureLod(_outlineNoiseMap, in_TEXCOORD0.xy, 0.0).y;
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixV[3];
    u_xlat12 = u_xlat1.z / hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat2.x = float(1.0) / hlslcc_mtx4x4glstate_matrix_projection[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb6 = unity_OrthoParams.w==0.0;
#endif
    u_xlat12 = (u_xlatb6) ? abs(u_xlat12) : abs(u_xlat2.x);
    u_xlat12 = u_xlat12 * 10.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat8 = u_xlat8 * 0.00999999978;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + u_xlat1.xy;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixInvV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[3].xyz * u_xlat1.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat12 = (-u_xlat1.w) + (-_OutlineZOffset);
    u_xlat2.x = u_xlat12 * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat12 = u_xlat2.x / (-u_xlat12);
    u_xlat2.x = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat9 = u_xlat1.z + u_xlat2.x;
    gl_Position.xyw = u_xlat1.xyw;
    gl_Position.z = (u_xlatb6) ? u_xlat12 : u_xlat9;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD3.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
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
uniform 	vec4 _outlineNoiseMap_ST;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _use_Outline_UV2;
uniform 	mediump float _outlineAlphaThreshold;
uniform 	mediump float _outlineAlphaWidth;
uniform 	mediump float _outlineClip;
UNITY_LOCATION(0) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
    u_xlat9 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = u_xlat0.x + (-_outlineAlphaThreshold);
    u_xlat16_2 = u_xlat16_2 / _outlineAlphaWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_use_Outline_UV2<0.5);
#else
    u_xlatb0 = _use_Outline_UV2<0.5;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat0.xy = u_xlat0.xy * _outlineNoiseMap_ST.xy + _outlineNoiseMap_ST.zw;
    u_xlat16_0.x = texture(_outlineNoiseMap, u_xlat0.xy).x;
    u_xlat16_5 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_5 = u_xlat16_2 * u_xlat16_5 + u_xlat16_0.x;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 + (-_outlineClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5<0.0);
#else
    u_xlatb0 = u_xlat16_5<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.w = u_xlat16_2 * _outlineColor.w;
    u_xlat16_0.xyz = _outlineColor.xyz;
    SV_Target0 = u_xlat16_0;
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
uniform 	mediump float _outlineWidth;
uniform 	mediump float _OutlineZOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb6;
float u_xlat8;
float u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.yyy;
    u_xlat1.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.z = 0.00999999978;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat8 = in_COLOR0.w * _outlineWidth;
    u_xlat12 = textureLod(_outlineNoiseMap, in_TEXCOORD0.xy, 0.0).y;
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixV[3];
    u_xlat12 = u_xlat1.z / hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat2.x = float(1.0) / hlslcc_mtx4x4glstate_matrix_projection[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb6 = unity_OrthoParams.w==0.0;
#endif
    u_xlat12 = (u_xlatb6) ? abs(u_xlat12) : abs(u_xlat2.x);
    u_xlat12 = u_xlat12 * 10.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat8 = u_xlat8 * 0.00999999978;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + u_xlat1.xy;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixInvV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[3].xyz * u_xlat1.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat12 = (-u_xlat1.w) + (-_OutlineZOffset);
    u_xlat2.x = u_xlat12 * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat12 = u_xlat2.x / (-u_xlat12);
    u_xlat2.x = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat9 = u_xlat1.z + u_xlat2.x;
    gl_Position.xyw = u_xlat1.xyw;
    gl_Position.z = (u_xlatb6) ? u_xlat12 : u_xlat9;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD3.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
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
uniform 	vec4 _outlineNoiseMap_ST;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _use_Outline_UV2;
uniform 	mediump float _outlineAlphaThreshold;
uniform 	mediump float _outlineAlphaWidth;
uniform 	mediump float _outlineClip;
UNITY_LOCATION(0) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 vs_TEXCOORD0;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_2;
mediump float u_xlat16_5;
float u_xlat9;
void main()
{
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
    u_xlat9 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_2 = u_xlat0.x + (-_outlineAlphaThreshold);
    u_xlat16_2 = u_xlat16_2 / _outlineAlphaWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_use_Outline_UV2<0.5);
#else
    u_xlatb0 = _use_Outline_UV2<0.5;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat0.xy = u_xlat0.xy * _outlineNoiseMap_ST.xy + _outlineNoiseMap_ST.zw;
    u_xlat16_0.x = texture(_outlineNoiseMap, u_xlat0.xy).x;
    u_xlat16_5 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_5 = u_xlat16_2 * u_xlat16_5 + u_xlat16_0.x;
    u_xlat16_2 = u_xlat16_2 * u_xlat16_5;
    u_xlat16_5 = u_xlat16_5 + (-_outlineClip);
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5<0.0);
#else
    u_xlatb0 = u_xlat16_5<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat16_0.w = u_xlat16_2 * _outlineColor.w;
    u_xlat16_0.xyz = _outlineColor.xyz;
    SV_Target0 = u_xlat16_0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_RENDER_QUALITY_LOW" }
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
uniform 	mediump float _outlineWidth;
uniform 	mediump float _OutlineZOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb6;
float u_xlat8;
float u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.yyy;
    u_xlat1.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.z = 0.00999999978;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat8 = in_COLOR0.w * _outlineWidth;
    u_xlat12 = textureLod(_outlineNoiseMap, in_TEXCOORD0.xy, 0.0).y;
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixV[3];
    u_xlat12 = u_xlat1.z / hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat2.x = float(1.0) / hlslcc_mtx4x4glstate_matrix_projection[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb6 = unity_OrthoParams.w==0.0;
#endif
    u_xlat12 = (u_xlatb6) ? abs(u_xlat12) : abs(u_xlat2.x);
    u_xlat12 = u_xlat12 * 10.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat8 = u_xlat8 * 0.00999999978;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + u_xlat1.xy;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixInvV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[3].xyz * u_xlat1.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat12 = (-u_xlat1.w) + (-_OutlineZOffset);
    u_xlat2.x = u_xlat12 * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat12 = u_xlat2.x / (-u_xlat12);
    u_xlat2.x = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat9 = u_xlat1.z + u_xlat2.x;
    gl_Position.xyw = u_xlat1.xyw;
    gl_Position.z = (u_xlatb6) ? u_xlat12 : u_xlat9;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD3.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    if((int(0xFFFFFFFFu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_RENDER_QUALITY_LOW" }
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
uniform 	mediump float _outlineWidth;
uniform 	mediump float _OutlineZOffset;
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
UNITY_LOCATION(0) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD0;
out highp vec3 vs_TEXCOORD2;
out highp vec3 vs_TEXCOORD3;
vec3 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
vec3 u_xlat3;
vec3 u_xlat4;
bool u_xlatb6;
float u_xlat8;
float u_xlat9;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat2.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat12 = u_xlat12 * in_TANGENT0.w;
    u_xlat2.xyz = vec3(u_xlat12) * u_xlat2.xyz;
    u_xlat3.xyz = in_COLOR0.xyz + vec3(-0.5, -0.5, -0.5);
    u_xlat3.xyz = u_xlat3.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat3.yyy;
    u_xlat1.xyz = u_xlat3.xxx * u_xlat1.xyz + u_xlat2.xyz;
    u_xlat0.xyz = u_xlat3.zzz * u_xlat0.xyz + u_xlat1.xyz;
    u_xlat1.xy = u_xlat0.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat0.xx + u_xlat1.xy;
    u_xlat1.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat0.zz + u_xlat1.xy;
    vs_TEXCOORD2.xyz = u_xlat0.xyz;
    u_xlat1.z = 0.00999999978;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xy = u_xlat0.xx * u_xlat1.xy;
    u_xlat8 = in_COLOR0.w * _outlineWidth;
    u_xlat12 = textureLod(_outlineNoiseMap, in_TEXCOORD0.xy, 0.0).y;
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat1.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat1.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4unity_MatrixV[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixV[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixV[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixV[3];
    u_xlat12 = u_xlat1.z / hlslcc_mtx4x4glstate_matrix_projection[1].y;
    u_xlat2.x = float(1.0) / hlslcc_mtx4x4glstate_matrix_projection[1].y;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(unity_OrthoParams.w==0.0);
#else
    u_xlatb6 = unity_OrthoParams.w==0.0;
#endif
    u_xlat12 = (u_xlatb6) ? abs(u_xlat12) : abs(u_xlat2.x);
    u_xlat12 = u_xlat12 * 10.0;
    u_xlat12 = max(u_xlat12, 9.99999975e-05);
    u_xlat12 = sqrt(u_xlat12);
    u_xlat8 = u_xlat12 * u_xlat8;
    u_xlat8 = u_xlat8 * 0.00999999978;
    u_xlat0.xy = u_xlat0.xy * vec2(u_xlat8) + u_xlat1.xy;
    u_xlat4.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_MatrixInvV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[0].xyz * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[2].xyz * u_xlat1.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixInvV[3].xyz * u_xlat1.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat0.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat12 = (-u_xlat1.w) + (-_OutlineZOffset);
    u_xlat2.x = u_xlat12 * hlslcc_mtx4x4glstate_matrix_projection[2].z + hlslcc_mtx4x4glstate_matrix_projection[3].z;
    u_xlat2.x = u_xlat1.w * u_xlat2.x;
    u_xlat12 = u_xlat2.x / (-u_xlat12);
    u_xlat2.x = (-_OutlineZOffset) / _ProjectionParams.z;
    u_xlat9 = u_xlat1.z + u_xlat2.x;
    gl_Position.xyw = u_xlat1.xyw;
    gl_Position.z = (u_xlatb6) ? u_xlat12 : u_xlat9;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD0.zw = in_TEXCOORD1.xy;
    u_xlat1.x = hlslcc_mtx4x4unity_MatrixV[0].z;
    u_xlat1.y = hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat1.z = hlslcc_mtx4x4unity_MatrixV[2].z;
    vs_TEXCOORD3.xyz = (bool(u_xlatb6)) ? u_xlat0.xyz : u_xlat1.xyz;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out highp vec4 SV_Target0;
void main()
{
    if((int(0xFFFFFFFFu))!=0){discard;}
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
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
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "_RENDER_QUALITY_LOW" }
""
}
}
}
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Geometry" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 77986
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
ivec3 u_xlati5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
int u_xlati17;
float u_xlat22;
float u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_46;
float u_xlat51;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
float u_xlat57;
float u_xlat58;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_17.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat17.xy = u_xlat16_17.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat17.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat17.xy = u_xlat17.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat17.xy = (-u_xlat17.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_17.xyz = texture(_albedoMap, u_xlat17.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_17.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_17.zxy * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_54) + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat51;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat56 = (-u_xlat16_54) * u_xlat51 + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat56);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_54) + u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_54 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_54) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_4.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat51 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat8.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_53) * u_xlat5.xyz;
    u_xlat56 = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat56;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_54 = (-u_xlat56) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = log2(u_xlat16_54);
    u_xlat16_54 = u_xlat16_54 * _customMatcapFresnelStrPow;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_54 = u_xlat16_54 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_54) * _stockingFresnelCol.zxy;
    u_xlat16_54 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_54 = max(u_xlat16_54, 0.0078125);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_54 = max(u_xlat16_54, 0.0078125);
    u_xlat56 = (-u_xlat10.x) * u_xlat16_54 + u_xlat10.x;
    u_xlat56 = u_xlat10.x * u_xlat56 + u_xlat16_54;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat10.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat57 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat57) * u_xlat16_54 + u_xlat57;
    u_xlat58 = u_xlat57 * u_xlat58 + u_xlat16_54;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat57 + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat56 * u_xlat58;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat23 = u_xlat16_54 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_54 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat6.x = u_xlat58 * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat7.xyz;
    u_xlat16_55 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_13.xy = vec2(u_xlat16_55) * vs_TEXCOORD5.xy;
    u_xlat16_14.y = u_xlat16_13.y * _matCapSpeEffectedByLightDir;
    u_xlat16_13.z = 0.100000001;
    u_xlat16_14.x = _matCapSpeEffectedByLightDir;
    u_xlat6.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xz;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xz;
    u_xlat16_30.xz = u_xlat6.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.xy = (-u_xlat16_13.xz) * u_xlat16_14.xy + u_xlat16_30.xz;
    u_xlat16_11.xyz = texture(_MatcapTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_11.zxy * _customMatcapCol.zxy;
    u_xlat16_13.xyz = vec3(u_xlat57) * u_xlat16_13.xyz;
    u_xlat16_55 = u_xlat57 + (-_toonLambertThreshold);
    u_xlat16_55 = u_xlat16_55 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat7.xyz) * _MainLightIntensityAndAngleScale.zxy + u_xlat16_12.xyz;
    u_xlat6.xzw = u_xlat7.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_12.xyz = vec3(u_xlat16_7) * u_xlat16_12.xyz + u_xlat6.xzw;
    u_xlat6.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_13.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_14.xyz = u_xlat6.xzw * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_13.x * u_xlat16_30.x;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_13.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_13.x);
    u_xlat16_13.xzw = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.yyy + u_xlat16_13.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_14.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_14.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_64;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat6.xzw = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_13.xyz;
    u_xlat7.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat7.xxx;
    u_xlat16_63 = dot(u_xlat16_13.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_54 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat40 = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat57 * u_xlat57;
    u_xlat16_63 = u_xlat57 * u_xlat16_63;
    u_xlat16_63 = u_xlat57 * u_xlat16_63;
    u_xlat16_13.x = u_xlat57 * u_xlat16_63;
    u_xlat57 = (-u_xlat16_63) * u_xlat57 + 1.0;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat57);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_13.xxx + u_xlat7.xyz;
    u_xlat57 = (-u_xlat40) * u_xlat16_54 + u_xlat40;
    u_xlat57 = u_xlat40 * u_xlat57 + u_xlat16_54;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat40;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat56 * u_xlat57;
    u_xlat6.w = float(1.0) / u_xlat57;
    u_xlat6.xw = min(u_xlat6.xw, vec2(16.0, 16.0));
    u_xlat6.x = u_xlat6.w * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_14.xyz * u_xlat7.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat16_12.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_63 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_13.x = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xxx;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat16_15.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_13.xyz;
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat16_53 = dot(u_xlat16_13.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat23 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_54 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat22 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat22;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat39 = (-u_xlat16_53) * u_xlat22 + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat39);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_53) + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat22 = (-u_xlat0.x) * u_xlat16_54 + u_xlat0.x;
    u_xlat22 = u_xlat0.x * u_xlat22 + u_xlat16_54;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat0.x + u_xlat22;
    u_xlat22 = u_xlat22 + 6.10351563e-05;
    u_xlat22 = u_xlat22 * u_xlat56;
    u_xlat5.y = float(1.0) / u_xlat22;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat5.xyz = u_xlat7.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_13.x;
    u_xlat16_63 = max(u_xlat16_15.x, u_xlat16_63);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_13.x);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
    u_xlat16_13.xyz = vec3(u_xlat16_53) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat6.www + u_xlat16_12.xyz;
    u_xlat16_53 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.www * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat6.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat40) * u_xlat16_14.xyz;
    u_xlat16_53 = u_xlat16_55 * -2.0 + 3.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_55;
    u_xlat16_15.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz + _toonLambertColor.zxy;
    u_xlat16_15.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat8.xyz) * vec3(u_xlat51) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_53) + u_xlat16_55;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_63 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_53;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat17.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat17.xxx + (-u_xlat16_16.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat17.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_14.y = u_xlat16_15.y;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlati17 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati17].xyz;
    u_xlati17 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_14.xyw;
    u_xlat16_16.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_12.xxx + (-u_xlat16_4.xyz);
    u_xlat16_1.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_29.x = u_xlat16_12.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_4.x = u_xlat16_29.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_29.x = u_xlat16_56 + (-u_xlat16_6.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_29.x + u_xlat16_6.x;
    u_xlat16_12.x = u_xlat16_63 * u_xlat16_12.x;
    u_xlat17.x = u_xlat17.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat0.x * 0.5;
    u_xlat16_29.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_12.x = u_xlat17.x * u_xlat16_29.x + u_xlat16_12.x;
    u_xlat16_29.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_46 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_46 + u_xlat16_29.x;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_0.z, u_xlat16_12.x);
    u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat51) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_54) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_54 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_54);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_29.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_29.xyz;
    u_xlat16_3.xyz = u_xlat16_12.xxx * u_xlat16_3.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + u_xlat16_2.xyz;
    u_xlat16_53 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * _MendsLightDirection2.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_3.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_3.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_53 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_12.xyz = vec3(u_xlat16_53) * _MendsLightDirection.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = float(1.0) / _MendsLightFallOff;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_12.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_3.xyz = u_xlat16_12.xyz * vec3(u_xlat16_53) + u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_5.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat16_3.xyz * _emissiveColor.www + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_17.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
ivec3 u_xlati5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
int u_xlati17;
float u_xlat22;
float u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_46;
float u_xlat51;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
float u_xlat57;
float u_xlat58;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_17.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat17.xy = u_xlat16_17.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat17.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat17.xy = u_xlat17.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat17.xy = (-u_xlat17.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_17.xyz = texture(_albedoMap, u_xlat17.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_17.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_17.zxy * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_54) + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat51;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat56 = (-u_xlat16_54) * u_xlat51 + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat56);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_54) + u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_54 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_54) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_4.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat51 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat8.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_53) * u_xlat5.xyz;
    u_xlat56 = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat56;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_54 = (-u_xlat56) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = log2(u_xlat16_54);
    u_xlat16_54 = u_xlat16_54 * _customMatcapFresnelStrPow;
    u_xlat16_54 = exp2(u_xlat16_54);
    u_xlat16_54 = u_xlat16_54 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_54) * _stockingFresnelCol.zxy;
    u_xlat16_54 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_54 = max(u_xlat16_54, 0.0078125);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_54 = max(u_xlat16_54, 0.0078125);
    u_xlat56 = (-u_xlat10.x) * u_xlat16_54 + u_xlat10.x;
    u_xlat56 = u_xlat10.x * u_xlat56 + u_xlat16_54;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat10.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat57 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat57) * u_xlat16_54 + u_xlat57;
    u_xlat58 = u_xlat57 * u_xlat58 + u_xlat16_54;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat57 + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat56 * u_xlat58;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat23 = u_xlat16_54 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_54 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat6.x = u_xlat58 * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat7.xyz;
    u_xlat16_55 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_55 = inversesqrt(u_xlat16_55);
    u_xlat16_13.xy = vec2(u_xlat16_55) * vs_TEXCOORD5.xy;
    u_xlat16_14.y = u_xlat16_13.y * _matCapSpeEffectedByLightDir;
    u_xlat16_13.z = 0.100000001;
    u_xlat16_14.x = _matCapSpeEffectedByLightDir;
    u_xlat6.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xz;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xz;
    u_xlat16_30.xz = u_xlat6.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.xy = (-u_xlat16_13.xz) * u_xlat16_14.xy + u_xlat16_30.xz;
    u_xlat16_11.xyz = texture(_MatcapTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_11.zxy * _customMatcapCol.zxy;
    u_xlat16_13.xyz = vec3(u_xlat57) * u_xlat16_13.xyz;
    u_xlat16_55 = u_xlat57 + (-_toonLambertThreshold);
    u_xlat16_55 = u_xlat16_55 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat7.xyz) * _MainLightIntensityAndAngleScale.zxy + u_xlat16_12.xyz;
    u_xlat6.xzw = u_xlat7.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_12.xyz = vec3(u_xlat16_7) * u_xlat16_12.xyz + u_xlat6.xzw;
    u_xlat6.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_63 = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_13.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_30.x = float(1.0) / float(u_xlat16_63);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_14.xyz = u_xlat6.xzw * vec3(u_xlat16_63);
    u_xlat16_63 = u_xlat16_13.x * u_xlat16_30.x;
    u_xlat16_13.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_13.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_13.x);
#endif
    u_xlat16_13.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_13.x);
    u_xlat16_13.xzw = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat16_13.yyy + u_xlat16_13.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_14.x = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_14.x);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_64;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat6.xzw = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_13.xyz;
    u_xlat7.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat7.xxx;
    u_xlat16_63 = dot(u_xlat16_13.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_54 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat40 = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = u_xlat57 * u_xlat57;
    u_xlat16_63 = u_xlat57 * u_xlat16_63;
    u_xlat16_63 = u_xlat57 * u_xlat16_63;
    u_xlat16_13.x = u_xlat57 * u_xlat16_63;
    u_xlat57 = (-u_xlat16_63) * u_xlat57 + 1.0;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat57);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_13.xxx + u_xlat7.xyz;
    u_xlat57 = (-u_xlat40) * u_xlat16_54 + u_xlat40;
    u_xlat57 = u_xlat40 * u_xlat57 + u_xlat16_54;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat40;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat56 * u_xlat57;
    u_xlat6.w = float(1.0) / u_xlat57;
    u_xlat6.xw = min(u_xlat6.xw, vec2(16.0, 16.0));
    u_xlat6.x = u_xlat6.w * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.zxy;
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_14.xyz * u_xlat7.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat16_12.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_63 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_63 = max(u_xlat16_63, 6.10351563e-05);
    u_xlat16_13.x = inversesqrt(u_xlat16_63);
    u_xlat16_13.xyz = u_xlat7.xyz * u_xlat16_13.xxx;
    u_xlat16_64 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_64));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_64);
#endif
    u_xlat16_15.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_13.xyz;
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat16_53 = dot(u_xlat16_13.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat23 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_54 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat22 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat22;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat39 = (-u_xlat16_53) * u_xlat22 + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat39);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_53) + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat22 = (-u_xlat0.x) * u_xlat16_54 + u_xlat0.x;
    u_xlat22 = u_xlat0.x * u_xlat22 + u_xlat16_54;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat0.x + u_xlat22;
    u_xlat22 = u_xlat22 + 6.10351563e-05;
    u_xlat22 = u_xlat22 * u_xlat56;
    u_xlat5.y = float(1.0) / u_xlat22;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat5.xyz = u_xlat7.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.zxy;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_13.x = u_xlat16_63 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_63 = float(1.0) / float(u_xlat16_63);
    u_xlat16_13.x = (-u_xlat16_13.x) * u_xlat16_13.x + 1.0;
    u_xlat16_13.x = max(u_xlat16_13.x, 0.0);
    u_xlat16_13.x = u_xlat16_13.x * u_xlat16_13.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_13.x;
    u_xlat16_63 = max(u_xlat16_15.x, u_xlat16_63);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_13.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_13.x);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
    u_xlat16_13.xyz = vec3(u_xlat16_53) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat6.www + u_xlat16_12.xyz;
    u_xlat16_53 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.www * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat6.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = vec3(u_xlat40) * u_xlat16_14.xyz;
    u_xlat16_53 = u_xlat16_55 * -2.0 + 3.0;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_55;
    u_xlat16_15.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz + _toonLambertColor.zxy;
    u_xlat16_15.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat8.xyz) * vec3(u_xlat51) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_63 = (-u_xlat16_53) + u_xlat16_55;
    u_xlat16_64 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_63 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_53;
    u_xlat16_63 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 + -1.0;
    u_xlat16_63 = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat17.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat17.xxx + (-u_xlat16_16.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat17.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.zxy;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_14.y = u_xlat16_15.y;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_16.xyz;
    u_xlati17 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati17].xyz;
    u_xlati17 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_14.xyw;
    u_xlat16_16.xyz = u_xlat16_14.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_12.xxx + (-u_xlat16_4.xyz);
    u_xlat16_1.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_29.x = u_xlat16_12.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_4.x = u_xlat16_29.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_29.x = u_xlat16_56 + (-u_xlat16_6.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_29.x + u_xlat16_6.x;
    u_xlat16_12.x = u_xlat16_63 * u_xlat16_12.x;
    u_xlat17.x = u_xlat17.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat0.x * 0.5;
    u_xlat16_29.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_12.x = u_xlat17.x * u_xlat16_29.x + u_xlat16_12.x;
    u_xlat16_29.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_46 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_46 + u_xlat16_29.x;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_0.z, u_xlat16_12.x);
    u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat51) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_54) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_54 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_54);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_53) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_29.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_29.xyz;
    u_xlat16_3.xyz = u_xlat16_12.xxx * u_xlat16_3.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + u_xlat16_2.xyz;
    u_xlat16_53 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_3.xyz = vec3(u_xlat16_53) * _MendsLightDirection2.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_3.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_3.x;
    u_xlat16_3.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_3.xyz = vec3(u_xlat16_53) * u_xlat16_3.xyz;
    u_xlat16_53 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_12.xyz = vec3(u_xlat16_53) * _MendsLightDirection.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = float(1.0) / _MendsLightFallOff;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_12.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_3.xyz = u_xlat16_12.xyz * vec3(u_xlat16_53) + u_xlat16_3.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_5.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.zxy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _emissiveColor.zxy;
    u_xlat0.xyz = u_xlat16_3.xyz * _emissiveColor.www + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_17.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(14) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
ivec4 u_xlati0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
mediump vec3 u_xlat16_20;
vec3 u_xlat22;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_32;
mediump vec2 u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
vec2 u_xlat39;
float u_xlat54;
float u_xlat55;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=0.99000001);
#else
    u_xlatb18 = u_xlat18.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_24.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_10.xy = u_xlat16_24.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat18.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat18.xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat18.xy;
    u_xlat16_24.xy = u_xlat18.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_24.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_24.xy;
    u_xlat16_18.xyz = texture(_MatcapTex, u_xlat16_24.xy).xyz;
    u_xlat16_24.xyz = u_xlat16_18.zxy * _customMatcapCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_24.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat18.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_60 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_60 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_64 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStrPow;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _stockingFresnelCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat37 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat37 * u_xlat37;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_65 = u_xlat37 * u_xlat16_64;
    u_xlat37 = (-u_xlat16_64) * u_xlat37 + 1.0;
    u_xlat55 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat55 = fract(u_xlat55);
    u_xlat16_4.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat39.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyw = texture(_albedoMap, u_xlat4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.wxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.wxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat55 = _inkFlowSpeed * _Time.y;
    u_xlat55 = fract(u_xlat55);
    u_xlat39.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat55 = (-u_xlat55) + 0.5;
    u_xlat55 = u_xlat55 + u_xlat55;
    u_xlat39.xy = u_xlat39.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat39.xy = (-u_xlat39.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_8.xyz = texture(_albedoMap, u_xlat39.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_8.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_8.zxy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.wxy * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat55)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat16_13.xyz;
    u_xlat37 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_65) + u_xlat9.xyz;
    u_xlat16_64 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat55 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat55 = u_xlat18.x * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat18.x + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat56 = (-u_xlat3.x) * u_xlat16_64 + u_xlat3.x;
    u_xlat56 = u_xlat3.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat3.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat39.x = u_xlat16_64 + -1.0;
    u_xlat54 = u_xlat54 * u_xlat39.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_64 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat54 = u_xlat55 * u_xlat54;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_65 = u_xlat18.x + (-_toonLambertThreshold);
    u_xlat16_65 = u_xlat16_65 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = (-u_xlat9.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat16_10.xyz * u_xlat9.xyz;
    u_xlat16_18.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_18.xxx * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_32.xyz = u_xlat9.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_67 * u_xlat16_14.x;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_15.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_32.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_68 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_68);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat9.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat55 * u_xlat55;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_67 = u_xlat55 * u_xlat16_66;
    u_xlat55 = (-u_xlat16_66) * u_xlat55 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat55);
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_67) + u_xlat9.xyz;
    u_xlat55 = (-u_xlat54) * u_xlat16_64 + u_xlat54;
    u_xlat55 = u_xlat54 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat54 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_15.xyz * u_xlat9.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat9.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_16.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat55 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat55;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.x = (-u_xlat16_60) * u_xlat55 + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.xyz = u_xlat16_13.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat37) * vec3(u_xlat16_60) + u_xlat2.xyz;
    u_xlat37 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat55 = (-u_xlat37) * u_xlat16_64 + u_xlat37;
    u_xlat55 = u_xlat37 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat37;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat37) * u_xlat2.xyz;
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_66 = max(u_xlat16_16.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_67);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat1.yyy + u_xlat16_6.xyz;
    u_xlat16_60 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_60 = u_xlat16_65 * -2.0 + 3.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_16.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.zxy;
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat54) * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * vec3(u_xlat37) + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_15.y = u_xlat16_14.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_11.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_64) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_64 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_36.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_36.xxx + u_xlat16_36.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb36 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb36)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_60 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.z * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_20.x) + u_xlat16_2;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_20.x;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat2.x = u_xlat0.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat2.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28 + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_4.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_60 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * _MendsLightDirection2.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
    u_xlat16_10.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_60 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_12.xyz = vec3(u_xlat16_60) * _MendsLightDirection.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = float(1.0) / _MendsLightFallOff;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_12.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat16_2 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat2.xyz = vec3(u_xlat16_2) * u_xlat16_10.xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_3.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_3.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.zxy;
    u_xlat2.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat2.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat56 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat56);
    u_xlat0.x = u_xlat56 * 0.0625 + u_xlat0.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(13) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(14) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
ivec4 u_xlati0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump float u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
mediump vec3 u_xlat16_20;
vec3 u_xlat22;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_32;
mediump vec2 u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
vec2 u_xlat39;
float u_xlat54;
float u_xlat55;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=0.99000001);
#else
    u_xlatb18 = u_xlat18.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_24.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_10.xy = u_xlat16_24.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat18.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat18.xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat18.xy;
    u_xlat16_24.xy = u_xlat18.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_24.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_24.xy;
    u_xlat16_18.xyz = texture(_MatcapTex, u_xlat16_24.xy).xyz;
    u_xlat16_24.xyz = u_xlat16_18.zxy * _customMatcapCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_24.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat18.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_60 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_60 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_64 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStrPow;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _stockingFresnelCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat37 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat37 * u_xlat37;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_65 = u_xlat37 * u_xlat16_64;
    u_xlat37 = (-u_xlat16_64) * u_xlat37 + 1.0;
    u_xlat55 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat55 = fract(u_xlat55);
    u_xlat16_4.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat39.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyw = texture(_albedoMap, u_xlat4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.wxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.wxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat55 = _inkFlowSpeed * _Time.y;
    u_xlat55 = fract(u_xlat55);
    u_xlat39.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat55 = (-u_xlat55) + 0.5;
    u_xlat55 = u_xlat55 + u_xlat55;
    u_xlat39.xy = u_xlat39.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat39.xy = (-u_xlat39.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_8.xyz = texture(_albedoMap, u_xlat39.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_8.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_8.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_8.zxy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.wxy * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat55)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat16_13.xyz;
    u_xlat37 = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_65) + u_xlat9.xyz;
    u_xlat16_64 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat55 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat55 = u_xlat18.x * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat18.x + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat56 = (-u_xlat3.x) * u_xlat16_64 + u_xlat3.x;
    u_xlat56 = u_xlat3.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat3.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat39.x = u_xlat16_64 + -1.0;
    u_xlat54 = u_xlat54 * u_xlat39.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_64 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat54 = u_xlat55 * u_xlat54;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_65 = u_xlat18.x + (-_toonLambertThreshold);
    u_xlat16_65 = u_xlat16_65 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = (-u_xlat9.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat16_10.xyz * u_xlat9.xyz;
    u_xlat16_18.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_18.xxx * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_32.xyz = u_xlat9.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_67 * u_xlat16_14.x;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_15.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_32.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_68 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_68);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat9.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat55 * u_xlat55;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_67 = u_xlat55 * u_xlat16_66;
    u_xlat55 = (-u_xlat16_66) * u_xlat55 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat55);
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_67) + u_xlat9.xyz;
    u_xlat55 = (-u_xlat54) * u_xlat16_64 + u_xlat54;
    u_xlat55 = u_xlat54 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat54 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_15.xyz * u_xlat9.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat9.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_16.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat55 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat55;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.x = (-u_xlat16_60) * u_xlat55 + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.xyz = u_xlat16_13.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat37) * vec3(u_xlat16_60) + u_xlat2.xyz;
    u_xlat37 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat55 = (-u_xlat37) * u_xlat16_64 + u_xlat37;
    u_xlat55 = u_xlat37 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat37;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat37) * u_xlat2.xyz;
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_66 = max(u_xlat16_16.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_67);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat1.yyy + u_xlat16_6.xyz;
    u_xlat16_60 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_60 = u_xlat16_65 * -2.0 + 3.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_16.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.zxy;
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat54) * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * vec3(u_xlat37) + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_15.y = u_xlat16_14.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_11.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_64) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_64 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_36.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_36.xxx + u_xlat16_36.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.zxy;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb36 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb36)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_2 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_60 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_20.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.z * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_20.x) + u_xlat16_2;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_20.x;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat2.x = u_xlat0.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat2.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28 + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_4.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_60 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * _MendsLightDirection2.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
    u_xlat16_10.xyz = _MendsLightColor2.www * _MendsLightColor2.zxy;
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_60 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_12.xyz = vec3(u_xlat16_60) * _MendsLightDirection.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = float(1.0) / _MendsLightFallOff;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_12.xyz = _MendsLightColor.www * _MendsLightColor.zxy;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat16_2 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat2.xyz = vec3(u_xlat16_2) * u_xlat16_10.xyz;
    u_xlat16_3.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_3.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_3.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.zxy;
    u_xlat2.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat2.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat2.xyz = max(u_xlat2.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat2.xyz = log2(u_xlat2.xyz);
    u_xlat2.xyz = u_xlat2.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat2.xz * vec2(15.0, 0.9375);
    u_xlat56 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat2.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat2.x = u_xlat2.x * 15.0 + (-u_xlat56);
    u_xlat0.x = u_xlat56 * 0.0625 + u_xlat0.y;
    u_xlat16_20.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat3.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat3.xy, 0.0).xyz;
    u_xlat3.xyz = (-u_xlat16_20.xyz) + u_xlat16_3.xyz;
    u_xlat2.xyz = u_xlat2.xxx * u_xlat3.xyz + u_xlat16_20.xyz;
    SV_Target0.xyz = u_xlat2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
ivec3 u_xlati5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
int u_xlati17;
float u_xlat22;
float u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
float u_xlat51;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
float u_xlat57;
float u_xlat58;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_17.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat17.xy = u_xlat16_17.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat17.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat17.xy = u_xlat17.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat17.xy = (-u_xlat17.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_17.xyz = texture(_albedoMap, u_xlat17.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_54) + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat51;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat56 = (-u_xlat16_54) * u_xlat51 + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat56);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_54) + u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_54 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_54) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_4.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat51 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat8.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_53) * u_xlat5.xyz;
    u_xlat56 = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat56;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_54 = (-u_xlat56) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = log2(u_xlat16_54);
    u_xlat16_55 = u_xlat16_54 * _customMatcapFresnelStrPow;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_55) * _stockingFresnelCol.xyz;
    u_xlat16_55 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_63 = max(u_xlat16_55, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat56 = (-u_xlat10.x) * u_xlat16_63 + u_xlat10.x;
    u_xlat56 = u_xlat10.x * u_xlat56 + u_xlat16_63;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat10.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat57 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat57) * u_xlat16_63 + u_xlat57;
    u_xlat58 = u_xlat57 * u_xlat58 + u_xlat16_63;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat57 + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat56 * u_xlat58;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat23 = u_xlat16_63 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_63 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat6.x = u_xlat58 * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat7.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xy = u_xlat16_13.xx * vs_TEXCOORD5.xy;
    u_xlat16_14.y = u_xlat16_13.y * _matCapSpeEffectedByLightDir;
    u_xlat16_13.z = 0.100000001;
    u_xlat16_14.x = _matCapSpeEffectedByLightDir;
    u_xlat6.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xz;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xz;
    u_xlat16_30.xz = u_xlat6.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.xy = (-u_xlat16_13.xz) * u_xlat16_14.xy + u_xlat16_30.xz;
    u_xlat16_11.xyz = texture(_MatcapTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * _customMatcapCol.xyz;
    u_xlat16_13.xyz = vec3(u_xlat57) * u_xlat16_13.xyz;
    u_xlat16_64 = u_xlat57 + (-_toonLambertThreshold);
    u_xlat16_64 = u_xlat16_64 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat7.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat6.xzw = u_xlat7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_12.xyz = vec3(u_xlat16_7) * u_xlat16_12.xyz + u_xlat6.xzw;
    u_xlat6.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_13.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_13.x = max(u_xlat16_13.x, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_13.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_47 = float(1.0) / float(u_xlat16_13.x);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_14.xyz = u_xlat6.xzw * u_xlat16_13.xxx;
    u_xlat16_13.x = u_xlat16_30.x * u_xlat16_47;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat16_30.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = max(u_xlat16_30.x, u_xlat16_13.x);
    u_xlat16_15.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_30.yyy + u_xlat16_15.xyz;
    u_xlat16_30.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_47 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_30.x = max(u_xlat16_47, u_xlat16_30.x);
    u_xlat16_13.x = u_xlat16_30.x * u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat16_13.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat6.xzw = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_14.xyz;
    u_xlat7.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat7.xxx;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_63 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat40 = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_65) + 1.0;
    u_xlat16_14.x = u_xlat57 * u_xlat57;
    u_xlat16_14.x = u_xlat57 * u_xlat16_14.x;
    u_xlat16_14.x = u_xlat57 * u_xlat16_14.x;
    u_xlat16_31.x = u_xlat57 * u_xlat16_14.x;
    u_xlat57 = (-u_xlat16_14.x) * u_xlat57 + 1.0;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat57);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_31.xxx + u_xlat7.xyz;
    u_xlat57 = (-u_xlat40) * u_xlat16_63 + u_xlat40;
    u_xlat57 = u_xlat40 * u_xlat57 + u_xlat16_63;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat40;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat56 * u_xlat57;
    u_xlat6.w = float(1.0) / u_xlat57;
    u_xlat6.xw = min(u_xlat6.xw, vec2(16.0, 16.0));
    u_xlat6.x = u_xlat6.w * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_13.xyz * u_xlat7.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat16_12.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_31.xyz = u_xlat7.xyz * u_xlat16_31.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_31.xyz;
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat16_53 = dot(u_xlat16_31.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat23 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_63 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat22 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat22;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat39 = (-u_xlat16_53) * u_xlat22 + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat39);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_53) + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_31.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat22 = (-u_xlat0.x) * u_xlat16_63 + u_xlat0.x;
    u_xlat22 = u_xlat0.x * u_xlat22 + u_xlat16_63;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat0.x + u_xlat22;
    u_xlat22 = u_xlat22 + 6.10351563e-05;
    u_xlat22 = u_xlat22 * u_xlat56;
    u_xlat5.y = float(1.0) / u_xlat22;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat5.xyz = u_xlat7.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_31.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_14.x = u_xlat16_31.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_15.x, u_xlat16_14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_31.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_31.x);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_53) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat6.www + u_xlat16_12.xyz;
    u_xlat16_53 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat6.www * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat40) * u_xlat16_13.xyz;
    u_xlat16_53 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_64;
    u_xlat16_15.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz + _toonLambertColor.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat8.xyz) * vec3(u_xlat51) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_64 = (-u_xlat16_53) + u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_64 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_53;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_64;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat17.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat17.xxx + (-u_xlat16_16.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat17.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_14.y = u_xlat16_15.y;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_16.xyz;
    u_xlati17 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati17].xyz;
    u_xlati17 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_14.xyw;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_12.xxx + (-u_xlat16_4.xyz);
    u_xlat16_1.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_29.x = u_xlat16_12.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_4.x = u_xlat16_29.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_29.x = u_xlat16_56 + (-u_xlat16_6.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_29.x + u_xlat16_6.x;
    u_xlat16_12.x = u_xlat16_64 * u_xlat16_12.x;
    u_xlat17.x = u_xlat17.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat0.x * 0.5;
    u_xlat16_29.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_12.x = u_xlat17.x * u_xlat16_29.x + u_xlat16_12.x;
    u_xlat16_29.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_46 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_46 + u_xlat16_29.x;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_0.z, u_xlat16_12.x);
    u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat51) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_29.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_29.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_53 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_12.xyz = vec3(u_xlat16_53) * _MendsLightDirection2.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_12.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_12.x;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_53) * u_xlat16_12.xyz;
    u_xlat16_53 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * _MendsLightDirection.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_63 = float(1.0) / _MendsLightFallOff;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
    u_xlat16_14.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * vec3(u_xlat16_53) + u_xlat16_12.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_12.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * _emissiveColor.www + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec4 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
ivec3 u_xlati5;
vec4 u_xlat6;
mediump vec4 u_xlat16_6;
bool u_xlatb6;
vec3 u_xlat7;
mediump float u_xlat16_7;
bool u_xlatb7;
vec3 u_xlat8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec4 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
int u_xlati17;
float u_xlat22;
float u_xlat23;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat39;
float u_xlat40;
mediump float u_xlat16_46;
mediump float u_xlat16_47;
float u_xlat51;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat56;
mediump float u_xlat16_56;
bool u_xlatb56;
float u_xlat57;
float u_xlat58;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_17.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat17.xy = u_xlat16_17.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat17.xy = u_xlat0.xx * u_xlat17.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat17.xy = u_xlat17.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat17.xy = (-u_xlat17.xy) * u_xlat16_17.zz + vs_TEXCOORD3.xy;
    u_xlat16_17.xyz = texture(_albedoMap, u_xlat17.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_17.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_17.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat51 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat6.xyz = vec3(u_xlat51) * u_xlat6.xyz;
    u_xlat16_54 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat51 = (-u_xlat16_54) + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat51;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat56 = (-u_xlat16_54) * u_xlat51 + 1.0;
    u_xlat16_54 = u_xlat51 * u_xlat16_54;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat56);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_54) + u_xlat7.xyz;
    u_xlat8.z = vs_TEXCOORD1.x;
    u_xlat16_54 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_4.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_54) + vs_TEXCOORD2.yzx;
    u_xlat51 = dot(u_xlat16_4.xyz, u_xlat16_4.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat16_4.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat8.y = u_xlat10.x;
    u_xlat8.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat8.x = dot(u_xlat16_4.xyz, u_xlat8.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat8.y = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat8.z = dot(u_xlat16_4.xyz, u_xlat10.xyz);
    u_xlat51 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat51 = max(u_xlat51, 1.17549435e-38);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat9.xyz = vec3(u_xlat51) * u_xlat8.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_53) * u_xlat5.xyz;
    u_xlat56 = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat56;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_54 = (-u_xlat56) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = log2(u_xlat16_54);
    u_xlat16_55 = u_xlat16_54 * _customMatcapFresnelStrPow;
    u_xlat16_55 = exp2(u_xlat16_55);
    u_xlat16_55 = u_xlat16_55 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_55) * _stockingFresnelCol.xyz;
    u_xlat16_55 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_63 = max(u_xlat16_55, 0.0078125);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat56 = (-u_xlat10.x) * u_xlat16_63 + u_xlat10.x;
    u_xlat56 = u_xlat10.x * u_xlat56 + u_xlat16_63;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat10.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat57 = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat58 = (-u_xlat57) * u_xlat16_63 + u_xlat57;
    u_xlat58 = u_xlat57 * u_xlat58 + u_xlat16_63;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat57 + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat56 * u_xlat58;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat23 = u_xlat16_63 + -1.0;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_63 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat6.x = min(u_xlat6.x, 16.0);
    u_xlat6.x = u_xlat58 * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat57) * u_xlat7.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xy = u_xlat16_13.xx * vs_TEXCOORD5.xy;
    u_xlat16_14.y = u_xlat16_13.y * _matCapSpeEffectedByLightDir;
    u_xlat16_13.z = 0.100000001;
    u_xlat16_14.x = _matCapSpeEffectedByLightDir;
    u_xlat6.xz = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xz;
    u_xlat6.xz = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xz;
    u_xlat16_30.xz = u_xlat6.xz * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_13.xy = (-u_xlat16_13.xz) * u_xlat16_14.xy + u_xlat16_30.xz;
    u_xlat16_11.xyz = texture(_MatcapTex, u_xlat16_13.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * _customMatcapCol.xyz;
    u_xlat16_13.xyz = vec3(u_xlat57) * u_xlat16_13.xyz;
    u_xlat16_64 = u_xlat57 + (-_toonLambertThreshold);
    u_xlat16_64 = u_xlat16_64 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-u_xlat7.xyz) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat6.xzw = u_xlat7.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_12.xyz = vec3(u_xlat16_7) * u_xlat16_12.xyz + u_xlat6.xzw;
    u_xlat6.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_13.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat16_13.x = max(u_xlat16_13.x, 6.10351563e-05);
    u_xlat16_30.x = u_xlat16_13.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_30.x = (-u_xlat16_30.x) * u_xlat16_30.x + 1.0;
    u_xlat16_30.x = max(u_xlat16_30.x, 0.0);
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
    u_xlat16_47 = float(1.0) / float(u_xlat16_13.x);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_14.xyz = u_xlat6.xzw * u_xlat16_13.xxx;
    u_xlat16_13.x = u_xlat16_30.x * u_xlat16_47;
    u_xlat16_30.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.00100000005>=abs(u_xlat16_30.x));
#else
    u_xlatb6 = 0.00100000005>=abs(u_xlat16_30.x);
#endif
    u_xlat16_30.xy = (bool(u_xlatb6)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_13.x = max(u_xlat16_30.x, u_xlat16_13.x);
    u_xlat16_15.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_30.yyy + u_xlat16_15.xyz;
    u_xlat16_30.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_30.x = u_xlat16_30.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_30.x = min(max(u_xlat16_30.x, 0.0), 1.0);
#else
    u_xlat16_30.x = clamp(u_xlat16_30.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_30.x * u_xlat16_30.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb6 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_47 = (u_xlatb6) ? 1.0 : 0.0;
    u_xlat16_30.x = max(u_xlat16_47, u_xlat16_30.x);
    u_xlat16_13.x = u_xlat16_30.x * u_xlat16_13.x;
    u_xlat16_13.xyz = u_xlat16_13.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat6.xzw = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_14.xyz;
    u_xlat7.x = dot(u_xlat6.xzw, u_xlat6.xzw);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat6.xzw = u_xlat6.xzw * u_xlat7.xxx;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat6.x = dot(u_xlat9.xyz, u_xlat6.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat6.x * u_xlat23 + 1.0;
    u_xlat6.x = u_xlat6.x * u_xlat6.x;
    u_xlat6.x = u_xlat16_63 / u_xlat6.x;
    u_xlat6.x = u_xlat6.x * 0.318309873;
    u_xlat40 = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_65) + 1.0;
    u_xlat16_14.x = u_xlat57 * u_xlat57;
    u_xlat16_14.x = u_xlat57 * u_xlat16_14.x;
    u_xlat16_14.x = u_xlat57 * u_xlat16_14.x;
    u_xlat16_31.x = u_xlat57 * u_xlat16_14.x;
    u_xlat57 = (-u_xlat16_14.x) * u_xlat57 + 1.0;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat57);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_31.xxx + u_xlat7.xyz;
    u_xlat57 = (-u_xlat40) * u_xlat16_63 + u_xlat40;
    u_xlat57 = u_xlat40 * u_xlat57 + u_xlat16_63;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat57 = u_xlat57 + u_xlat40;
    u_xlat57 = u_xlat57 + 6.10351563e-05;
    u_xlat57 = u_xlat56 * u_xlat57;
    u_xlat6.w = float(1.0) / u_xlat57;
    u_xlat6.xw = min(u_xlat6.xw, vec2(16.0, 16.0));
    u_xlat6.x = u_xlat6.w * u_xlat6.x;
    u_xlat7.xyz = u_xlat7.xyz * u_xlat6.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat7.xyz = min(max(u_xlat7.xyz, 0.0), 1.0);
#else
    u_xlat7.xyz = clamp(u_xlat7.xyz, 0.0, 1.0);
#endif
    u_xlat7.xyz = u_xlat7.xyz * _directSpecularColor.xyz;
    u_xlat7.xyz = vec3(u_xlat40) * u_xlat7.xyz;
    u_xlat7.xyz = u_xlat16_13.xyz * u_xlat7.xyz;
    u_xlat16_6.xw = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat6.xw = u_xlat16_6.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat6.xw = min(max(u_xlat6.xw, 0.0), 1.0);
#else
    u_xlat6.xw = clamp(u_xlat6.xw, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat7.xyz * u_xlat6.xxx + u_xlat16_12.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_14.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_14.x = max(u_xlat16_14.x, 6.10351563e-05);
    u_xlat16_31.x = inversesqrt(u_xlat16_14.x);
    u_xlat16_31.xyz = u_xlat7.xyz * u_xlat16_31.xxx;
    u_xlat16_15.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb7 = !!(0.00100000005>=abs(u_xlat16_15.x));
#else
    u_xlatb7 = 0.00100000005>=abs(u_xlat16_15.x);
#endif
    u_xlat16_15.xy = (bool(u_xlatb7)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_31.xyz = u_xlat16_31.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat5.xyz = u_xlat5.xyz * vec3(u_xlat16_53) + u_xlat16_31.xyz;
    u_xlat7.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat7.x = inversesqrt(u_xlat7.x);
    u_xlat5.xyz = u_xlat5.xyz * u_xlat7.xxx;
    u_xlat16_53 = dot(u_xlat16_31.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat5.x = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat5.x * u_xlat23 + 1.0;
    u_xlat5.x = u_xlat5.x * u_xlat5.x;
    u_xlat5.x = u_xlat16_63 / u_xlat5.x;
    u_xlat5.x = u_xlat5.x * 0.318309873;
    u_xlat22 = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat22;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat39 = (-u_xlat16_53) * u_xlat22 + 1.0;
    u_xlat16_53 = u_xlat22 * u_xlat16_53;
    u_xlat7.xyz = u_xlat16_3.xyz * vec3(u_xlat39);
    u_xlat7.xyz = u_xlat0.xxx * vec3(u_xlat16_53) + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_31.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_53 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_31.xyz);
    u_xlat16_53 = u_xlat16_53 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat22 = (-u_xlat0.x) * u_xlat16_63 + u_xlat0.x;
    u_xlat22 = u_xlat0.x * u_xlat22 + u_xlat16_63;
    u_xlat22 = sqrt(u_xlat22);
    u_xlat22 = u_xlat0.x + u_xlat22;
    u_xlat22 = u_xlat22 + 6.10351563e-05;
    u_xlat22 = u_xlat22 * u_xlat56;
    u_xlat5.y = float(1.0) / u_xlat22;
    u_xlat5.xy = min(u_xlat5.xy, vec2(16.0, 16.0));
    u_xlat5.x = u_xlat5.y * u_xlat5.x;
    u_xlat5.xyz = u_xlat7.xyz * u_xlat5.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xyz = min(max(u_xlat5.xyz, 0.0), 1.0);
#else
    u_xlat5.xyz = clamp(u_xlat5.xyz, 0.0, 1.0);
#endif
    u_xlat5.xyz = u_xlat5.xyz * _directSpecularColor.xyz;
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_31.x = u_xlat16_14.x * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_14.x);
    u_xlat16_31.x = (-u_xlat16_31.x) * u_xlat16_31.x + 1.0;
    u_xlat16_31.x = max(u_xlat16_31.x, 0.0);
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_31.x;
    u_xlat16_14.x = u_xlat16_31.x * u_xlat16_14.x;
    u_xlat16_14.x = max(u_xlat16_15.x, u_xlat16_14.x);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_31.x = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_31.x);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_14.x;
    u_xlat16_14.xyz = vec3(u_xlat16_53) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat6.www + u_xlat16_12.xyz;
    u_xlat16_53 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat6.www * u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat6.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat40) * u_xlat16_13.xyz;
    u_xlat16_53 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_64;
    u_xlat16_15.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz + _toonLambertColor.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * u_xlat0.xxx + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = (-u_xlat8.xyz) * vec3(u_xlat51) + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_15.xyz + u_xlat9.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_15.xyz;
    u_xlat16_53 = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_64 = (-u_xlat16_53) + u_xlat16_64;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_64 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_1.w * u_xlat16_53;
    u_xlat16_64 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 + -1.0;
    u_xlat16_64 = _occlusionScale * u_xlat16_64 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_64;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat17.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_16.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat17.xxx * u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat17.xxx + (-u_xlat16_16.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat17.xxx + u_xlat16_14.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_14.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_14.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_14.y = u_xlat16_15.y;
    u_xlat16_16.xyz = u_xlat16_14.xyz * u_xlat16_14.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_14.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_14.xyz = vec3(u_xlat16_64) * u_xlat16_16.xyz;
    u_xlati17 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_16.xyz = u_xlat16_14.yyy * _IrradianceACCoeffs[u_xlati17].xyz;
    u_xlati17 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_14.xyw = u_xlat16_14.xxx * _IrradianceACCoeffs[u_xlati17].xyz + u_xlat16_16.xyz;
    u_xlat16_14.xyz = u_xlat16_14.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_14.xyw;
    u_xlat16_16.xyz = u_xlat16_14.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_14.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_16.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_12.xxx + (-u_xlat16_4.xyz);
    u_xlat16_1.z = dot(u_xlat16_15.xyz, u_xlat5.xyz);
    u_xlat17.x = dot(u_xlat16_15.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_12.x = floor(u_xlat16_4.w);
    u_xlat16_29.x = u_xlat16_12.x + 1.0;
    u_xlat16_29.x = min(u_xlat16_29.x, 15.0);
    u_xlat16_4.x = u_xlat16_29.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_56 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_4.x = u_xlat16_12.x * 16.0 + u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_4.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_6.x = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_12.x = u_xlat16_12.z * 15.0 + (-u_xlat16_12.x);
    u_xlat16_29.x = u_xlat16_56 + (-u_xlat16_6.x);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_29.x + u_xlat16_6.x;
    u_xlat16_12.x = u_xlat16_64 * u_xlat16_12.x;
    u_xlat17.x = u_xlat17.x * u_xlat16_12.x;
    u_xlat16_12.x = u_xlat0.x * 0.5;
    u_xlat16_29.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_12.x = u_xlat17.x * u_xlat16_29.x + u_xlat16_12.x;
    u_xlat16_29.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat16_46 = (-u_xlat16_12.x) * 2.0 + 1.0;
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_46 + u_xlat16_29.x;
    u_xlat16_12.x = u_xlat0.x * u_xlat16_12.x;
    u_xlat16_12.x = min(u_xlat16_0.z, u_xlat16_12.x);
    u_xlat0.xyz = u_xlat8.xyz * vec3(u_xlat51) + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_63) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat13.y = u_xlat0.y;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_29.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_14.xyz = u_xlat16_3.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_29.x);
    u_xlat16_29.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_29.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_29.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_53) * u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_29.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xxx * u_xlat16_29.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_2.xyz;
    u_xlat16_53 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_12.xyz = vec3(u_xlat16_53) * _MendsLightDirection2.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_12.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_12.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_12.x;
    u_xlat16_12.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_12.xyz = vec3(u_xlat16_53) * u_xlat16_12.xyz;
    u_xlat16_53 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_14.xyz = vec3(u_xlat16_53) * _MendsLightDirection.xyz;
    u_xlat16_53 = dot(u_xlat9.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_63 = float(1.0) / _MendsLightFallOff;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_63;
    u_xlat16_14.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_12.xyz = u_xlat16_14.xyz * vec3(u_xlat16_53) + u_xlat16_12.xyz;
    u_xlat16_0.x = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = u_xlat16_0.xxx * u_xlat16_12.xyz;
    u_xlat16_5.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_5.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat16_12.xyz * _emissiveColor.www + u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat0.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(13) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec4 u_xlati0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
vec3 u_xlat22;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_32;
mediump vec2 u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
vec2 u_xlat39;
float u_xlat54;
mediump float u_xlat16_54;
float u_xlat55;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=0.99000001);
#else
    u_xlatb18 = u_xlat18.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_24.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_10.xy = u_xlat16_24.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat18.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat18.xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat18.xy;
    u_xlat16_24.xy = u_xlat18.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_24.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_24.xy;
    u_xlat16_18.xyz = texture(_MatcapTex, u_xlat16_24.xy).xyz;
    u_xlat16_24.xyz = u_xlat16_18.xyz * _customMatcapCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_24.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat18.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_60 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_60 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_64 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStrPow;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _stockingFresnelCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat37 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat37 * u_xlat37;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_65 = u_xlat37 * u_xlat16_64;
    u_xlat37 = (-u_xlat16_64) * u_xlat37 + 1.0;
    u_xlat55 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat55 = fract(u_xlat55);
    u_xlat16_4.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat39.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyw = texture(_albedoMap, u_xlat4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyw * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat55 = _inkFlowSpeed * _Time.y;
    u_xlat55 = fract(u_xlat55);
    u_xlat39.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat55 = (-u_xlat55) + 0.5;
    u_xlat55 = u_xlat55 + u_xlat55;
    u_xlat39.xy = u_xlat39.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat39.xy = (-u_xlat39.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_8.xyz = texture(_albedoMap, u_xlat39.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyw * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat55)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat16_13.xyz;
    u_xlat37 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_65) + u_xlat9.xyz;
    u_xlat16_64 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat55 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat55 = u_xlat18.x * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat18.x + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat56 = (-u_xlat3.x) * u_xlat16_64 + u_xlat3.x;
    u_xlat56 = u_xlat3.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat3.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat39.x = u_xlat16_64 + -1.0;
    u_xlat54 = u_xlat54 * u_xlat39.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_64 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat54 = u_xlat55 * u_xlat54;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_65 = u_xlat18.x + (-_toonLambertThreshold);
    u_xlat16_65 = u_xlat16_65 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = (-u_xlat9.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat16_10.xyz * u_xlat9.xyz;
    u_xlat16_18.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_18.xxx * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_32.xyz = u_xlat9.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_67 * u_xlat16_14.x;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_15.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_32.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_68 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_68);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat9.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat55 * u_xlat55;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_67 = u_xlat55 * u_xlat16_66;
    u_xlat55 = (-u_xlat16_66) * u_xlat55 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat55);
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_67) + u_xlat9.xyz;
    u_xlat55 = (-u_xlat54) * u_xlat16_64 + u_xlat54;
    u_xlat55 = u_xlat54 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat54 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_15.xyz * u_xlat9.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat9.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_16.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat55 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat55;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.x = (-u_xlat16_60) * u_xlat55 + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.xyz = u_xlat16_13.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat37) * vec3(u_xlat16_60) + u_xlat2.xyz;
    u_xlat37 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat55 = (-u_xlat37) * u_xlat16_64 + u_xlat37;
    u_xlat55 = u_xlat37 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat37;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat37) * u_xlat2.xyz;
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_66 = max(u_xlat16_16.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_67);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat1.yyy + u_xlat16_6.xyz;
    u_xlat16_60 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_60 = u_xlat16_65 * -2.0 + 3.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_16.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat54) * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * vec3(u_xlat37) + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_15.y = u_xlat16_14.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_11.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_64) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_64 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_36.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_36.xxx + u_xlat16_36.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb36 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb36)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_60 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.z * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_54) + u_xlat16_36.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_54;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat0.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28 + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_4.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_60 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * _MendsLightDirection2.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
    u_xlat16_10.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_60 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_12.xyz = vec3(u_xlat16_60) * _MendsLightDirection.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = float(1.0) / _MendsLightFallOff;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_12.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_10.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _MendsLightColor;
uniform 	mediump vec4 _MendsLightDirection;
uniform 	mediump float _MendsLightFallOff;
uniform 	mediump vec4 _MendsLightColor2;
uniform 	mediump vec4 _MendsLightDirection2;
uniform 	mediump float _MendsLightFallOff2;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MendsLightMask;
UNITY_LOCATION(12) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(13) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
ivec4 u_xlati0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bool u_xlatb18;
float u_xlat19;
vec3 u_xlat22;
mediump vec3 u_xlat16_24;
mediump float u_xlat16_28;
mediump vec3 u_xlat16_32;
mediump vec2 u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
vec2 u_xlat39;
float u_xlat54;
mediump float u_xlat16_54;
float u_xlat55;
float u_xlat56;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
mediump float u_xlat16_68;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat22.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat22.xyz = u_xlat22.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat59 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat59 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat59 = max(u_xlat59, 1.17549435e-38);
    u_xlat59 = inversesqrt(u_xlat59);
    u_xlat7.xyz = vec3(u_xlat59) * u_xlat5.xyz;
    u_xlat22.x = dot(u_xlat7.xyz, u_xlat22.xyz);
    u_xlat22.x = (-u_xlat22.x) * u_xlat22.x + 1.0;
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x * _ShadowBias.z;
    u_xlat22.xyz = (-u_xlat7.xyz) * u_xlat22.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19 = (-u_xlat1.x) + u_xlat19;
    u_xlat0.z = _ShadowBias.y * u_xlat19 + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat18.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat18.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = (-u_xlat0.x) + 1.0;
    u_xlat18.x = max(u_xlat18.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(u_xlat18.x>=0.99000001);
#else
    u_xlatb18 = u_xlat18.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_24.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_24.x = inversesqrt(u_xlat16_24.x);
    u_xlat16_10.xy = u_xlat16_24.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat18.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat18.xy;
    u_xlat18.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat18.xy;
    u_xlat16_24.xy = u_xlat18.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_24.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_24.xy;
    u_xlat16_18.xyz = texture(_MatcapTex, u_xlat16_24.xy).xyz;
    u_xlat16_24.xyz = u_xlat16_18.xyz * _customMatcapCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_24.xyz;
    u_xlat18.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat18.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_60 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_60 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_64 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_64 = log2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStrPow;
    u_xlat16_64 = exp2(u_xlat16_64);
    u_xlat16_64 = u_xlat16_64 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * _stockingFresnelCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat4.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat7.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat37 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat37 * u_xlat37;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_64 = u_xlat37 * u_xlat16_64;
    u_xlat16_65 = u_xlat37 * u_xlat16_64;
    u_xlat37 = (-u_xlat16_64) * u_xlat37 + 1.0;
    u_xlat55 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat55 = fract(u_xlat55);
    u_xlat16_4.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat39.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyw = texture(_albedoMap, u_xlat4.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyw * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat55 = _inkFlowSpeed * _Time.y;
    u_xlat55 = fract(u_xlat55);
    u_xlat39.xy = vec2(u_xlat55) * u_xlat39.xy;
    u_xlat55 = (-u_xlat55) + 0.5;
    u_xlat55 = u_xlat55 + u_xlat55;
    u_xlat39.xy = u_xlat39.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat39.xy = (-u_xlat39.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_8.xyz = texture(_albedoMap, u_xlat39.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_8.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyw * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat55)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_4.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_8.xy = u_xlat16_4.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_8.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat37) * u_xlat16_13.xyz;
    u_xlat37 = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_65) + u_xlat9.xyz;
    u_xlat16_64 = u_xlat16_8.x * u_xlat16_8.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat55 = (-u_xlat18.x) * u_xlat16_64 + u_xlat18.x;
    u_xlat55 = u_xlat18.x * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat18.x + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat56 = (-u_xlat3.x) * u_xlat16_64 + u_xlat3.x;
    u_xlat56 = u_xlat3.x * u_xlat56 + u_xlat16_64;
    u_xlat56 = sqrt(u_xlat56);
    u_xlat56 = u_xlat56 + u_xlat3.x;
    u_xlat56 = u_xlat56 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat39.x = u_xlat16_64 + -1.0;
    u_xlat54 = u_xlat54 * u_xlat39.x + 1.0;
    u_xlat54 = u_xlat54 * u_xlat54;
    u_xlat54 = u_xlat16_64 / u_xlat54;
    u_xlat54 = u_xlat54 * 0.318309873;
    u_xlat54 = min(u_xlat54, 16.0);
    u_xlat54 = u_xlat55 * u_xlat54;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat54);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_65 = u_xlat18.x + (-_toonLambertThreshold);
    u_xlat16_65 = u_xlat16_65 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = (-u_xlat9.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat9.xyz = u_xlat16_10.xyz * u_xlat9.xyz;
    u_xlat16_18.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_18.xxx * u_xlat16_6.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_14.x = float(1.0) / float(u_xlat16_66);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_32.xyz = u_xlat9.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = u_xlat16_67 * u_xlat16_14.x;
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_15.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_66 = max(u_xlat16_66, u_xlat16_15.x);
    u_xlat16_15.xzw = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_32.xyz * u_xlat16_15.yyy + u_xlat16_15.xzw;
    u_xlat16_67 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_67 = u_xlat16_67 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_68 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_67 = max(u_xlat16_67, u_xlat16_68);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_66) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat9.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat9.xyz = u_xlat18.xxx * u_xlat9.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat55 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat55 * u_xlat55;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_66 = u_xlat55 * u_xlat16_66;
    u_xlat16_67 = u_xlat55 * u_xlat16_66;
    u_xlat55 = (-u_xlat16_66) * u_xlat55 + 1.0;
    u_xlat9.xyz = u_xlat16_13.xyz * vec3(u_xlat55);
    u_xlat9.xyz = vec3(u_xlat37) * vec3(u_xlat16_67) + u_xlat9.xyz;
    u_xlat55 = (-u_xlat54) * u_xlat16_64 + u_xlat54;
    u_xlat55 = u_xlat54 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat54 + u_xlat55;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_15.xyz * u_xlat9.xyz;
    u_xlat16_6.xyz = u_xlat9.xyz * u_xlat1.xxx + u_xlat16_6.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_66 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_66 = max(u_xlat16_66, 6.10351563e-05);
    u_xlat16_67 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = u_xlat9.xyz * vec3(u_xlat16_67);
    u_xlat16_67 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_67));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_67);
#endif
    u_xlat16_16.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_14.xyz;
    u_xlat18.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat39.x + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat16_64 / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * 0.318309873;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat55 = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat55;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.x = (-u_xlat16_60) * u_xlat55 + 1.0;
    u_xlat16_60 = u_xlat55 * u_xlat16_60;
    u_xlat2.xyz = u_xlat16_13.xyz * u_xlat2.xxx;
    u_xlat2.xyz = vec3(u_xlat37) * vec3(u_xlat16_60) + u_xlat2.xyz;
    u_xlat37 = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat37 = min(max(u_xlat37, 0.0), 1.0);
#else
    u_xlat37 = clamp(u_xlat37, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat55 = (-u_xlat37) * u_xlat16_64 + u_xlat37;
    u_xlat55 = u_xlat37 * u_xlat55 + u_xlat16_64;
    u_xlat55 = sqrt(u_xlat55);
    u_xlat55 = u_xlat55 + u_xlat37;
    u_xlat55 = u_xlat55 + 6.10351563e-05;
    u_xlat55 = u_xlat55 * u_xlat56;
    u_xlat55 = float(1.0) / u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = vec3(u_xlat37) * u_xlat2.xyz;
    u_xlat16_67 = u_xlat16_66 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_66 = float(1.0) / float(u_xlat16_66);
    u_xlat16_67 = (-u_xlat16_67) * u_xlat16_67 + 1.0;
    u_xlat16_67 = max(u_xlat16_67, 0.0);
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat16_66 = max(u_xlat16_16.x, u_xlat16_66);
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_67 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_67);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_14.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat2.xyz * u_xlat1.yyy + u_xlat16_6.xyz;
    u_xlat16_60 = (-u_xlat16_4.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_60 = u_xlat16_65 * -2.0 + 3.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat16_16.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.xyz;
    u_xlat16_16.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_12.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat54) * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_12.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * vec3(u_xlat37) + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_14.xyz;
    u_xlat16_60 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_65 = (-u_xlat16_60) + u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_8.w = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_65 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_8.w * u_xlat16_60;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_65;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_60));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_4.z);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_10.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_15.y = u_xlat16_14.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_16.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_60 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat16_10.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_10.x = u_xlat16_10.x + u_xlat16_10.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_10.xxx + (-u_xlat16_11.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_64) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat16_8.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_8.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat11.y = u_xlat1.y;
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_64 = u_xlat16_8.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_8.x);
    u_xlat3.y = u_xlat16_8.x;
    u_xlat16_36.xy = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_36.xxx + u_xlat16_36.yyy;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_64);
    u_xlat16_13.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat1.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_60) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb36 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb36)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_1.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_60 = floor(u_xlat16_1.w);
    u_xlat16_10.x = u_xlat16_60 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_1.x = u_xlat16_10.x * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_1.x = u_xlat16_60 * 16.0 + u_xlat16_1.z;
    u_xlat16_10.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_54 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_60 = u_xlat16_10.z * 15.0 + (-u_xlat16_60);
    u_xlat16_10.x = (-u_xlat16_54) + u_xlat16_36.x;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x + u_xlat16_54;
    u_xlat16_60 = u_xlat16_65 * u_xlat16_60;
    u_xlat0.x = u_xlat0.x * u_xlat16_60;
    u_xlat16_60 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_60 = u_xlat0.x * u_xlat16_10.x + u_xlat16_60;
    u_xlat16_10.x = u_xlat16_60 + u_xlat16_60;
    u_xlat16_28 = (-u_xlat16_60) * 2.0 + 1.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_28 + u_xlat16_10.x;
    u_xlat16_60 = u_xlat0.y * u_xlat16_60;
    u_xlat16_60 = min(u_xlat16_4.z, u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_60 = dot(_MendsLightDirection2.xyz, _MendsLightDirection2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_10.xyz = vec3(u_xlat16_60) * _MendsLightDirection2.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = float(1.0) / _MendsLightFallOff2;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_10.x;
    u_xlat16_10.xyz = _MendsLightColor2.www * _MendsLightColor2.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_60) * u_xlat16_10.xyz;
    u_xlat16_60 = dot(_MendsLightDirection.xyz, _MendsLightDirection.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_12.xyz = vec3(u_xlat16_60) * _MendsLightDirection.xyz;
    u_xlat16_60 = dot(u_xlat7.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = float(1.0) / _MendsLightFallOff;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_60 * -2.0 + 3.0;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_12.xyz = _MendsLightColor.www * _MendsLightColor.xyz;
    u_xlat16_10.xyz = u_xlat16_12.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat16_0 = texture(_MendsLightMask, vs_TEXCOORD3.xy).x;
    u_xlat0.xyz = vec3(u_xlat16_0) * u_xlat16_10.xyz;
    u_xlat16_2.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat0.xyz;
    u_xlat16_6.xyz = u_xlat0.xyz + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_36;
float u_xlat37;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
bool u_xlatb48;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_16.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_16.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_16.zxy * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_50 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_50) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_50) * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_50 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat0.x;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat48 = (-u_xlat16_50) * u_xlat0.x + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat48);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat0.xxx * vec3(u_xlat16_50) + u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_50 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_50) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat16_50 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat5.x = u_xlat16_50 + -1.0;
    u_xlat48 = u_xlat48 * u_xlat5.x + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat16_50 / u_xlat48;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_51 = (-u_xlat5.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStrPow;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStr;
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _stockingFresnelCol.zxy;
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_50 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_50;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat21.x) * u_xlat16_50 + u_xlat21.x;
    u_xlat37 = u_xlat21.x * u_xlat37 + u_xlat16_50;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat5.z = u_xlat37 + u_xlat21.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.z * u_xlat5.x;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat48 = u_xlat48 * u_xlat5.x;
    u_xlat5.xzw = u_xlat6.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.zxy;
    u_xlat5.xzw = u_xlat21.xxx * u_xlat5.xzw;
    u_xlat16_51 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_12.xy = vec2(u_xlat16_51) * vs_TEXCOORD5.xy;
    u_xlat16_13.y = u_xlat16_12.y * _matCapSpeEffectedByLightDir;
    u_xlat6.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xy;
    u_xlat16_28.xz = u_xlat6.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = (-u_xlat16_12.xz) * u_xlat16_13.xy + u_xlat16_28.xz;
    u_xlat16_6.xyz = texture(_MatcapTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_6.zxy * _customMatcapCol.zxy;
    u_xlat16_12.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat16_51 = u_xlat21.x + (-_toonLambertThreshold);
    u_xlat16_51 = u_xlat16_51 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat5.xzw) * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyz;
    u_xlat5.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_48 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_8.xyz = vec3(u_xlat16_48) * u_xlat16_8.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb48 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb48) ? 1.0 : 0.0;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_12.x = inversesqrt(u_xlat16_56);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat16_12.xxx;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb48 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_13.xy = (bool(u_xlatb48)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
    u_xlat48 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_56 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_12.x;
    u_xlat16_56 = max(u_xlat16_13.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_52 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_52);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_5.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat5.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat5.yyy * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_60 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = u_xlat21.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_14.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_60);
    u_xlat16_60 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_60;
    u_xlat16_56 = max(u_xlat16_14.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_13.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat5.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16.xxx * u_xlat16_13.xyz;
    u_xlat16_52 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16_14.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + _toonLambertColor.zxy;
    u_xlat16_14.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat7.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_51 * 0.5 + 0.5;
    u_xlat16_52 = (-u_xlat16_51) + u_xlat16_52;
    u_xlat16_56 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_56 + 1.0;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_52 + u_xlat16_51;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16.x = min(u_xlat16_51, 1.0);
    u_xlat48 = min(u_xlat16.x, u_xlat16_0.z);
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat48) + (-u_xlat16_15.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_13.y = u_xlat16_14.y;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_52) * u_xlat16_15.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati48 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_13.xyw;
    u_xlat16_15.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_51 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + u_xlat16_8.xyz;
    u_xlat16_8.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_8.xxx + (-u_xlat16_4.xyz);
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_6.w);
    u_xlat16_20.x = u_xlat16_4.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_53 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_6.x = u_xlat16_4.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_4.x = u_xlat16_4.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_20.x = u_xlat16_53 + (-u_xlat16_55);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_20.x + u_xlat16_55;
    u_xlat16_4.x = u_xlat16_52 * u_xlat16_4.x;
    u_xlat48 = u_xlat48 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16.x * 0.5;
    u_xlat16_20.x = (-u_xlat16.x) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat48 * u_xlat16_20.x + u_xlat16_4.x;
    u_xlat16_20.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_36 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_36 + u_xlat16_20.x;
    u_xlat16_4.x = u_xlat16.x * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_0.z, u_xlat16_4.x);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_50) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_50 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_50;
    u_xlat16_50 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_50);
    u_xlat16_20.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_51) * u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _emissiveColor.zxy;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat48 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat1.x = u_xlat48 * 0.0625 + u_xlat1.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_16.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(10) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(11) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec3 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_36;
float u_xlat37;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
bool u_xlatb48;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_16.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_16.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_16.zxy * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.zxy * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_50 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_50) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_50) * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_50 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat0.x;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat48 = (-u_xlat16_50) * u_xlat0.x + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat48);
    u_xlat0.x = u_xlat16_3.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat0.xxx * vec3(u_xlat16_50) + u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_50 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_50) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat16_50 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat5.x = u_xlat16_50 + -1.0;
    u_xlat48 = u_xlat48 * u_xlat5.x + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat16_50 / u_xlat48;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_51 = (-u_xlat5.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStrPow;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStr;
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _stockingFresnelCol.zxy;
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_50 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_50;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat21.x) * u_xlat16_50 + u_xlat21.x;
    u_xlat37 = u_xlat21.x * u_xlat37 + u_xlat16_50;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat5.z = u_xlat37 + u_xlat21.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.z * u_xlat5.x;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat48 = u_xlat48 * u_xlat5.x;
    u_xlat5.xzw = u_xlat6.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.zxy;
    u_xlat5.xzw = u_xlat21.xxx * u_xlat5.xzw;
    u_xlat16_51 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_12.xy = vec2(u_xlat16_51) * vs_TEXCOORD5.xy;
    u_xlat16_13.y = u_xlat16_12.y * _matCapSpeEffectedByLightDir;
    u_xlat6.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xy;
    u_xlat16_28.xz = u_xlat6.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = (-u_xlat16_12.xz) * u_xlat16_13.xy + u_xlat16_28.xz;
    u_xlat16_6.xyz = texture(_MatcapTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_6.zxy * _customMatcapCol.zxy;
    u_xlat16_12.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat16_51 = u_xlat21.x + (-_toonLambertThreshold);
    u_xlat16_51 = u_xlat16_51 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat5.xzw) * _MainLightIntensityAndAngleScale.zxy + u_xlat16_8.xyz;
    u_xlat5.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_48 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_8.xyz = vec3(u_xlat16_48) * u_xlat16_8.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb48 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb48) ? 1.0 : 0.0;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_12.x = inversesqrt(u_xlat16_56);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat16_12.xxx;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb48 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_13.xy = (bool(u_xlatb48)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
    u_xlat48 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_56 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_12.x;
    u_xlat16_56 = max(u_xlat16_13.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_52 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_52);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_5.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat5.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat5.yyy * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_60 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = u_xlat21.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_14.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_60);
    u_xlat16_60 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_60;
    u_xlat16_56 = max(u_xlat16_14.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_13.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat5.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16.xxx * u_xlat16_13.xyz;
    u_xlat16_52 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16_14.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + _toonLambertColor.zxy;
    u_xlat16_14.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat7.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_51 * 0.5 + 0.5;
    u_xlat16_52 = (-u_xlat16_51) + u_xlat16_52;
    u_xlat16_56 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_56 + 1.0;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_52 + u_xlat16_51;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16.x = min(u_xlat16_51, 1.0);
    u_xlat48 = min(u_xlat16.x, u_xlat16_0.z);
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat48) + (-u_xlat16_15.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.zxy;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_13.y = u_xlat16_14.y;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_52) * u_xlat16_15.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati48 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_13.xyw;
    u_xlat16_15.xyz = u_xlat16_13.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_51 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + u_xlat16_8.xyz;
    u_xlat16_8.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_8.xxx + (-u_xlat16_4.xyz);
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_6.w);
    u_xlat16_20.x = u_xlat16_4.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_53 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_6.x = u_xlat16_4.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_4.x = u_xlat16_4.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_20.x = u_xlat16_53 + (-u_xlat16_55);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_20.x + u_xlat16_55;
    u_xlat16_4.x = u_xlat16_52 * u_xlat16_4.x;
    u_xlat48 = u_xlat48 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16.x * 0.5;
    u_xlat16_20.x = (-u_xlat16.x) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat48 * u_xlat16_20.x + u_xlat16_4.x;
    u_xlat16_20.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_36 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_36 + u_xlat16_20.x;
    u_xlat16_4.x = u_xlat16.x * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_0.z, u_xlat16_4.x);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_50) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_50 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_50;
    u_xlat16_50 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_50);
    u_xlat16_20.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_51) * u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.zxy * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _emissiveColor.zxy;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat48 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat1.x = u_xlat48 * 0.0625 + u_xlat1.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat5.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat5.xy, 0.0).xyz;
    u_xlat5.xyz = (-u_xlat16_16.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat5.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(13) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
vec3 u_xlat21;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_27;
mediump float u_xlat16_34;
int u_xlati34;
vec2 u_xlat35;
vec2 u_xlat37;
float u_xlat51;
float u_xlat52;
float u_xlat56;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = max(u_xlat17.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat17.x>=0.99000001);
#else
    u_xlatb17 = u_xlat17.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xy = u_xlat16_23.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat17.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat17.xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat17.xy;
    u_xlat16_23.xy = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat16_23.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_23.xy;
    u_xlat16_17.xyz = texture(_MatcapTex, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_17.zxy * _customMatcapCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz;
    u_xlat17.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat17.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_57 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_57 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_57);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_57 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStrPow;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_57) * _stockingFresnelCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_57 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat35.x = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35.x * u_xlat35.x;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_61 = u_xlat35.x * u_xlat16_57;
    u_xlat35.x = (-u_xlat16_57) * u_xlat35.x + 1.0;
    u_xlat52 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat52 = fract(u_xlat52);
    u_xlat16_2.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat37.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat37.xy = u_xlat37.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat37.xy = (-u_xlat37.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_albedoMap, u_xlat37.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat52 = _inkFlowSpeed * _Time.y;
    u_xlat52 = fract(u_xlat52);
    u_xlat2.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat52 = (-u_xlat52) + 0.5;
    u_xlat52 = u_xlat52 + u_xlat52;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_albedoMap, u_xlat2.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat52)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat35.xxx * u_xlat16_13.xyz;
    u_xlat35.x = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat35.xxx * vec3(u_xlat16_61) + u_xlat8.xyz;
    u_xlat16_57 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat35.x = (-u_xlat3.x) * u_xlat16_57 + u_xlat3.x;
    u_xlat35.x = u_xlat3.x * u_xlat35.x + u_xlat16_57;
    u_xlat35.x = sqrt(u_xlat35.x);
    u_xlat35.x = u_xlat35.x + u_xlat3.x;
    u_xlat52 = (-u_xlat17.x) * u_xlat16_57 + u_xlat17.x;
    u_xlat52 = u_xlat17.x * u_xlat52 + u_xlat16_57;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat35.y = u_xlat17.x + u_xlat52;
    u_xlat35.xy = u_xlat35.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat35.x = u_xlat35.y * u_xlat35.x;
    u_xlat35.x = float(1.0) / u_xlat35.x;
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat52 = u_xlat16_57 + -1.0;
    u_xlat51 = u_xlat51 * u_xlat52 + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = u_xlat16_57 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.318309873;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat51 = u_xlat35.x * u_xlat51;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat51);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = u_xlat17.xxx * u_xlat8.xyz;
    u_xlat16_61 = u_xlat17.x + (-_toonLambertThreshold);
    u_xlat16_61 = u_xlat16_61 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat16_10.xyz * u_xlat8.xyz;
    u_xlat16_17.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_17.xxx * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_62 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
    u_xlat16_62 = u_xlat16_61 * -2.0 + 3.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + _toonLambertColor.zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_62 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat1.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * u_xlat17.xxx + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_61) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_61));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_10.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_57) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_57 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat3.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_57);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_3.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_3.x = u_xlat16_10.x * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_57 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.z * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_2.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_17.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(13) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
vec3 u_xlat21;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_27;
mediump float u_xlat16_34;
int u_xlati34;
vec2 u_xlat35;
vec2 u_xlat37;
float u_xlat51;
float u_xlat52;
float u_xlat56;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = max(u_xlat17.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat17.x>=0.99000001);
#else
    u_xlatb17 = u_xlat17.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xy = u_xlat16_23.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat17.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat17.xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat17.xy;
    u_xlat16_23.xy = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat16_23.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_23.xy;
    u_xlat16_17.xyz = texture(_MatcapTex, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_17.zxy * _customMatcapCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz;
    u_xlat17.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat17.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_57 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_57 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_57);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_57 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStrPow;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_57) * _stockingFresnelCol.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_57 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat35.x = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35.x * u_xlat35.x;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_61 = u_xlat35.x * u_xlat16_57;
    u_xlat35.x = (-u_xlat16_57) * u_xlat35.x + 1.0;
    u_xlat52 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat52 = fract(u_xlat52);
    u_xlat16_2.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat37.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat37.xy = u_xlat37.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat37.xy = (-u_xlat37.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_albedoMap, u_xlat37.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat52 = _inkFlowSpeed * _Time.y;
    u_xlat52 = fract(u_xlat52);
    u_xlat2.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat52 = (-u_xlat52) + 0.5;
    u_xlat52 = u_xlat52 + u_xlat52;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_albedoMap, u_xlat2.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.zxy * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.zxy * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat52)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat35.xxx * u_xlat16_13.xyz;
    u_xlat35.x = u_xlat16_13.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat35.xxx * vec3(u_xlat16_61) + u_xlat8.xyz;
    u_xlat16_57 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat35.x = (-u_xlat3.x) * u_xlat16_57 + u_xlat3.x;
    u_xlat35.x = u_xlat3.x * u_xlat35.x + u_xlat16_57;
    u_xlat35.x = sqrt(u_xlat35.x);
    u_xlat35.x = u_xlat35.x + u_xlat3.x;
    u_xlat52 = (-u_xlat17.x) * u_xlat16_57 + u_xlat17.x;
    u_xlat52 = u_xlat17.x * u_xlat52 + u_xlat16_57;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat35.y = u_xlat17.x + u_xlat52;
    u_xlat35.xy = u_xlat35.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat35.x = u_xlat35.y * u_xlat35.x;
    u_xlat35.x = float(1.0) / u_xlat35.x;
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat52 = u_xlat16_57 + -1.0;
    u_xlat51 = u_xlat51 * u_xlat52 + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = u_xlat16_57 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.318309873;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat51 = u_xlat35.x * u_xlat51;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat51);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.zxy;
    u_xlat8.xyz = u_xlat17.xxx * u_xlat8.xyz;
    u_xlat16_61 = u_xlat17.x + (-_toonLambertThreshold);
    u_xlat16_61 = u_xlat16_61 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat16_10.xyz * u_xlat8.xyz;
    u_xlat16_17.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_17.xxx * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_62 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
    u_xlat16_62 = u_xlat16_61 * -2.0 + 3.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + _toonLambertColor.zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_62 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat1.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * u_xlat17.xxx + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_61) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_61));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_10.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_57) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_57 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat3.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_57);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.zxy;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_3.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_3.x = u_xlat16_10.x * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_57 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.z * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_2.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.zxy;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.zxy;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat0.xyz = u_xlat16_6.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat51 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat51);
    u_xlat1.x = u_xlat51 * 0.0625 + u_xlat1.y;
    u_xlat16_17.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_17.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_17.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_36;
float u_xlat37;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
bool u_xlatb48;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_16.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_50 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_50) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_50) * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_50 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat0.x;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat48 = (-u_xlat16_50) * u_xlat0.x + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat48);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat0.xxx * vec3(u_xlat16_50) + u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_50 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_50) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat16_50 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat5.x = u_xlat16_50 + -1.0;
    u_xlat48 = u_xlat48 * u_xlat5.x + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat16_50 / u_xlat48;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_51 = (-u_xlat5.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStrPow;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStr;
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _stockingFresnelCol.xyz;
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_50 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_50;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat21.x) * u_xlat16_50 + u_xlat21.x;
    u_xlat37 = u_xlat21.x * u_xlat37 + u_xlat16_50;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat5.z = u_xlat37 + u_xlat21.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.z * u_xlat5.x;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat48 = u_xlat48 * u_xlat5.x;
    u_xlat5.xzw = u_xlat6.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.xyz;
    u_xlat5.xzw = u_xlat21.xxx * u_xlat5.xzw;
    u_xlat16_51 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_12.xy = vec2(u_xlat16_51) * vs_TEXCOORD5.xy;
    u_xlat16_13.y = u_xlat16_12.y * _matCapSpeEffectedByLightDir;
    u_xlat6.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xy;
    u_xlat16_28.xz = u_xlat6.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = (-u_xlat16_12.xz) * u_xlat16_13.xy + u_xlat16_28.xz;
    u_xlat16_6.xyz = texture(_MatcapTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat16_51 = u_xlat21.x + (-_toonLambertThreshold);
    u_xlat16_51 = u_xlat16_51 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat5.xzw) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat5.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_48 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_8.xyz = vec3(u_xlat16_48) * u_xlat16_8.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb48 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb48) ? 1.0 : 0.0;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_12.x = inversesqrt(u_xlat16_56);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat16_12.xxx;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb48 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_13.xy = (bool(u_xlatb48)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
    u_xlat48 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_56 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_12.x;
    u_xlat16_56 = max(u_xlat16_13.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_52 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_52);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_5.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat5.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat5.yyy * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_60 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = u_xlat21.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_14.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_60);
    u_xlat16_60 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_60;
    u_xlat16_56 = max(u_xlat16_14.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_13.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat5.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16.xxx * u_xlat16_13.xyz;
    u_xlat16_52 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16_14.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + _toonLambertColor.xyz;
    u_xlat16_14.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat7.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_51 * 0.5 + 0.5;
    u_xlat16_52 = (-u_xlat16_51) + u_xlat16_52;
    u_xlat16_56 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_56 + 1.0;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_52 + u_xlat16_51;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16.x = min(u_xlat16_51, 1.0);
    u_xlat48 = min(u_xlat16.x, u_xlat16_0.z);
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat48) + (-u_xlat16_15.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_13.y = u_xlat16_14.y;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_52) * u_xlat16_15.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati48 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_13.xyw;
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_51 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + u_xlat16_8.xyz;
    u_xlat16_8.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_8.xxx + (-u_xlat16_4.xyz);
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_6.w);
    u_xlat16_20.x = u_xlat16_4.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_53 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_6.x = u_xlat16_4.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_4.x = u_xlat16_4.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_20.x = u_xlat16_53 + (-u_xlat16_55);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_20.x + u_xlat16_55;
    u_xlat16_4.x = u_xlat16_52 * u_xlat16_4.x;
    u_xlat48 = u_xlat48 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16.x * 0.5;
    u_xlat16_20.x = (-u_xlat16.x) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat48 * u_xlat16_20.x + u_xlat16_4.x;
    u_xlat16_20.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_36 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_36 + u_xlat16_20.x;
    u_xlat16_4.x = u_xlat16.x * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_0.z, u_xlat16_4.x);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_50) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_50 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_50;
    u_xlat16_50 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_50);
    u_xlat16_20.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_51) * u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(8) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(10) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec2 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
mediump vec3 u_xlat16_4;
vec4 u_xlat5;
mediump vec2 u_xlat16_5;
ivec3 u_xlati5;
vec3 u_xlat6;
mediump vec4 u_xlat16_6;
vec3 u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
bool u_xlatb16;
mediump vec3 u_xlat16_20;
vec3 u_xlat21;
mediump vec3 u_xlat16_28;
mediump float u_xlat16_36;
float u_xlat37;
float u_xlat48;
mediump float u_xlat16_48;
int u_xlati48;
bool u_xlatb48;
mediump float u_xlat16_50;
mediump float u_xlat16_51;
mediump float u_xlat16_52;
mediump float u_xlat16_53;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_60;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat1.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat1.xy = u_xlat1.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_1.xyz = texture(_albedoMap, u_xlat1.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_16.xyz = texture(_albedoMap, u_xlat16.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_16.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + (-u_xlat16_3.xyz);
    u_xlat16_2.xyz = abs(u_xlat0.xxx) * u_xlat16_2.xyz + u_xlat16_3.xyz;
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = u_xlat16_0.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_3.xyz = u_xlat16_1.yyy * u_xlat16_4.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_50 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_50 = inversesqrt(u_xlat16_50);
    u_xlat6.xyz = u_xlat5.xyz * vec3(u_xlat16_50) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_4.xyz = vec3(u_xlat16_50) * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat6.xyz;
    u_xlat16_50 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat16_50) + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat0.x;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat48 = (-u_xlat16_50) * u_xlat0.x + 1.0;
    u_xlat16_50 = u_xlat0.x * u_xlat16_50;
    u_xlat6.xyz = u_xlat16_3.xyz * vec3(u_xlat48);
    u_xlat0.x = u_xlat16_3.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat6.xyz = u_xlat0.xxx * vec3(u_xlat16_50) + u_xlat6.xyz;
    u_xlat7.z = vs_TEXCOORD1.x;
    u_xlat16_50 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_50) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat16_8.xyz;
    u_xlat10.xyz = u_xlat9.xyz * vs_TEXCOORD1.zxy;
    u_xlat10.xyz = vs_TEXCOORD1.yzx * u_xlat9.yzx + (-u_xlat10.xyz);
    u_xlat10.xyz = u_xlat10.xzy * vs_TEXCOORD2.www;
    u_xlat7.y = u_xlat10.x;
    u_xlat7.x = u_xlat9.z;
    u_xlat16_11.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_11.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat7.x = dot(u_xlat16_8.xyz, u_xlat7.xyz);
    u_xlat10.x = u_xlat9.y;
    u_xlat9.y = u_xlat10.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat7.y = dot(u_xlat16_8.xyz, u_xlat9.xyz);
    u_xlat10.z = vs_TEXCOORD1.z;
    u_xlat7.z = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat9.xyz = u_xlat0.xxx * u_xlat7.xyz;
    u_xlat48 = dot(u_xlat9.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat16_50 = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = max(u_xlat16_50, 0.0078125);
    u_xlat5.x = u_xlat16_50 + -1.0;
    u_xlat48 = u_xlat48 * u_xlat5.x + 1.0;
    u_xlat48 = u_xlat48 * u_xlat48;
    u_xlat48 = u_xlat16_50 / u_xlat48;
    u_xlat48 = u_xlat48 * 0.318309873;
    u_xlat48 = min(u_xlat48, 16.0);
    u_xlat5.x = dot(u_xlat16_4.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.x = min(max(u_xlat10.x, 0.0), 1.0);
#else
    u_xlat10.x = clamp(u_xlat10.x, 0.0, 1.0);
#endif
    u_xlat16_51 = (-u_xlat5.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_51 = log2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStrPow;
    u_xlat16_51 = exp2(u_xlat16_51);
    u_xlat16_51 = u_xlat16_51 * _customMatcapFresnelStr;
    u_xlat16_8.xyz = vec3(u_xlat16_51) * _stockingFresnelCol.xyz;
    u_xlat5.x = (-u_xlat10.x) * u_xlat16_50 + u_xlat10.x;
    u_xlat5.x = u_xlat10.x * u_xlat5.x + u_xlat16_50;
    u_xlat5.x = sqrt(u_xlat5.x);
    u_xlat5.x = u_xlat5.x + u_xlat10.x;
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat37 = (-u_xlat21.x) * u_xlat16_50 + u_xlat21.x;
    u_xlat37 = u_xlat21.x * u_xlat37 + u_xlat16_50;
    u_xlat37 = sqrt(u_xlat37);
    u_xlat5.z = u_xlat37 + u_xlat21.x;
    u_xlat5.xz = u_xlat5.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat5.x = u_xlat5.z * u_xlat5.x;
    u_xlat5.x = float(1.0) / u_xlat5.x;
    u_xlat5.x = min(u_xlat5.x, 16.0);
    u_xlat48 = u_xlat48 * u_xlat5.x;
    u_xlat5.xzw = u_xlat6.xyz * vec3(u_xlat48);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xzw = min(max(u_xlat5.xzw, 0.0), 1.0);
#else
    u_xlat5.xzw = clamp(u_xlat5.xzw, 0.0, 1.0);
#endif
    u_xlat5.xzw = u_xlat5.xzw * _directSpecularColor.xyz;
    u_xlat5.xzw = u_xlat21.xxx * u_xlat5.xzw;
    u_xlat16_51 = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_12.xy = vec2(u_xlat16_51) * vs_TEXCOORD5.xy;
    u_xlat16_13.y = u_xlat16_12.y * _matCapSpeEffectedByLightDir;
    u_xlat6.xy = u_xlat9.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat9.xx + u_xlat6.xy;
    u_xlat6.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat9.zz + u_xlat6.xy;
    u_xlat16_28.xz = u_xlat6.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_12.z = 0.100000001;
    u_xlat16_13.x = _matCapSpeEffectedByLightDir;
    u_xlat16_12.xy = (-u_xlat16_12.xz) * u_xlat16_13.xy + u_xlat16_28.xz;
    u_xlat16_6.xyz = texture(_MatcapTex, u_xlat16_12.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * _customMatcapCol.xyz;
    u_xlat16_12.xyz = u_xlat21.xxx * u_xlat16_12.xyz;
    u_xlat16_51 = u_xlat21.x + (-_toonLambertThreshold);
    u_xlat16_51 = u_xlat16_51 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-u_xlat5.xzw) * _MainLightIntensityAndAngleScale.xyz + u_xlat16_8.xyz;
    u_xlat5.xyz = u_xlat5.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_48 = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_8.xyz = vec3(u_xlat16_48) * u_xlat16_8.xyz + u_xlat5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb48 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_52 = (u_xlatb48) ? 1.0 : 0.0;
    u_xlat5.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_12.x = inversesqrt(u_xlat16_56);
    u_xlat16_12.xyz = u_xlat5.xyz * u_xlat16_12.xxx;
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb48 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb48 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_13.xy = (bool(u_xlatb48)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_12.xyz);
    u_xlat48 = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.x = min(max(u_xlat16_12.x, 0.0), 1.0);
#else
    u_xlat16_12.x = clamp(u_xlat16_12.x, 0.0, 1.0);
#endif
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_12.x);
    u_xlat16_12.x = u_xlat16_56 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_12.x = (-u_xlat16_12.x) * u_xlat16_12.x + 1.0;
    u_xlat16_12.x = max(u_xlat16_12.x, 0.0);
    u_xlat16_12.x = u_xlat16_12.x * u_xlat16_12.x;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_12.x;
    u_xlat16_56 = max(u_xlat16_13.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_12.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_52 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(u_xlat16_52);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_5.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat5.xy = u_xlat16_5.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat5.xy = min(max(u_xlat5.xy, 0.0), 1.0);
#else
    u_xlat5.xy = clamp(u_xlat5.xy, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat5.yyy * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb16 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_52 = (u_xlatb16) ? 1.0 : 0.0;
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_56 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_56 = max(u_xlat16_56, 6.10351563e-05);
    u_xlat16_60 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = u_xlat21.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16 = !!(0.00100000005>=abs(u_xlat16_60));
#else
    u_xlatb16 = 0.00100000005>=abs(u_xlat16_60);
#endif
    u_xlat16_14.xy = (bool(u_xlatb16)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat16.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_52 = max(u_xlat16_52, u_xlat16_60);
    u_xlat16_60 = u_xlat16_56 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = float(1.0) / float(u_xlat16_56);
    u_xlat16_60 = (-u_xlat16_60) * u_xlat16_60 + 1.0;
    u_xlat16_60 = max(u_xlat16_60, 0.0);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_60;
    u_xlat16_56 = max(u_xlat16_14.x, u_xlat16_56);
    u_xlat16_52 = u_xlat16_52 * u_xlat16_56;
    u_xlat16_13.xyz = vec3(u_xlat16_52) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat5.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16.xxx * u_xlat16_13.xyz;
    u_xlat16_52 = u_xlat16_51 * -2.0 + 3.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_51;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16_14.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz + _toonLambertColor.xyz;
    u_xlat16_14.xyz = u_xlat16_2.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_2.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = (-u_xlat7.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat9.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_51 = inversesqrt(u_xlat16_51);
    u_xlat16_14.xyz = vec3(u_xlat16_51) * u_xlat16_14.xyz;
    u_xlat16_51 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_51 = min(max(u_xlat16_51, 0.0), 1.0);
#else
    u_xlat16_51 = clamp(u_xlat16_51, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_51 * 0.5 + 0.5;
    u_xlat16_52 = (-u_xlat16_51) + u_xlat16_52;
    u_xlat16_56 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_1.w = _occlusionScale * u_xlat16_56 + 1.0;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_52 + u_xlat16_51;
    u_xlat16_51 = u_xlat16_1.w * u_xlat16_51;
    u_xlat16_52 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_52 = min(max(u_xlat16_52, 0.0), 1.0);
#else
    u_xlat16_52 = clamp(u_xlat16_52, 0.0, 1.0);
#endif
    u_xlat16_52 = u_xlat16_52 + -1.0;
    u_xlat16_52 = _occlusionScale * u_xlat16_52 + 1.0;
    u_xlat16_51 = u_xlat16_51 * u_xlat16_52;
    u_xlat16.x = min(u_xlat16_51, 1.0);
    u_xlat48 = min(u_xlat16.x, u_xlat16_0.z);
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat48) * u_xlat16_13.xyz;
    u_xlat16_15.xyz = u_xlat16_2.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_15.xyz = vec3(u_xlat48) * u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat48) + (-u_xlat16_15.xyz);
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(u_xlat48) + u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _localDiffuseGI.xyz;
    u_xlat16_13.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_13.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_13.y = u_xlat16_14.y;
    u_xlat16_15.xyz = u_xlat16_13.xyz * u_xlat16_13.xyz;
    u_xlati5.xyz = ivec3(uvec3(lessThan(u_xlat16_13.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_13.xyz = vec3(u_xlat16_52) * u_xlat16_15.xyz;
    u_xlati48 = int(int_bitfieldInsert(2,u_xlati5.y,0,1) );
    u_xlat16_15.xyz = u_xlat16_13.yyy * _IrradianceACCoeffs[u_xlati48].xyz;
    u_xlati48 = int(uint(uint(u_xlati5.x) & 1u));
    u_xlati5.x = (u_xlati5.z != 0) ? 5 : 4;
    u_xlat16_13.xyw = u_xlat16_13.xxx * _IrradianceACCoeffs[u_xlati48].xyz + u_xlat16_15.xyz;
    u_xlat16_13.xyz = u_xlat16_13.zzz * _IrradianceACCoeffs[u_xlati5.x].xyz + u_xlat16_13.xyw;
    u_xlat16_15.xyz = u_xlat16_13.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_51 = dot(u_xlat16_13.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_12.xyz + u_xlat16_8.xyz;
    u_xlat16_8.x = dot((-u_xlat16_4.xyz), u_xlat9.xyz);
    u_xlat16_8.x = u_xlat16_8.x + u_xlat16_8.x;
    u_xlat5.xyz = (-u_xlat9.xyz) * u_xlat16_8.xxx + (-u_xlat16_4.xyz);
    u_xlat48 = dot(u_xlat16_14.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.z = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat16_4.xyz = u_xlat16_1.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.yzw = u_xlat16_4.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_4.x = floor(u_xlat16_6.w);
    u_xlat16_20.x = u_xlat16_4.x + 1.0;
    u_xlat16_20.x = min(u_xlat16_20.x, 15.0);
    u_xlat16_6.x = u_xlat16_20.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_53 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_6.x = u_xlat16_4.x * 16.0 + u_xlat16_6.z;
    u_xlat16_8.xy = u_xlat16_6.xy + vec2(0.5, 0.5);
    u_xlat16_8.xy = u_xlat16_8.xy * vec2(0.00390625, 0.0625);
    u_xlat16_55 = texture(_SpecularOcclusionLut3D, u_xlat16_8.xy).x;
    u_xlat16_4.x = u_xlat16_4.z * 15.0 + (-u_xlat16_4.x);
    u_xlat16_20.x = u_xlat16_53 + (-u_xlat16_55);
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_20.x + u_xlat16_55;
    u_xlat16_4.x = u_xlat16_52 * u_xlat16_4.x;
    u_xlat48 = u_xlat48 * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16.x * 0.5;
    u_xlat16_20.x = (-u_xlat16.x) * 0.5 + 1.0;
    u_xlat16_4.x = u_xlat48 * u_xlat16_20.x + u_xlat16_4.x;
    u_xlat16_20.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat16_36 = (-u_xlat16_4.x) * 2.0 + 1.0;
    u_xlat16_4.x = u_xlat16_4.x * u_xlat16_36 + u_xlat16_20.x;
    u_xlat16_4.x = u_xlat16.x * u_xlat16_4.x;
    u_xlat16_4.x = min(u_xlat16_0.z, u_xlat16_4.x);
    u_xlat0.xyz = u_xlat7.xyz * u_xlat0.xxx + (-u_xlat5.xyz);
    u_xlat0.xyz = vec3(u_xlat16_50) * u_xlat0.xyz + u_xlat5.xyz;
    u_xlat16_50 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_50;
    u_xlat16_50 = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat10.y = u_xlat16_1.x;
    u_xlat16_5.xy = texture(_DfgTexture, u_xlat10.xy).xy;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_5.xxx + u_xlat16_5.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_50);
    u_xlat16_20.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_20.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_20.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_51) * u_xlat16_20.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_20.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_20.xyz;
    u_xlat16_3.xyz = u_xlat16_4.xxx * u_xlat16_3.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = u_xlat16_3.xyz * u_xlat16_4.xyz + u_xlat16_2.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_3.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_3.xyz = u_xlat16_0.xyz * u_xlat16_3.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat16_2.xyz = u_xlat16_3.xyz * _emissiveColor.www + u_xlat16_2.xyz;
    u_xlat16_3.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_2.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
vec3 u_xlat21;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_27;
mediump float u_xlat16_34;
int u_xlati34;
vec2 u_xlat35;
vec2 u_xlat37;
float u_xlat51;
float u_xlat52;
float u_xlat56;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = max(u_xlat17.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat17.x>=0.99000001);
#else
    u_xlatb17 = u_xlat17.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xy = u_xlat16_23.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat17.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat17.xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat17.xy;
    u_xlat16_23.xy = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat16_23.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_23.xy;
    u_xlat16_17.xyz = texture(_MatcapTex, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _customMatcapCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz;
    u_xlat17.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat17.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_57 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_57 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_57);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_57 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStrPow;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_57) * _stockingFresnelCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_57 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat35.x = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35.x * u_xlat35.x;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_61 = u_xlat35.x * u_xlat16_57;
    u_xlat35.x = (-u_xlat16_57) * u_xlat35.x + 1.0;
    u_xlat52 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat52 = fract(u_xlat52);
    u_xlat16_2.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat37.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat37.xy = u_xlat37.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat37.xy = (-u_xlat37.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_albedoMap, u_xlat37.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat52 = _inkFlowSpeed * _Time.y;
    u_xlat52 = fract(u_xlat52);
    u_xlat2.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat52 = (-u_xlat52) + 0.5;
    u_xlat52 = u_xlat52 + u_xlat52;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_albedoMap, u_xlat2.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat52)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat35.xxx * u_xlat16_13.xyz;
    u_xlat35.x = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat35.xxx * vec3(u_xlat16_61) + u_xlat8.xyz;
    u_xlat16_57 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat35.x = (-u_xlat3.x) * u_xlat16_57 + u_xlat3.x;
    u_xlat35.x = u_xlat3.x * u_xlat35.x + u_xlat16_57;
    u_xlat35.x = sqrt(u_xlat35.x);
    u_xlat35.x = u_xlat35.x + u_xlat3.x;
    u_xlat52 = (-u_xlat17.x) * u_xlat16_57 + u_xlat17.x;
    u_xlat52 = u_xlat17.x * u_xlat52 + u_xlat16_57;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat35.y = u_xlat17.x + u_xlat52;
    u_xlat35.xy = u_xlat35.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat35.x = u_xlat35.y * u_xlat35.x;
    u_xlat35.x = float(1.0) / u_xlat35.x;
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat52 = u_xlat16_57 + -1.0;
    u_xlat51 = u_xlat51 * u_xlat52 + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = u_xlat16_57 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.318309873;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat51 = u_xlat35.x * u_xlat51;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat51);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat17.xxx * u_xlat8.xyz;
    u_xlat16_61 = u_xlat17.x + (-_toonLambertThreshold);
    u_xlat16_61 = u_xlat16_61 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat16_10.xyz * u_xlat8.xyz;
    u_xlat16_17.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_17.xxx * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_62 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
    u_xlat16_62 = u_xlat16_61 * -2.0 + 3.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + _toonLambertColor.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_62 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat1.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * u_xlat17.xxx + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_61) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_61));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_10.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_57) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_57 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat3.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_57);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_3.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_3.x = u_xlat16_10.x * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_57 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.z * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_2.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
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
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _FogCol;
uniform 	mediump vec4 _FogParams;
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
UNITY_BINDING(2) uniform UnityPerDraw {
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
in mediump vec4 in_NORMAL0;
in mediump vec4 in_TANGENT0;
in mediump vec2 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump vec3 vs_TEXCOORD5;
vec3 u_xlat0;
vec4 u_xlat1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_4;
mediump float u_xlat16_5;
float u_xlat18;
bool u_xlatb18;
mediump float u_xlat16_20;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat1.xyz = (-u_xlat0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_2.x = sqrt(u_xlat16_2.x);
    u_xlat16_2.x = u_xlat16_2.x + (-_FogParams.x);
    u_xlat16_2.y = u_xlat0.y + (-_FogParams.z);
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    u_xlat16_2.xy = u_xlat16_2.xy / _FogParams.yw;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xy = min(max(u_xlat16_2.xy, 0.0), 1.0);
#else
    u_xlat16_2.xy = clamp(u_xlat16_2.xy, 0.0, 1.0);
#endif
    u_xlat16_2.x = (-u_xlat16_2.y) + u_xlat16_2.x;
    u_xlat16_2.x = u_xlat16_2.x + 1.0;
    u_xlat16_2.x = min(u_xlat16_2.x, 1.0);
    u_xlat16_2.x = u_xlat16_2.x * _FogCol.w;
    vs_TEXCOORD0.w = u_xlat16_2.x;
    vs_TEXCOORD1.w = in_TEXCOORD2.w;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat18 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat0.xyz = vec3(u_xlat18) * u_xlat0.xyz;
    vs_TEXCOORD1.xyz = u_xlat0.xyz;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat1.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat1.xyz * u_xlat16_4.xxx;
    u_xlat0.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat16_20);
    u_xlat0.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat0.xyz;
    vs_TEXCOORD4.xyz = u_xlat0.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    u_xlat0.xyz = _MainLightDirectionAndAngleOffset.yyy * hlslcc_mtx4x4unity_MatrixV[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[0].xyz * _MainLightDirectionAndAngleOffset.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_MatrixV[2].xyz * _MainLightDirectionAndAngleOffset.zzz + u_xlat0.xyz;
    vs_TEXCOORD5.xyz = u_xlat0.xyz;
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
uniform 	mediump vec4 _MainLightIntensityAndAngleScale;
uniform 	vec4 _MainLightPositionAndFalloff;
uniform 	mediump vec4 _MainLightDirectionAndAngleOffset;
uniform 	mediump vec4 _AdditionalLightIntensityAndAngleScale[2];
uniform 	vec4 _AdditionalLightPositionAndFalloff[2];
uniform 	mediump vec4 _AdditionalLightDirectionAndAngleOffset[2];
uniform 	mediump float _IndirectSpecularMapMipLevelUsed;
uniform 	mediump float _IndirectSpecularMapIntensity;
uniform 	mediump vec4 _IndirectSpecularMapRotationParams;
uniform 	mediump vec4 _IndirectCubemapRotationParams;
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _IrradianceACCoeffsIntensity;
uniform 	mediump vec4 _IrradianceACCoeffs[6];
uniform 	mediump float _diffuseShadowStrength;
uniform 	mediump float _cubemapShadowStrength;
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	float _inkFlowSpeed;
uniform 	float _inkFlowScale;
uniform 	mediump vec4 _customMatcapCol;
uniform 	mediump vec3 _stockingFresnelCol;
uniform 	mediump float _matCapSpeEffectedByLightDir;
uniform 	mediump float _customMatcapFresnelStr;
uniform 	mediump float _customMatcapFresnelStrPow;
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
UNITY_BINDING(1) uniform UnityPerFrame {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4glstate_matrix_projection[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixInvV[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(10) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MatcapTex;
UNITY_LOCATION(12) uniform mediump sampler2D _StockingsID;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump vec3 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
vec2 u_xlat17;
mediump vec3 u_xlat16_17;
bool u_xlatb17;
vec3 u_xlat18;
vec3 u_xlat21;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_27;
mediump float u_xlat16_34;
int u_xlati34;
vec2 u_xlat35;
vec2 u_xlat37;
float u_xlat51;
float u_xlat52;
float u_xlat56;
mediump float u_xlat16_57;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
mediump float u_xlat16_63;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat0;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat1;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat2;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat3;
    u_xlat3 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat3;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb4 = _ShadowBias.z!=0.0;
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat21.xyz = u_xlat21.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat56 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat5.x = u_xlat7.z;
    u_xlat16_9.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_9.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat7.y = u_xlat8.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat7.xyz);
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat56 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat56 = max(u_xlat56, 1.17549435e-38);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat7.xyz = vec3(u_xlat56) * u_xlat5.xyz;
    u_xlat21.x = dot(u_xlat7.xyz, u_xlat21.xyz);
    u_xlat21.x = (-u_xlat21.x) * u_xlat21.x + 1.0;
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x * _ShadowBias.z;
    u_xlat21.xyz = (-u_xlat7.xyz) * u_xlat21.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat21.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat4.yyyy;
    u_xlat2 = u_xlat2 * u_xlat4.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat4.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat18.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat18.x = (-u_xlat1.x) + u_xlat18.x;
    u_xlat0.z = _ShadowBias.y * u_xlat18.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat1.xyz = u_xlat0.xyw + u_xlat1.xyz;
    vec3 txVec0 = vec3(u_xlat1.xy,u_xlat1.z);
    u_xlat1.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec1 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec2 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat2.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat2.z = 0.0;
    u_xlat0.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat0.xy,u_xlat0.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat17.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat17.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = (-u_xlat0.x) + 1.0;
    u_xlat17.x = max(u_xlat17.x, 0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(u_xlat17.x>=0.99000001);
#else
    u_xlatb17 = u_xlat17.x>=0.99000001;
#endif
    u_xlat16_6.x = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat16_23.x = dot(vs_TEXCOORD5.xyz, vs_TEXCOORD5.xyz);
    u_xlat16_23.x = inversesqrt(u_xlat16_23.x);
    u_xlat16_10.xy = u_xlat16_23.xx * vs_TEXCOORD5.xy;
    u_xlat16_11.y = u_xlat16_10.y * _matCapSpeEffectedByLightDir;
    u_xlat17.xy = u_xlat7.yy * hlslcc_mtx4x4unity_MatrixV[1].xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[0].xy * u_xlat7.xx + u_xlat17.xy;
    u_xlat17.xy = hlslcc_mtx4x4unity_MatrixV[2].xy * u_xlat7.zz + u_xlat17.xy;
    u_xlat16_23.xy = u_xlat17.xy * vec2(0.5, 0.5) + vec2(0.5, 0.5);
    u_xlat16_10.z = 0.100000001;
    u_xlat16_11.x = _matCapSpeEffectedByLightDir;
    u_xlat16_23.xy = (-u_xlat16_10.xz) * u_xlat16_11.xy + u_xlat16_23.xy;
    u_xlat16_17.xyz = texture(_MatcapTex, u_xlat16_23.xy).xyz;
    u_xlat16_23.xyz = u_xlat16_17.xyz * _customMatcapCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xxx * u_xlat16_23.xyz;
    u_xlat17.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat17.xxx * u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_57 = u_xlat16_1.z * _shadowStrength;
    u_xlat1.xy = u_xlat16_1.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xy = min(max(u_xlat1.xy, 0.0), 1.0);
#else
    u_xlat1.xy = clamp(u_xlat1.xy, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_57 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_10.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_10.xyz = u_xlat0.xxx * u_xlat16_10.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_57 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_57);
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_57) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat3.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
    u_xlat16_57 = (-u_xlat3.x) * 0.5 + 0.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat3.x = u_xlat3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_57 = log2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStrPow;
    u_xlat16_57 = exp2(u_xlat16_57);
    u_xlat16_57 = u_xlat16_57 * _customMatcapFresnelStr;
    u_xlat16_12.xyz = vec3(u_xlat16_57) * _stockingFresnelCol.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_10.xyz + u_xlat16_12.xyz;
    u_xlat51 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat51 = inversesqrt(u_xlat51);
    u_xlat2.xyz = vec3(u_xlat51) * u_xlat2.xyz;
    u_xlat16_57 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat51 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat51 = min(max(u_xlat51, 0.0), 1.0);
#else
    u_xlat51 = clamp(u_xlat51, 0.0, 1.0);
#endif
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat35.x = (-u_xlat16_57) + 1.0;
    u_xlat16_57 = u_xlat35.x * u_xlat35.x;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_57 = u_xlat35.x * u_xlat16_57;
    u_xlat16_61 = u_xlat35.x * u_xlat16_57;
    u_xlat35.x = (-u_xlat16_57) * u_xlat35.x + 1.0;
    u_xlat52 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat52 = fract(u_xlat52);
    u_xlat16_2.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat2.xy = u_xlat16_2.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat37.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat37.xy = u_xlat37.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat37.xy = (-u_xlat37.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_4.xyz = texture(_albedoMap, u_xlat37.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat52 = _inkFlowSpeed * _Time.y;
    u_xlat52 = fract(u_xlat52);
    u_xlat2.xy = vec2(u_xlat52) * u_xlat2.xy;
    u_xlat52 = (-u_xlat52) + 0.5;
    u_xlat52 = u_xlat52 + u_xlat52;
    u_xlat2.xy = u_xlat2.xy * vec2(vec2(_inkFlowScale, _inkFlowScale));
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_2.zz + vs_TEXCOORD3.xy;
    u_xlat16_2.xyz = texture(_albedoMap, u_xlat2.xy).xyz;
    u_xlat16_13.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_2.xyz * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + (-u_xlat16_13.xyz);
    u_xlat16_12.xyz = abs(vec3(u_xlat52)) * u_xlat16_12.xyz + u_xlat16_13.xyz;
    u_xlat16_13.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_13.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_4.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_13.xyz = u_xlat16_4.yyy * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat8.xyz = u_xlat35.xxx * u_xlat16_13.xyz;
    u_xlat35.x = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat35.xxx * vec3(u_xlat16_61) + u_xlat8.xyz;
    u_xlat16_57 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat16_57 = u_xlat16_57 * u_xlat16_57;
    u_xlat16_57 = max(u_xlat16_57, 0.0078125);
    u_xlat35.x = (-u_xlat3.x) * u_xlat16_57 + u_xlat3.x;
    u_xlat35.x = u_xlat3.x * u_xlat35.x + u_xlat16_57;
    u_xlat35.x = sqrt(u_xlat35.x);
    u_xlat35.x = u_xlat35.x + u_xlat3.x;
    u_xlat52 = (-u_xlat17.x) * u_xlat16_57 + u_xlat17.x;
    u_xlat52 = u_xlat17.x * u_xlat52 + u_xlat16_57;
    u_xlat52 = sqrt(u_xlat52);
    u_xlat35.y = u_xlat17.x + u_xlat52;
    u_xlat35.xy = u_xlat35.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat35.x = u_xlat35.y * u_xlat35.x;
    u_xlat35.x = float(1.0) / u_xlat35.x;
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat52 = u_xlat16_57 + -1.0;
    u_xlat51 = u_xlat51 * u_xlat52 + 1.0;
    u_xlat51 = u_xlat51 * u_xlat51;
    u_xlat51 = u_xlat16_57 / u_xlat51;
    u_xlat51 = u_xlat51 * 0.318309873;
    u_xlat51 = min(u_xlat51, 16.0);
    u_xlat51 = u_xlat35.x * u_xlat51;
    u_xlat8.xyz = u_xlat8.xyz * vec3(u_xlat51);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.xyz = min(max(u_xlat8.xyz, 0.0), 1.0);
#else
    u_xlat8.xyz = clamp(u_xlat8.xyz, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _directSpecularColor.xyz;
    u_xlat8.xyz = u_xlat17.xxx * u_xlat8.xyz;
    u_xlat16_61 = u_xlat17.x + (-_toonLambertThreshold);
    u_xlat16_61 = u_xlat16_61 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat8.xyz = u_xlat8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = (-u_xlat8.xyz) * u_xlat16_10.xyz + u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat16_10.xyz * u_xlat8.xyz;
    u_xlat16_17.x = texture(_StockingsID, vs_TEXCOORD3.xy).x;
    u_xlat16_6.xyz = u_xlat16_17.xxx * u_xlat16_6.xyz + u_xlat8.xyz;
    u_xlat16_62 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_12.xyz = vec3(u_xlat16_62) * u_xlat16_12.xyz;
    u_xlat16_62 = u_xlat16_61 * -2.0 + 3.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_14.xyz + _toonLambertColor.xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat2.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_62 = dot(u_xlat2.xyw, u_xlat2.xyw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat2.xyw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat17.xxx * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb17 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_61 = (u_xlatb17) ? 1.0 : 0.0;
    u_xlat1.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_62 = dot(u_xlat1.xzw, u_xlat1.xzw);
    u_xlat16_62 = max(u_xlat16_62, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_62);
    u_xlat16_14.xyz = u_xlat1.xzw * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb17 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb17 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_15.xy = (bool(u_xlatb17)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_14.xyz);
    u_xlat17.x = dot(u_xlat7.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat17.x = min(max(u_xlat17.x, 0.0), 1.0);
#else
    u_xlat17.x = clamp(u_xlat17.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_61 = max(u_xlat16_61, u_xlat16_63);
    u_xlat16_63 = u_xlat16_62 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_62 = float(1.0) / float(u_xlat16_62);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_62 = u_xlat16_62 * u_xlat16_63;
    u_xlat16_62 = max(u_xlat16_15.x, u_xlat16_62);
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat16_14.xyz = vec3(u_xlat16_61) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_14.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat1.yyy * u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_14.xyz * u_xlat17.xxx + u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_10.xyz = (-u_xlat5.xyz) * vec3(u_xlat56) + vs_TEXCOORD4.xyz;
    u_xlat16_10.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_10.xyz + u_xlat7.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat16_10.xyz);
    u_xlat16_61 = inversesqrt(u_xlat16_61);
    u_xlat16_10.xyz = vec3(u_xlat16_61) * u_xlat16_10.xyz;
    u_xlat16_61 = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_62 = (-u_xlat16_61) + u_xlat16_62;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_62 + u_xlat16_61;
    u_xlat16_61 = u_xlat16_4.w * u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62 = min(max(u_xlat16_62, 0.0), 1.0);
#else
    u_xlat16_62 = clamp(u_xlat16_62, 0.0, 1.0);
#endif
    u_xlat16_62 = u_xlat16_62 + -1.0;
    u_xlat16_62 = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_61 = u_xlat16_61 * u_xlat16_62;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_61));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_2.z);
    u_xlat16_14.xyz = u_xlat16_12.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat0.xxx * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat0.xxx + (-u_xlat16_15.xyz);
    u_xlat16_15.xyz = u_xlat16_12.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat0.xxx + u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_10.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_10.xz);
    u_xlat16_15.y = u_xlat16_10.y;
    u_xlat16_16.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_15.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_62) * u_xlat16_16.xyz;
    u_xlati34 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_16.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati34].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati34 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati34].xyz + u_xlat16_15.xyw;
    u_xlat16_16.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_61 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_16.xyz;
    u_xlat16_6.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_12.x = dot((-u_xlat16_11.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(u_xlat16_10.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_10.xyz, u_xlat0.xzw);
    u_xlat16_10.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.xyz = min(max(u_xlat16_10.xyz, 0.0), 1.0);
#else
    u_xlat16_10.xyz = clamp(u_xlat16_10.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat5.xyz * vec3(u_xlat56) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_57) * u_xlat18.xyz + u_xlat0.xzw;
    u_xlat16_11.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat11.y = u_xlat0.z;
    u_xlat16_11.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat11.xz = u_xlat16_11.xz;
    u_xlat16_57 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat3.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat3.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat11.xyz, u_xlat16_57);
    u_xlat16_13.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat0.xzw = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_61) * u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_14.xyz : u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_3.yzw = u_xlat16_10.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_57 = floor(u_xlat16_3.w);
    u_xlat16_10.x = u_xlat16_57 + 1.0;
    u_xlat16_10.x = min(u_xlat16_10.x, 15.0);
    u_xlat16_3.x = u_xlat16_10.x * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_3.x = u_xlat16_57 * 16.0 + u_xlat16_3.z;
    u_xlat16_10.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_10.xy = u_xlat16_10.xy * vec2(0.00390625, 0.0625);
    u_xlat16_34 = texture(_SpecularOcclusionLut3D, u_xlat16_10.xy).x;
    u_xlat16_57 = u_xlat16_10.z * 15.0 + (-u_xlat16_57);
    u_xlat16_10.x = (-u_xlat16_34) + u_xlat16_0.x;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_10.x + u_xlat16_34;
    u_xlat16_57 = u_xlat16_62 * u_xlat16_57;
    u_xlat0.x = u_xlat1.x * u_xlat16_57;
    u_xlat16_57 = u_xlat0.y * 0.5;
    u_xlat16_10.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_57 = u_xlat0.x * u_xlat16_10.x + u_xlat16_57;
    u_xlat16_10.x = u_xlat16_57 + u_xlat16_57;
    u_xlat16_27 = (-u_xlat16_57) * 2.0 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_27 + u_xlat16_10.x;
    u_xlat16_57 = u_xlat0.y * u_xlat16_57;
    u_xlat16_57 = min(u_xlat16_2.z, u_xlat16_57);
    u_xlat16_10.xyz = vec3(u_xlat16_57) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_6.xyz;
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.xyz * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat16_6.xyz;
    u_xlat16_10.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_6.xyz;
    SV_Target0.w = 1.0;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "DIRECTIONAL" "SHADOWS_SCREEN" "_COLOR_HDR_" "_RENDER_QUALITY_LOW" }
""
}
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Geometry" "RenderType" = "Opaque" }
  GpuProgramID 152290
Program "vp" {
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
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
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
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
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	float _DepthTextureMode;
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
vec4 u_xlat0;
vec4 u_xlat1;
vec4 u_xlat2;
bool u_xlatb2;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[3].xyz * in_POSITION0.www + u_xlat0.xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4customShadowViewM[1];
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4customShadowViewM[2] * u_xlat0.zzzz + u_xlat1;
    u_xlat1 = u_xlat1 + hlslcc_mtx4x4customShadowViewM[3];
    u_xlat2 = u_xlat1.yyyy * hlslcc_mtx4x4customShadowProjM[1];
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[0] * u_xlat1.xxxx + u_xlat2;
    u_xlat2 = hlslcc_mtx4x4customShadowProjM[2] * u_xlat1.zzzz + u_xlat2;
    u_xlat1 = hlslcc_mtx4x4customShadowProjM[3] * u_xlat1.wwww + u_xlat2;
    u_xlat2 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat2;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_DepthTextureMode<0.5);
#else
    u_xlatb2 = _DepthTextureMode<0.5;
#endif
    gl_Position = (bool(u_xlatb2)) ? u_xlat1 : u_xlat0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_UNITY" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "MODE_CUSTOM" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "MODE_CUSTOM" }
""
}
}
}
}
CustomEditor "CodeGenShaderGUI.Theseus_ToonLambert_InkFlow_NprStockingsGUI"
}