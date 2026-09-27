//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/ToonLambert(InkFlowTransOutline)" {
Properties {

_cull ("剔除模式", Float) = 2.0

_zwrite ("深度写入", Float) = 1.0

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

[Tex] _inkFlowMap ("RG:flow map,B:flow scale,A:流光和噪声mask", 2D) = "white" { }

_inkFlowSpeed ("流动速度", Range(0, 1)) = 0.0

_inkFlowScale ("流动幅度", Float) = 0.0

[Toggle] _use_Dissolve_UV2 ("use uv2", Float) = 1.0

[Tex] _edgeNoiseMap ("R:溶解 G:扰动", 2D) = "white" { }

_edgeNoiseParam ("溶解tiling&speed", Vector) = (1,1,1,1)

_edgeDisturbParam ("扰动tiling&speed", Vector) = (1,1,1,1)

_edgeNoiseDisturb ("溶解扰动强度", Float) = 1.0

_albedoDissolveDirection ("Albedo溶解方向", Float) = 0.0

_albedoDissolveDirectionFlip ("Albedo溶解方向取反", Float) = 0.0

_albedoDissolveThreshold ("Albedo溶解阈值", Range(-2, 2)) = 0.5

_albedoDissolveFallOff ("Albedo溶解过渡", Range(0, 1)) = 0.10000000149011612

[Tex] _outlineNoiseMap ("R:描边宽度噪声图, G:描边宽度", 2D) = "white" { }

[Toggle] _use_Outline_UV2 ("use uv2", Float) = 0.0

_outlineColor ("描边颜色", Color) = (1,1,1,1)

_outlineWidth ("描边宽度", Range(0, 10)) = 0.5

_outlineAlphaThreshold ("描边范围", Range(0, 1)) = 0.5

_outlineAlphaWidth ("描边压缩", Range(0, 1)) = 0.5

_OutlineZOffset ("_OutlineZOffset", Range(0, 1)) = 0.0

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 Pass {
  Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
  GpuProgramID 169793
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
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
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
in highp vec3 in_POSITION0;
in mediump vec4 in_COLOR0;
out mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
#ifdef UNITY_ADRENO_ES3
    vs_COLOR0 = min(max(vs_COLOR0, 0.0), 1.0);
#else
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
#endif
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
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
in mediump vec4 vs_COLOR0;
layout(location = 0) out mediump vec4 SV_Target0;
void main()
{
    SV_Target0 = vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
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
attribute highp vec3 in_POSITION0;
attribute mediump vec4 in_COLOR0;
varying mediump vec4 vs_COLOR0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    vs_COLOR0 = in_COLOR0;
    vs_COLOR0 = clamp(vs_COLOR0, 0.0, 1.0);
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
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
varying mediump vec4 vs_COLOR0;
#define SV_Target0 gl_FragData[0]
void main()
{
    SV_Target0 = vs_COLOR0;
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
 Name "InkOutline"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Opaque" }
 ZWrite Off
 Cull Front
  GpuProgramID 30534
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
UNITY_LOCATION(1) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _use_Dissolve_UV3;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	vec4 _outlineNoiseMap_ST;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _use_Outline_UV2;
uniform 	mediump float _outlineAlphaThreshold;
uniform 	mediump float _outlineAlphaWidth;
uniform 	mediump float _outlineClip;
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
UNITY_LOCATION(0) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
    u_xlatb6.xy = lessThan(vec4(_use_Dissolve_UV3, _use_Dissolve_UV2, _use_Dissolve_UV3, _use_Dissolve_UV2), vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat1.xy = (u_xlatb6.y) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat6.xy = (u_xlatb6.x) ? u_xlat1.xy : vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat6.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat1.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat1.xy = u_xlat6.xy * _edgeNoiseParam.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb1.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_2 = (u_xlatb1.x) ? u_xlat6.x : 1.0;
    u_xlat16_2 = (u_xlatb1.y) ? u_xlat6.y : u_xlat16_2;
    u_xlat16_5 = (-u_xlat16_2) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb3 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_2 = (u_xlatb3) ? u_xlat16_5 : u_xlat16_2;
    u_xlat16_2 = u_xlat16_0.x + u_xlat16_2;
    u_xlat16_2 = u_xlat16_2 * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_2 = u_xlat16_2 / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_2 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5<0.0);
#else
    u_xlatb0 = u_xlat16_5<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
    u_xlat9 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5 = u_xlat0.x + (-_outlineAlphaThreshold);
    u_xlat16_5 = u_xlat16_5 / _outlineAlphaWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_use_Outline_UV2<0.5);
#else
    u_xlatb0 = _use_Outline_UV2<0.5;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat0.xy = u_xlat0.xy * _outlineNoiseMap_ST.xy + _outlineNoiseMap_ST.zw;
    u_xlat16_0.x = texture(_outlineNoiseMap, u_xlat0.xy).x;
    u_xlat16_8 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_8 = u_xlat16_5 * u_xlat16_8 + u_xlat16_0.x;
    u_xlat16_11 = u_xlat16_8 + (-_outlineClip);
    u_xlat16_2 = u_xlat16_8 * u_xlat16_2;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    u_xlat16_0.w = u_xlat16_2 * _outlineColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_11<0.0);
#else
    u_xlatb1.x = u_xlat16_11<0.0;
#endif
    if(u_xlatb1.x){discard;}
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
UNITY_LOCATION(1) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 in_POSITION0;
in highp vec3 in_NORMAL0;
in highp vec4 in_TANGENT0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out highp vec2 vs_TEXCOORD1;
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
    vs_TEXCOORD1.xy = in_TEXCOORD2.xy;
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
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _use_Dissolve_UV3;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	vec4 _outlineNoiseMap_ST;
uniform 	mediump vec4 _outlineColor;
uniform 	mediump float _use_Outline_UV2;
uniform 	mediump float _outlineAlphaThreshold;
uniform 	mediump float _outlineAlphaWidth;
uniform 	mediump float _outlineClip;
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
UNITY_LOCATION(0) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(1) uniform mediump sampler2D _outlineNoiseMap;
in highp vec4 vs_TEXCOORD0;
in highp vec2 vs_TEXCOORD1;
in highp vec3 vs_TEXCOORD2;
in highp vec3 vs_TEXCOORD3;
layout(location = 0) out highp vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
bvec2 u_xlatb1;
mediump float u_xlat16_2;
bool u_xlatb3;
mediump float u_xlat16_5;
vec2 u_xlat6;
bvec2 u_xlatb6;
mediump float u_xlat16_8;
float u_xlat9;
mediump float u_xlat16_11;
void main()
{
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
    u_xlatb6.xy = lessThan(vec4(_use_Dissolve_UV3, _use_Dissolve_UV2, _use_Dissolve_UV3, _use_Dissolve_UV2), vec4(0.5, 0.5, 0.5, 0.5)).xy;
    u_xlat1.xy = (u_xlatb6.y) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat6.xy = (u_xlatb6.x) ? u_xlat1.xy : vs_TEXCOORD1.xy;
    u_xlat0.xy = u_xlat6.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat1.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat1.xy = u_xlat6.xy * _edgeNoiseParam.xy + u_xlat1.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat1.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb1.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_2 = (u_xlatb1.x) ? u_xlat6.x : 1.0;
    u_xlat16_2 = (u_xlatb1.y) ? u_xlat6.y : u_xlat16_2;
    u_xlat16_5 = (-u_xlat16_2) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb3 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_2 = (u_xlatb3) ? u_xlat16_5 : u_xlat16_2;
    u_xlat16_2 = u_xlat16_0.x + u_xlat16_2;
    u_xlat16_2 = u_xlat16_2 * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_2 = u_xlat16_2 / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2 = min(max(u_xlat16_2, 0.0), 1.0);
#else
    u_xlat16_2 = clamp(u_xlat16_2, 0.0, 1.0);
#endif
    u_xlat16_5 = u_xlat16_2 + -0.00100000005;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_5<0.0);
#else
    u_xlatb0 = u_xlat16_5<0.0;
#endif
    if(u_xlatb0){discard;}
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD2.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * vs_TEXCOORD2.xyz;
    u_xlat9 = dot(vs_TEXCOORD3.xyz, vs_TEXCOORD3.xyz);
    u_xlat9 = inversesqrt(u_xlat9);
    u_xlat1.xyz = vec3(u_xlat9) * vs_TEXCOORD3.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat16_5 = u_xlat0.x + (-_outlineAlphaThreshold);
    u_xlat16_5 = u_xlat16_5 / _outlineAlphaWidth;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5 = min(max(u_xlat16_5, 0.0), 1.0);
#else
    u_xlat16_5 = clamp(u_xlat16_5, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_use_Outline_UV2<0.5);
#else
    u_xlatb0 = _use_Outline_UV2<0.5;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD0.xy : vs_TEXCOORD0.zw;
    u_xlat0.xy = u_xlat0.xy * _outlineNoiseMap_ST.xy + _outlineNoiseMap_ST.zw;
    u_xlat16_0.x = texture(_outlineNoiseMap, u_xlat0.xy).x;
    u_xlat16_8 = (-u_xlat16_0.x) + 1.0;
    u_xlat16_8 = u_xlat16_5 * u_xlat16_8 + u_xlat16_0.x;
    u_xlat16_11 = u_xlat16_8 + (-_outlineClip);
    u_xlat16_2 = u_xlat16_8 * u_xlat16_2;
    u_xlat16_2 = u_xlat16_5 * u_xlat16_2;
    u_xlat16_0.w = u_xlat16_2 * _outlineColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1.x = !!(u_xlat16_11<0.0);
#else
    u_xlatb1.x = u_xlat16_11<0.0;
#endif
    if(u_xlatb1.x){discard;}
    u_xlat16_0.xyz = _outlineColor.xyz;
    SV_Target0 = u_xlat16_0;
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
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 111577
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
bvec2 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_40;
bool u_xlatb40;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat58 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat58 = fract(u_xlat58);
    u_xlat16_5.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat6.xy = u_xlat6.xy * vec2(_inkFlowScale);
    u_xlat6.xy = (-u_xlat6.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_6 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_21.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat58 = _inkFlowSpeed * _Time.y;
    u_xlat58 = fract(u_xlat58);
    u_xlat5.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat58 = (-u_xlat58) + 0.5;
    u_xlat58 = u_xlat58 + u_xlat58;
    u_xlat5.xy = u_xlat5.xy * vec2(_inkFlowScale);
    u_xlat5.xy = (-u_xlat5.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + (-u_xlat16_8.yzx);
    u_xlat16_56 = (-u_xlat16_5.w) + u_xlat16_6.w;
    u_xlat16_56 = abs(u_xlat58) * u_xlat16_56 + u_xlat16_5.w;
    u_xlat16_21.xyz = u_xlat16_21.xyz * abs(vec3(u_xlat58));
    u_xlat16_21.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + u_xlat16_21.zxy;
    u_xlat16_7.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat59 = (-u_xlat5.x) * u_xlat16_19.x + u_xlat5.x;
    u_xlat59 = u_xlat5.x * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat5.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat63;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat59 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat13.xyz = vec3(u_xlat40) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat22 + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat16_19.x / u_xlat40;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat59 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat59;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat59 + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat59 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat59) * u_xlat16_19.x + u_xlat59;
    u_xlat64 = u_xlat59 * u_xlat64 + u_xlat16_19.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat59 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat63 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat40 = u_xlat40 * u_xlat64;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat40);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat59) * u_xlat13.xyz;
    u_xlat16_37 = u_xlat59 + (-_toonLambertThreshold);
    u_xlat16_37 = u_xlat16_37 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_55 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_55 = max(u_xlat16_55, 6.10351563e-05);
    u_xlat16_3.x = inversesqrt(u_xlat16_55);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat9.xyz;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb40 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb40)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat40);
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat18.x + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat36);
    u_xlat18.xyz = vec3(u_xlat54) * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat22 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat40 = (-u_xlat22) * u_xlat16_19.x + u_xlat22;
    u_xlat40 = u_xlat22 * u_xlat40 + u_xlat16_19.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat22;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat63;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat40;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    u_xlat16_3.x = u_xlat16_55 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = float(1.0) / float(u_xlat16_55);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_3.x;
    u_xlat16_55 = max(u_xlat16_16.x, u_xlat16_55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_3.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_55;
    u_xlat16_15.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_1.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_1.x = u_xlat16_37 * u_xlat16_1.x;
    u_xlat16_16.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * u_xlat16_16.xyz + _toonLambertColor.zxy;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz * vec3(u_xlat22) + u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_61 = (-u_xlat16_57) + u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_61 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_17.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_15.y = u_xlat16_16.y;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_2.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_16.xyz, u_xlat18.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_8.w);
    u_xlat16_20 = u_xlat16_2.x + 1.0;
    u_xlat16_20 = min(u_xlat16_20, 15.0);
    u_xlat16_8.x = u_xlat16_20 * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_8.x = u_xlat16_2.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20 = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20 + u_xlat16_40;
    u_xlat16_2.x = u_xlat16_61 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_20 = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_3.yzx + u_xlat16_14.yzx;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _emissiveColor.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat3.x = u_xlat54 * 0.0625 + u_xlat3.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb18.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_19.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_19.x : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_56;
    u_xlat16_19.x = u_xlat16_1.x * _albedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_19.x : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
mediump vec3 u_xlat16_18;
ivec3 u_xlati18;
bvec2 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_40;
bool u_xlatb40;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat58 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat58 = fract(u_xlat58);
    u_xlat16_5.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat6.xy = u_xlat6.xy * vec2(_inkFlowScale);
    u_xlat6.xy = (-u_xlat6.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_6 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_21.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat58 = _inkFlowSpeed * _Time.y;
    u_xlat58 = fract(u_xlat58);
    u_xlat5.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat58 = (-u_xlat58) + 0.5;
    u_xlat58 = u_xlat58 + u_xlat58;
    u_xlat5.xy = u_xlat5.xy * vec2(_inkFlowScale);
    u_xlat5.xy = (-u_xlat5.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7.xyz = u_xlat16_5.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz;
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + (-u_xlat16_8.yzx);
    u_xlat16_56 = (-u_xlat16_5.w) + u_xlat16_6.w;
    u_xlat16_56 = abs(u_xlat58) * u_xlat16_56 + u_xlat16_5.w;
    u_xlat16_21.xyz = u_xlat16_21.xyz * abs(vec3(u_xlat58));
    u_xlat16_21.xyz = u_xlat16_5.zxy * u_xlat16_7.xyz + u_xlat16_21.zxy;
    u_xlat16_7.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat59 = (-u_xlat5.x) * u_xlat16_19.x + u_xlat5.x;
    u_xlat59 = u_xlat5.x * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat5.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat63;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat59 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat13.xyz = vec3(u_xlat40) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat22 + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat16_19.x / u_xlat40;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat59 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat59;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat59 + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat59 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat59) * u_xlat16_19.x + u_xlat59;
    u_xlat64 = u_xlat59 * u_xlat64 + u_xlat16_19.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat59 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat63 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat40 = u_xlat40 * u_xlat64;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat40);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.zxy;
    u_xlat13.xyz = vec3(u_xlat59) * u_xlat13.xyz;
    u_xlat16_37 = u_xlat59 + (-_toonLambertThreshold);
    u_xlat16_37 = u_xlat16_37 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_55 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_55 = max(u_xlat16_55, 6.10351563e-05);
    u_xlat16_3.x = inversesqrt(u_xlat16_55);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat9.xyz;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb40 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb40)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat40);
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat18.x + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat36);
    u_xlat18.xyz = vec3(u_xlat54) * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat22 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat40 = (-u_xlat22) * u_xlat16_19.x + u_xlat22;
    u_xlat40 = u_xlat22 * u_xlat40 + u_xlat16_19.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat22;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat63;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat40;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.zxy;
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    u_xlat16_3.x = u_xlat16_55 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = float(1.0) / float(u_xlat16_55);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_3.x;
    u_xlat16_55 = max(u_xlat16_16.x, u_xlat16_55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_3.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_55;
    u_xlat16_15.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_1.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_1.x = u_xlat16_37 * u_xlat16_1.x;
    u_xlat16_16.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * u_xlat16_16.xyz + _toonLambertColor.zxy;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz * vec3(u_xlat22) + u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_61 = (-u_xlat16_57) + u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_61 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_17.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.zxy;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_15.y = u_xlat16_16.y;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_2.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_16.xyz, u_xlat18.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_8.w);
    u_xlat16_20 = u_xlat16_2.x + 1.0;
    u_xlat16_20 = min(u_xlat16_20, 15.0);
    u_xlat16_8.x = u_xlat16_20 * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_8.x = u_xlat16_2.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20 = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20 + u_xlat16_40;
    u_xlat16_2.x = u_xlat16_61 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_20 = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.yzx * u_xlat16_3.yzx + u_xlat16_14.yzx;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.zxy * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _emissiveColor.zxy;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat3.x = u_xlat54 * 0.0625 + u_xlat3.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_18.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb18.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_19.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_19.x : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_56;
    u_xlat16_19.x = u_xlat16_1.x * _albedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_19.x : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bvec2 u_xlatb18;
vec3 u_xlat19;
float u_xlat20;
vec3 u_xlat22;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
vec2 u_xlat38;
float u_xlat44;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
bool u_xlatb55;
float u_xlat56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
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
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat8.yyyy;
    u_xlat2 = u_xlat2 * u_xlat8.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat8.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat54 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat2.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_28 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat20 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat20 = fract(u_xlat20);
    u_xlat16_3.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat38.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = vec2(u_xlat20) * u_xlat38.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_inkFlowScale);
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_3.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat3.xy);
    u_xlat16_10.xzw = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_4.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat20 = _inkFlowSpeed * _Time.y;
    u_xlat20 = fract(u_xlat20);
    u_xlat38.xy = vec2(u_xlat20) * u_xlat38.xy;
    u_xlat20 = (-u_xlat20) + 0.5;
    u_xlat20 = u_xlat20 + u_xlat20;
    u_xlat38.xy = u_xlat38.xy * vec2(_inkFlowScale);
    u_xlat38.xy = (-u_xlat38.xy) * u_xlat16_3.zz + vs_TEXCOORD3.xy;
    u_xlat16_3 = texture(_albedoMap, u_xlat38.xy);
    u_xlat16_12.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_4.xyz * u_xlat16_10.xzw + (-u_xlat16_13.yzx);
    u_xlat16_65 = (-u_xlat16_3.w) + u_xlat16_4.w;
    u_xlat16_65 = abs(u_xlat20) * u_xlat16_65 + u_xlat16_3.w;
    u_xlat16_10.xzw = abs(vec3(u_xlat20)) * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_12.xyz + u_xlat16_10.wxz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat56 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat56) * vec3(u_xlat16_28) + u_xlat2.xyz;
    u_xlat16_28 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat3.x = (-u_xlat54) * u_xlat16_28 + u_xlat54;
    u_xlat3.x = u_xlat54 * u_xlat3.x + u_xlat16_28;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat54 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat8.x) * u_xlat16_28 + u_xlat8.x;
    u_xlat57 = u_xlat8.x * u_xlat57 + u_xlat16_28;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat3.w = u_xlat57 + u_xlat8.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat61 = u_xlat16_28 + -1.0;
    u_xlat55 = u_xlat55 * u_xlat61 + 1.0;
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat16_28 / u_xlat55;
    u_xlat55 = u_xlat55 * 0.318309873;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat55 = u_xlat3.x * u_xlat55;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat55);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat55 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat9.xyz = vec3(u_xlat55) * u_xlat9.xyz;
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat55 * u_xlat61 + 1.0;
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat16_28 / u_xlat55;
    u_xlat55 = u_xlat55 * 0.318309873;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat3.x = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat3.x * u_xlat3.x;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat44 = (-u_xlat16_66) * u_xlat3.x + 1.0;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat3.x) * u_xlat16_28 + u_xlat3.x;
    u_xlat44 = u_xlat3.x * u_xlat44 + u_xlat16_28;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat3.x + u_xlat44;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat3.w * u_xlat44;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat55 = u_xlat55 * u_xlat44;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat55);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xyz;
    u_xlat16_66 = u_xlat3.x + (-_toonLambertThreshold);
    u_xlat16_66 = u_xlat16_66 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_16.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat55 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat1.xyz = vec3(u_xlat55) * u_xlat1.xyz;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat61 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_28 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat19.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat19.x;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat37 = (-u_xlat16_60) * u_xlat19.x + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat19.xyz = u_xlat16_12.xyz * vec3(u_xlat37);
    u_xlat19.xyz = vec3(u_xlat56) * vec3(u_xlat16_60) + u_xlat19.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat20 = (-u_xlat2.x) * u_xlat16_28 + u_xlat2.x;
    u_xlat20 = u_xlat2.x * u_xlat20 + u_xlat16_28;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = u_xlat20 + u_xlat2.x;
    u_xlat20 = u_xlat20 + 6.10351563e-05;
    u_xlat20 = u_xlat20 * u_xlat3.w;
    u_xlat20 = float(1.0) / u_xlat20;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat20;
    u_xlat1.xyz = u_xlat19.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat2.xxx * u_xlat1.xyz;
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_16.x, u_xlat16_67);
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_68 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_68);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_60 = u_xlat16_66 * -2.0 + 3.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_16.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.zxy;
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat54) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_60) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_66 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = u_xlat16_60 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_68 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_68) + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_28) * u_xlat19.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_28 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_2.w);
    u_xlat16_11.x = u_xlat16_28 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_28 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_28 = u_xlat16_11.z * 15.0 + (-u_xlat16_28);
    u_xlat16_11.x = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_11.x + u_xlat16_36;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat0.x = u_xlat1.x * u_xlat16_28;
    u_xlat16_28 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat0.x * u_xlat16_11.x + u_xlat16_28;
    u_xlat16_11.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_29 = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + u_xlat16_11.x;
    u_xlat16_28 = u_xlat0.y * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_3.z, u_xlat16_28);
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_12.yzx + u_xlat16_14.yzx;
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_11.xyz * _emissiveColor.www + u_xlat16_10.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_10.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_10.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_10.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_10.x = (u_xlatb18.x) ? u_xlat16_10.x : 1.0;
    u_xlat16_10.x = (u_xlatb18.y) ? u_xlat16_10.y : u_xlat16_10.x;
    u_xlat16_28 = (-u_xlat16_10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_10.x = (u_xlatb18.x) ? u_xlat16_28 : u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_0.x + u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_10.x = u_xlat16_10.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_65;
    u_xlat16_28 = u_xlat16_10.x * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_28 : u_xlat16_10.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
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
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bvec2 u_xlatb18;
vec3 u_xlat19;
float u_xlat20;
vec3 u_xlat22;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
float u_xlat37;
vec2 u_xlat38;
float u_xlat44;
float u_xlat54;
bool u_xlatb54;
float u_xlat55;
bool u_xlatb55;
float u_xlat56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
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
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat8.yyyy;
    u_xlat2 = u_xlat2 * u_xlat8.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat8.zzzz + u_xlat2;
    u_xlat0 = u_xlat0 + u_xlat1;
    u_xlat1.x = _ShadowBias.x / u_xlat0.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat0.z + (-u_xlat1.x);
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat1.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat2.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat54 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat2.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat2.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat2.x * u_xlat2.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat2.x * u_xlat16_10.x;
    u_xlat16_28 = u_xlat2.x * u_xlat16_10.x;
    u_xlat2.x = (-u_xlat16_10.x) * u_xlat2.x + 1.0;
    u_xlat20 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat20 = fract(u_xlat20);
    u_xlat16_3.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat38.xy = u_xlat16_3.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat3.xy = vec2(u_xlat20) * u_xlat38.xy;
    u_xlat3.xy = u_xlat3.xy * vec2(_inkFlowScale);
    u_xlat3.xy = (-u_xlat3.xy) * u_xlat16_3.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat3.xy);
    u_xlat16_10.xzw = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_4.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat20 = _inkFlowSpeed * _Time.y;
    u_xlat20 = fract(u_xlat20);
    u_xlat38.xy = vec2(u_xlat20) * u_xlat38.xy;
    u_xlat20 = (-u_xlat20) + 0.5;
    u_xlat20 = u_xlat20 + u_xlat20;
    u_xlat38.xy = u_xlat38.xy * vec2(_inkFlowScale);
    u_xlat38.xy = (-u_xlat38.xy) * u_xlat16_3.zz + vs_TEXCOORD3.xy;
    u_xlat16_3 = texture(_albedoMap, u_xlat38.xy);
    u_xlat16_12.xyz = u_xlat16_3.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_3.zxy * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_4.xyz * u_xlat16_10.xzw + (-u_xlat16_13.yzx);
    u_xlat16_65 = (-u_xlat16_3.w) + u_xlat16_4.w;
    u_xlat16_65 = abs(u_xlat20) * u_xlat16_65 + u_xlat16_3.w;
    u_xlat16_10.xzw = abs(vec3(u_xlat20)) * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_3.zxy * u_xlat16_12.xyz + u_xlat16_10.wxz;
    u_xlat16_12.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat2.xyz = u_xlat2.xxx * u_xlat16_12.xyz;
    u_xlat56 = u_xlat16_12.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat2.xyz = vec3(u_xlat56) * vec3(u_xlat16_28) + u_xlat2.xyz;
    u_xlat16_28 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat3.x = (-u_xlat54) * u_xlat16_28 + u_xlat54;
    u_xlat3.x = u_xlat54 * u_xlat3.x + u_xlat16_28;
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat54 + u_xlat3.x;
    u_xlat16_13.xyz = u_xlat1.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat8.x) * u_xlat16_28 + u_xlat8.x;
    u_xlat57 = u_xlat8.x * u_xlat57 + u_xlat16_28;
    u_xlat57 = sqrt(u_xlat57);
    u_xlat3.w = u_xlat57 + u_xlat8.x;
    u_xlat3.xw = u_xlat3.xw + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat3.x = u_xlat3.x * u_xlat3.w;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat3.x = min(u_xlat3.x, 16.0);
    u_xlat61 = u_xlat16_28 + -1.0;
    u_xlat55 = u_xlat55 * u_xlat61 + 1.0;
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat16_28 / u_xlat55;
    u_xlat55 = u_xlat55 * 0.318309873;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat55 = u_xlat3.x * u_xlat55;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat55);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.zxy;
    u_xlat2.xyz = vec3(u_xlat54) * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat16_11.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat18.xxx * u_xlat2.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat55 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat9.xyz = vec3(u_xlat55) * u_xlat9.xyz;
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat55 * u_xlat61 + 1.0;
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat16_28 / u_xlat55;
    u_xlat55 = u_xlat55 * 0.318309873;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat3.x = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat3.x * u_xlat3.x;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat44 = (-u_xlat16_66) * u_xlat3.x + 1.0;
    u_xlat16_66 = u_xlat3.x * u_xlat16_66;
    u_xlat9.xyz = u_xlat16_12.xyz * vec3(u_xlat44);
    u_xlat9.xyz = vec3(u_xlat56) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat3.x) * u_xlat16_28 + u_xlat3.x;
    u_xlat44 = u_xlat3.x * u_xlat44 + u_xlat16_28;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat3.x + u_xlat44;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat44 = u_xlat3.w * u_xlat44;
    u_xlat44 = float(1.0) / u_xlat44;
    u_xlat44 = min(u_xlat44, 16.0);
    u_xlat55 = u_xlat55 * u_xlat44;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat55);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.zxy;
    u_xlat9.xyz = u_xlat3.xxx * u_xlat9.xyz;
    u_xlat16_66 = u_xlat3.x + (-_toonLambertThreshold);
    u_xlat16_66 = u_xlat16_66 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = u_xlat2.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_16.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat55 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat1.xyz = vec3(u_xlat55) * u_xlat1.xyz;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat1.x * u_xlat61 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_28 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat19.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat19.x;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat37 = (-u_xlat16_60) * u_xlat19.x + 1.0;
    u_xlat16_60 = u_xlat19.x * u_xlat16_60;
    u_xlat19.xyz = u_xlat16_12.xyz * vec3(u_xlat37);
    u_xlat19.xyz = vec3(u_xlat56) * vec3(u_xlat16_60) + u_xlat19.xyz;
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat20 = (-u_xlat2.x) * u_xlat16_28 + u_xlat2.x;
    u_xlat20 = u_xlat2.x * u_xlat20 + u_xlat16_28;
    u_xlat20 = sqrt(u_xlat20);
    u_xlat20 = u_xlat20 + u_xlat2.x;
    u_xlat20 = u_xlat20 + 6.10351563e-05;
    u_xlat20 = u_xlat20 * u_xlat3.w;
    u_xlat20 = float(1.0) / u_xlat20;
    u_xlat20 = min(u_xlat20, 16.0);
    u_xlat1.x = u_xlat1.x * u_xlat20;
    u_xlat1.xyz = u_xlat19.xyz * u_xlat1.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = u_xlat1.xyz * _directSpecularColor.zxy;
    u_xlat1.xyz = u_xlat2.xxx * u_xlat1.xyz;
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_16.x, u_xlat16_67);
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_68 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_68);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat1.xyz * u_xlat18.xxx + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_60 = u_xlat16_66 * -2.0 + 3.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_16.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.zxy;
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat54) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat18.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat2.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_60) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_66 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = u_xlat16_60 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_67));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_68 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat0.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_68) + (-u_xlat16_13.xyz);
    u_xlat1.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat0.xzw);
    u_xlat16_11.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_28) * u_xlat19.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_28 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_2.w);
    u_xlat16_11.x = u_xlat16_28 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_2.x = u_xlat16_28 * 16.0 + u_xlat16_2.z;
    u_xlat16_11.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_28 = u_xlat16_11.z * 15.0 + (-u_xlat16_28);
    u_xlat16_11.x = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_11.x + u_xlat16_36;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat0.x = u_xlat1.x * u_xlat16_28;
    u_xlat16_28 = u_xlat0.y * 0.5;
    u_xlat16_11.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat0.x * u_xlat16_11.x + u_xlat16_28;
    u_xlat16_11.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_29 = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + u_xlat16_11.x;
    u_xlat16_28 = u_xlat0.y * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_3.z, u_xlat16_28);
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.yzx * u_xlat16_12.yzx + u_xlat16_14.yzx;
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_0.zxy * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_11.xyz * _emissiveColor.www + u_xlat16_10.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_10.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_10.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_10.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_10.x = (u_xlatb18.x) ? u_xlat16_10.x : 1.0;
    u_xlat16_10.x = (u_xlatb18.y) ? u_xlat16_10.y : u_xlat16_10.x;
    u_xlat16_28 = (-u_xlat16_10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_10.x = (u_xlatb18.x) ? u_xlat16_28 : u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_0.x + u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_10.x = u_xlat16_10.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_65;
    u_xlat16_28 = u_xlat16_10.x * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_28 : u_xlat16_10.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
bvec2 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_40;
bool u_xlatb40;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat58 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat58 = fract(u_xlat58);
    u_xlat16_5.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat6.xy = u_xlat6.xy * vec2(_inkFlowScale);
    u_xlat6.xy = (-u_xlat6.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_6 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_21.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat58 = _inkFlowSpeed * _Time.y;
    u_xlat58 = fract(u_xlat58);
    u_xlat5.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat58 = (-u_xlat58) + 0.5;
    u_xlat58 = u_xlat58 + u_xlat58;
    u_xlat5.xy = u_xlat5.xy * vec2(_inkFlowScale);
    u_xlat5.xy = (-u_xlat5.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + (-u_xlat16_8.xyz);
    u_xlat16_56 = (-u_xlat16_5.w) + u_xlat16_6.w;
    u_xlat16_56 = abs(u_xlat58) * u_xlat16_56 + u_xlat16_5.w;
    u_xlat16_21.xyz = u_xlat16_21.xyz * abs(vec3(u_xlat58));
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + u_xlat16_21.xyz;
    u_xlat16_7.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat59 = (-u_xlat5.x) * u_xlat16_19.x + u_xlat5.x;
    u_xlat59 = u_xlat5.x * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat5.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat63;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat59 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat13.xyz = vec3(u_xlat40) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat22 + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat16_19.x / u_xlat40;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat59 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat59;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat59 + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat59 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat59) * u_xlat16_19.x + u_xlat59;
    u_xlat64 = u_xlat59 * u_xlat64 + u_xlat16_19.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat59 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat63 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat40 = u_xlat40 * u_xlat64;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat40);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat59) * u_xlat13.xyz;
    u_xlat16_37 = u_xlat59 + (-_toonLambertThreshold);
    u_xlat16_37 = u_xlat16_37 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_55 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_55 = max(u_xlat16_55, 6.10351563e-05);
    u_xlat16_3.x = inversesqrt(u_xlat16_55);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat9.xyz;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb40 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb40)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat40);
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat18.x + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat36);
    u_xlat18.xyz = vec3(u_xlat54) * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat22 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat40 = (-u_xlat22) * u_xlat16_19.x + u_xlat22;
    u_xlat40 = u_xlat22 * u_xlat40 + u_xlat16_19.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat22;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat63;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat40;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    u_xlat16_3.x = u_xlat16_55 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = float(1.0) / float(u_xlat16_55);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_3.x;
    u_xlat16_55 = max(u_xlat16_16.x, u_xlat16_55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_3.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_55;
    u_xlat16_15.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_1.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_1.x = u_xlat16_37 * u_xlat16_1.x;
    u_xlat16_16.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * u_xlat16_16.xyz + _toonLambertColor.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz * vec3(u_xlat22) + u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_61 = (-u_xlat16_57) + u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_61 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_17.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_15.y = u_xlat16_16.y;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_2.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_16.xyz, u_xlat18.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_8.w);
    u_xlat16_20 = u_xlat16_2.x + 1.0;
    u_xlat16_20 = min(u_xlat16_20, 15.0);
    u_xlat16_8.x = u_xlat16_20 * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_8.x = u_xlat16_2.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20 = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20 + u_xlat16_40;
    u_xlat16_2.x = u_xlat16_61 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_20 = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_14.xyz;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb18.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_19.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_19.x : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_56;
    u_xlat16_19.x = u_xlat16_1.x * _albedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_19.x : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec2 u_xlat16_4;
vec2 u_xlat5;
mediump vec4 u_xlat16_5;
vec2 u_xlat6;
mediump vec4 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec4 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec4 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
ivec3 u_xlati18;
bvec2 u_xlatb18;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
mediump vec3 u_xlat16_21;
float u_xlat22;
mediump float u_xlat16_22;
float u_xlat36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_37;
mediump float u_xlat16_38;
float u_xlat40;
mediump float u_xlat16_40;
bool u_xlatb40;
float u_xlat54;
bool u_xlatb54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
mediump float u_xlat16_57;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_61;
mediump float u_xlat16_62;
float u_xlat63;
float u_xlat64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_19.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_19.x = (-u_xlat16_19.x) * u_xlat16_19.x + 1.0;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_37 = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_19.x * u_xlat16_37;
    u_xlat16_19.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_19.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_19.x);
#endif
    u_xlat16_19.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_19.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_19.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_19.xyz = u_xlat16_2.xyz * u_xlat16_19.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_19.xyz);
    u_xlat16_2.x = u_xlat16_2.x * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_20 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_20, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat4.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_19.xyz;
    u_xlat54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat4.xyz = vec3(u_xlat54) * u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_19.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat54 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = u_xlat54 * u_xlat54;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_56 = u_xlat54 * u_xlat16_56;
    u_xlat16_3.x = u_xlat54 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat54 + 1.0;
    u_xlat58 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat58 = fract(u_xlat58);
    u_xlat16_5.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = u_xlat16_5.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat6.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat6.xy = u_xlat6.xy * vec2(_inkFlowScale);
    u_xlat6.xy = (-u_xlat6.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_6 = texture(_albedoMap, u_xlat6.xy);
    u_xlat16_21.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat58 = _inkFlowSpeed * _Time.y;
    u_xlat58 = fract(u_xlat58);
    u_xlat5.xy = vec2(u_xlat58) * u_xlat5.xy;
    u_xlat58 = (-u_xlat58) + 0.5;
    u_xlat58 = u_xlat58 + u_xlat58;
    u_xlat5.xy = u_xlat5.xy * vec2(_inkFlowScale);
    u_xlat5.xy = (-u_xlat5.xy) * u_xlat16_5.zz + vs_TEXCOORD3.xy;
    u_xlat16_5 = texture(_albedoMap, u_xlat5.xy);
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz;
    u_xlat16_21.xyz = u_xlat16_6.xyz * u_xlat16_21.xyz + (-u_xlat16_8.xyz);
    u_xlat16_56 = (-u_xlat16_5.w) + u_xlat16_6.w;
    u_xlat16_56 = abs(u_xlat58) * u_xlat16_56 + u_xlat16_5.w;
    u_xlat16_21.xyz = u_xlat16_21.xyz * abs(vec3(u_xlat58));
    u_xlat16_21.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + u_xlat16_21.xyz;
    u_xlat16_7.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_5 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_7.xyz = u_xlat16_5.www * u_xlat16_7.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_8.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_21.xyz = u_xlat16_21.xyz * u_xlat16_7.xyz;
    u_xlat16_6.xy = u_xlat16_5.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_7.xyz = u_xlat16_6.yyy * u_xlat16_8.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_7.xyz;
    u_xlat54 = u_xlat16_7.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat9.xyz = vec3(u_xlat54) * u_xlat16_3.xxx + u_xlat9.xyz;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat16_3.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_8.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_3.xxx + vs_TEXCOORD2.yzx;
    u_xlat58 = dot(u_xlat16_8.xyz, u_xlat16_8.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat16_8.xyz;
    u_xlat12.xyz = u_xlat11.xyz * vs_TEXCOORD1.zxy;
    u_xlat12.xyz = vs_TEXCOORD1.yzx * u_xlat11.yzx + (-u_xlat12.xyz);
    u_xlat12.xyz = u_xlat12.xzy * vs_TEXCOORD2.www;
    u_xlat10.y = u_xlat12.x;
    u_xlat10.x = u_xlat11.z;
    u_xlat16_13.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_13.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat10.x = dot(u_xlat16_8.xyz, u_xlat10.xyz);
    u_xlat12.x = u_xlat11.y;
    u_xlat11.y = u_xlat12.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat16_8.xyz, u_xlat11.xyz);
    u_xlat12.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat16_8.xyz, u_xlat12.xyz);
    u_xlat58 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat58 = max(u_xlat58, 1.17549435e-38);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xyz = vec3(u_xlat58) * u_xlat10.xyz;
    u_xlat5.x = dot(u_xlat11.xyz, u_xlat16_19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat5.x = min(max(u_xlat5.x, 0.0), 1.0);
#else
    u_xlat5.x = clamp(u_xlat5.x, 0.0, 1.0);
#endif
    u_xlat16_19.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat16_19.x = u_xlat16_19.x * u_xlat16_19.x;
    u_xlat16_19.x = max(u_xlat16_19.x, 0.0078125);
    u_xlat59 = (-u_xlat5.x) * u_xlat16_19.x + u_xlat5.x;
    u_xlat59 = u_xlat5.x * u_xlat59 + u_xlat16_19.x;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat59 + u_xlat5.x;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat16_8.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat12.x = dot(u_xlat11.xyz, u_xlat16_8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat12.x) * u_xlat16_19.x + u_xlat12.x;
    u_xlat63 = u_xlat12.x * u_xlat63 + u_xlat16_19.x;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat12.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat59 = u_xlat59 * u_xlat63;
    u_xlat59 = float(1.0) / u_xlat59;
    u_xlat59 = min(u_xlat59, 16.0);
    u_xlat4.x = dot(u_xlat11.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat22 = u_xlat16_19.x + -1.0;
    u_xlat4.x = u_xlat4.x * u_xlat22 + 1.0;
    u_xlat4.x = u_xlat4.x * u_xlat4.x;
    u_xlat4.x = u_xlat16_19.x / u_xlat4.x;
    u_xlat4.x = u_xlat4.x * 0.318309873;
    u_xlat4.x = min(u_xlat4.x, 16.0);
    u_xlat4.x = u_xlat59 * u_xlat4.x;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat4.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat5.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat16_2.xyz * u_xlat9.xyz;
    u_xlat16_4.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat4.x = u_xlat16_4.x * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat4.xxx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat0.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat40 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat13.xyz = vec3(u_xlat40) * u_xlat13.xyz;
    u_xlat16_37 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat40 = dot(u_xlat11.xyz, u_xlat13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat40 = min(max(u_xlat40, 0.0), 1.0);
#else
    u_xlat40 = clamp(u_xlat40, 0.0, 1.0);
#endif
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat40 * u_xlat22 + 1.0;
    u_xlat40 = u_xlat40 * u_xlat40;
    u_xlat40 = u_xlat16_19.x / u_xlat40;
    u_xlat40 = u_xlat40 * 0.318309873;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat59 = (-u_xlat16_37) + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat59;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat64 = (-u_xlat16_37) * u_xlat59 + 1.0;
    u_xlat16_37 = u_xlat59 * u_xlat16_37;
    u_xlat13.xyz = u_xlat16_7.xyz * vec3(u_xlat64);
    u_xlat13.xyz = vec3(u_xlat54) * vec3(u_xlat16_37) + u_xlat13.xyz;
    u_xlat59 = dot(u_xlat11.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat59 = min(max(u_xlat59, 0.0), 1.0);
#else
    u_xlat59 = clamp(u_xlat59, 0.0, 1.0);
#endif
    u_xlat64 = (-u_xlat59) * u_xlat16_19.x + u_xlat59;
    u_xlat64 = u_xlat59 * u_xlat64 + u_xlat16_19.x;
    u_xlat64 = sqrt(u_xlat64);
    u_xlat64 = u_xlat59 + u_xlat64;
    u_xlat64 = u_xlat64 + 6.10351563e-05;
    u_xlat64 = u_xlat63 * u_xlat64;
    u_xlat64 = float(1.0) / u_xlat64;
    u_xlat64 = min(u_xlat64, 16.0);
    u_xlat40 = u_xlat40 * u_xlat64;
    u_xlat13.xyz = u_xlat13.xyz * vec3(u_xlat40);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.xyz = min(max(u_xlat13.xyz, 0.0), 1.0);
#else
    u_xlat13.xyz = clamp(u_xlat13.xyz, 0.0, 1.0);
#endif
    u_xlat13.xyz = u_xlat13.xyz * _directSpecularColor.xyz;
    u_xlat13.xyz = vec3(u_xlat59) * u_xlat13.xyz;
    u_xlat16_37 = u_xlat59 + (-_toonLambertThreshold);
    u_xlat16_37 = u_xlat16_37 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_37 = min(max(u_xlat16_37, 0.0), 1.0);
#else
    u_xlat16_37 = clamp(u_xlat16_37, 0.0, 1.0);
#endif
    u_xlat16_14.xyz = u_xlat13.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat9.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_55 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_55 = max(u_xlat16_55, 6.10351563e-05);
    u_xlat16_3.x = inversesqrt(u_xlat16_55);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat9.xyz;
    u_xlat16_3.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb40 = !!(0.00100000005>=abs(u_xlat16_3.x));
#else
    u_xlatb40 = 0.00100000005>=abs(u_xlat16_3.x);
#endif
    u_xlat16_16.xy = (bool(u_xlatb40)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_1.xxx + u_xlat16_15.xyz;
    u_xlat40 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat40 = inversesqrt(u_xlat40);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat40);
    u_xlat16_1.x = dot(u_xlat16_15.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat0.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat22 + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat16_19.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * 0.318309873;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat18.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat18.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat36 = (-u_xlat16_1.x) * u_xlat18.x + 1.0;
    u_xlat16_1.x = u_xlat18.x * u_xlat16_1.x;
    u_xlat9.xyz = u_xlat16_7.xyz * vec3(u_xlat36);
    u_xlat18.xyz = vec3(u_xlat54) * u_xlat16_1.xxx + u_xlat9.xyz;
    u_xlat22 = dot(u_xlat11.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22 = min(max(u_xlat22, 0.0), 1.0);
#else
    u_xlat22 = clamp(u_xlat22, 0.0, 1.0);
#endif
    u_xlat16_1.x = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_1.x = u_xlat16_1.x * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat40 = (-u_xlat22) * u_xlat16_19.x + u_xlat22;
    u_xlat40 = u_xlat22 * u_xlat40 + u_xlat16_19.x;
    u_xlat40 = sqrt(u_xlat40);
    u_xlat40 = u_xlat40 + u_xlat22;
    u_xlat40 = u_xlat40 + 6.10351563e-05;
    u_xlat40 = u_xlat40 * u_xlat63;
    u_xlat40 = float(1.0) / u_xlat40;
    u_xlat40 = min(u_xlat40, 16.0);
    u_xlat0.x = u_xlat0.x * u_xlat40;
    u_xlat0.xyz = u_xlat18.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = u_xlat0.xyz * _directSpecularColor.xyz;
    u_xlat0.xyz = vec3(u_xlat22) * u_xlat0.xyz;
    u_xlat16_3.x = u_xlat16_55 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_55 = float(1.0) / float(u_xlat16_55);
    u_xlat16_3.x = (-u_xlat16_3.x) * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0);
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_55 = u_xlat16_55 * u_xlat16_3.x;
    u_xlat16_55 = max(u_xlat16_16.x, u_xlat16_55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_3.x = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_3.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_55;
    u_xlat16_15.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat0.xyz * u_xlat4.xxx + u_xlat16_14.xyz;
    u_xlat16_1.x = (-u_xlat16_5.y) * _metallicMultiplier + 1.0;
    u_xlat16_3.xyz = u_xlat16_1.xxx * u_xlat16_21.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_3.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat4.xxx * u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat4.xxx * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat5.xxx * u_xlat16_2.xyz;
    u_xlat16_1.x = u_xlat16_37 * -2.0 + 3.0;
    u_xlat16_37 = u_xlat16_37 * u_xlat16_37;
    u_xlat16_1.x = u_xlat16_37 * u_xlat16_1.x;
    u_xlat16_16.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_1.xzw = u_xlat16_1.xxx * u_xlat16_16.xyz + _toonLambertColor.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_1.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_1.xzw = u_xlat16_1.xzw * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_2.xyz;
    u_xlat16_1.xzw = u_xlat16_15.xyz * vec3(u_xlat22) + u_xlat16_1.xzw;
    u_xlat16_1.xzw = u_xlat16_14.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_3.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_3.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = (-u_xlat10.xyz) * vec3(u_xlat58) + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_16.xyz + u_xlat11.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_57 = inversesqrt(u_xlat16_57);
    u_xlat16_16.xyz = vec3(u_xlat16_57) * u_xlat16_16.xyz;
    u_xlat16_57 = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_57 = min(max(u_xlat16_57, 0.0), 1.0);
#else
    u_xlat16_57 = clamp(u_xlat16_57, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_57 * 0.5 + 0.5;
    u_xlat16_61 = (-u_xlat16_57) + u_xlat16_61;
    u_xlat16_62 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_6.w = _occlusionScale * u_xlat16_62 + 1.0;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_61 + u_xlat16_57;
    u_xlat16_57 = u_xlat16_6.w * u_xlat16_57;
    u_xlat16_61 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_61 = u_xlat16_61 + -1.0;
    u_xlat16_61 = _occlusionScale * u_xlat16_61 + 1.0;
    u_xlat16_57 = u_xlat16_57 * u_xlat16_61;
    u_xlat0.x = min(u_xlat16_57, 1.0);
    u_xlat18.x = min(u_xlat0.x, u_xlat16_5.z);
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat18.xxx * u_xlat16_15.xyz;
    u_xlat16_17.xyz = u_xlat16_3.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat18.xxx * u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat18.xxx + (-u_xlat16_17.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat18.xxx + u_xlat16_15.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _localDiffuseGI.xyz;
    u_xlat16_15.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_15.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_15.y = u_xlat16_16.y;
    u_xlat16_17.xyz = u_xlat16_15.xyz * u_xlat16_15.xyz;
    u_xlati18.xyz = ivec3(uvec3(lessThan(u_xlat16_15.xyzz, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati18.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_15.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati18.x = int(uint(uint(u_xlati18.x) & 1u));
    u_xlati36 = (u_xlati18.z != 0) ? 5 : 4;
    u_xlat16_15.xyw = u_xlat16_15.xxx * _IrradianceACCoeffs[u_xlati18.x].xyz + u_xlat16_17.xyz;
    u_xlat16_15.xyz = u_xlat16_15.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_15.xyw;
    u_xlat16_17.xyz = u_xlat16_15.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_57 = dot(u_xlat16_15.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_17.xyz;
    u_xlat16_1.xzw = u_xlat16_3.xyz * u_xlat16_2.xyz + u_xlat16_1.xzw;
    u_xlat16_2.x = dot((-u_xlat16_8.xyz), u_xlat11.xyz);
    u_xlat16_2.x = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat18.xyz = (-u_xlat11.xyz) * u_xlat16_2.xxx + (-u_xlat16_8.xyz);
    u_xlat4.x = dot(u_xlat16_16.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_6.z = dot(u_xlat16_16.xyz, u_xlat18.xyz);
    u_xlat16_2.xyz = u_xlat16_6.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.xyz = min(max(u_xlat16_2.xyz, 0.0), 1.0);
#else
    u_xlat16_2.xyz = clamp(u_xlat16_2.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.yzw = u_xlat16_2.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_2.x = floor(u_xlat16_8.w);
    u_xlat16_20 = u_xlat16_2.x + 1.0;
    u_xlat16_20 = min(u_xlat16_20, 15.0);
    u_xlat16_8.x = u_xlat16_20 * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_8.x = u_xlat16_2.x * 16.0 + u_xlat16_8.z;
    u_xlat16_3.xy = u_xlat16_8.xy + vec2(0.5, 0.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(0.00390625, 0.0625);
    u_xlat16_40 = texture(_SpecularOcclusionLut3D, u_xlat16_3.xy).x;
    u_xlat16_2.x = u_xlat16_2.z * 15.0 + (-u_xlat16_2.x);
    u_xlat16_20 = (-u_xlat16_40) + u_xlat16_22;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_20 + u_xlat16_40;
    u_xlat16_2.x = u_xlat16_61 * u_xlat16_2.x;
    u_xlat4.x = u_xlat4.x * u_xlat16_2.x;
    u_xlat16_2.x = u_xlat0.x * 0.5;
    u_xlat16_20 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_2.x = u_xlat4.x * u_xlat16_20 + u_xlat16_2.x;
    u_xlat16_20 = u_xlat16_2.x + u_xlat16_2.x;
    u_xlat16_38 = (-u_xlat16_2.x) * 2.0 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * u_xlat16_38 + u_xlat16_20;
    u_xlat16_2.x = u_xlat0.x * u_xlat16_2.x;
    u_xlat16_2.x = min(u_xlat16_2.x, u_xlat16_5.z);
    u_xlat4.xyz = u_xlat10.xyz * vec3(u_xlat58) + (-u_xlat18.xyz);
    u_xlat0.xyz = u_xlat16_19.xxx * u_xlat4.xyz + u_xlat18.xyz;
    u_xlat16_19.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_19.x;
    u_xlat16_19.x = u_xlat16_6.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_6.x);
    u_xlat12.y = u_xlat16_6.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_3.xyz = u_xlat16_7.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_19.x);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_8.xyz = vec3(u_xlat16_57) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_7.xyz = (bool(u_xlatb0)) ? u_xlat16_8.xyz : u_xlat16_7.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_7.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat16_3.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_1.xzw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_3.xyz + u_xlat16_14.xyz;
    u_xlat16_55 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_2.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_0.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat16_1.xyz = u_xlat16_2.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_2.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_2.xyz + u_xlat16_1.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb18.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_19.x = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb18.x) ? u_xlat16_19.x : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_56;
    u_xlat16_19.x = u_xlat16_1.x * _albedoColor.w + u_xlat16_55;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_19.x = min(max(u_xlat16_19.x, 0.0), 1.0);
#else
    u_xlat16_19.x = clamp(u_xlat16_19.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_19.x : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat19;
mediump float u_xlat16_19;
bvec2 u_xlatb19;
vec3 u_xlat20;
float u_xlat21;
vec3 u_xlat22;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump float u_xlat16_37;
int u_xlati37;
bool u_xlatb37;
float u_xlat38;
vec2 u_xlat39;
float u_xlat44;
float u_xlat55;
bool u_xlatb55;
float u_xlat56;
bool u_xlatb56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
float u_xlat63;
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
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_19 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19 * _shadowStrength;
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat19.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat55 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat3.xyz = vec3(u_xlat55) * u_xlat3.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat3.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_28 = u_xlat3.x * u_xlat16_10.x;
    u_xlat3.x = (-u_xlat16_10.x) * u_xlat3.x + 1.0;
    u_xlat21 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat21 = fract(u_xlat21);
    u_xlat16_4.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat39.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat39.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_inkFlowScale);
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat4.xy);
    u_xlat16_10.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_0.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21 = _inkFlowSpeed * _Time.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat39.xy = vec2(u_xlat21) * u_xlat39.xy;
    u_xlat21 = (-u_xlat21) + 0.5;
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat39.xy = u_xlat39.xy * vec2(_inkFlowScale);
    u_xlat39.xy = (-u_xlat39.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat39.xy);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_0.xyz * u_xlat16_10.xzw + (-u_xlat16_13.xyz);
    u_xlat16_65 = u_xlat16_0.w + (-u_xlat16_4.w);
    u_xlat16_65 = abs(u_xlat21) * u_xlat16_65 + u_xlat16_4.w;
    u_xlat16_10.xzw = abs(vec3(u_xlat21)) * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_4.xyz * u_xlat16_12.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_12.xyz;
    u_xlat57 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat57) * vec3(u_xlat16_28) + u_xlat3.xyz;
    u_xlat16_28 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat61 = (-u_xlat55) * u_xlat16_28 + u_xlat55;
    u_xlat61 = u_xlat55 * u_xlat61 + u_xlat16_28;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat55 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat8.x) * u_xlat16_28 + u_xlat8.x;
    u_xlat44 = u_xlat8.x * u_xlat44 + u_xlat16_28;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat8.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat44;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat62 = u_xlat16_28 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat56 = u_xlat61 * u_xlat56;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat55) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat19.xxx * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat61 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat61 * u_xlat61;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat9.x = (-u_xlat16_66) * u_xlat61 + 1.0;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat9.xxx;
    u_xlat9.xyz = vec3(u_xlat57) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat61) * u_xlat16_28 + u_xlat61;
    u_xlat63 = u_xlat61 * u_xlat63 + u_xlat16_28;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat61 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat44 * u_xlat63;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat56 = u_xlat56 * u_xlat63;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat16_66 = u_xlat61 + (-_toonLambertThreshold);
    u_xlat16_66 = u_xlat16_66 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = u_xlat3.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_16.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat56 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat2.xyz = vec3(u_xlat56) * u_xlat2.xyz;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat62 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_28 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat20.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat20.x * u_xlat20.x;
    u_xlat16_60 = u_xlat20.x * u_xlat16_60;
    u_xlat16_60 = u_xlat20.x * u_xlat16_60;
    u_xlat38 = (-u_xlat16_60) * u_xlat20.x + 1.0;
    u_xlat16_60 = u_xlat20.x * u_xlat16_60;
    u_xlat20.xyz = u_xlat16_12.xyz * vec3(u_xlat38);
    u_xlat20.xyz = vec3(u_xlat57) * vec3(u_xlat16_60) + u_xlat20.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat21 = (-u_xlat3.x) * u_xlat16_28 + u_xlat3.x;
    u_xlat21 = u_xlat3.x * u_xlat21 + u_xlat16_28;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat3.x;
    u_xlat21 = u_xlat21 + 6.10351563e-05;
    u_xlat21 = u_xlat21 * u_xlat44;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat21;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat3.xxx * u_xlat2.xyz;
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_16.x, u_xlat16_67);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_68 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_68);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_60 = u_xlat16_66 * -2.0 + 3.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_16.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat55) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat3.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_60) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_66 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = u_xlat16_60 * u_xlat16_66;
    u_xlat1.xy = min(u_xlat1.xz, vec2(u_xlat16_67));
    u_xlat1.x = min(u_xlat16_0.z, u_xlat1.x);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat1.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat1.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati37 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati37].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati37 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati37].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_68 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat1.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_68) + (-u_xlat16_13.xyz);
    u_xlat2.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat1.xzw);
    u_xlat16_11.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat1.xzw);
    u_xlat1.xzw = vec3(u_xlat16_28) * u_xlat20.xyz + u_xlat1.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat13.y = u_xlat1.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_28 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_1.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_1.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat1.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat1.xzw * u_xlat1.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb1)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_3.w);
    u_xlat16_11.x = u_xlat16_28 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_3.x = u_xlat16_11.x * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_3.x = u_xlat16_28 * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_37 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_28 = u_xlat16_11.z * 15.0 + (-u_xlat16_28);
    u_xlat16_11.x = (-u_xlat16_37) + u_xlat16_1.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_11.x + u_xlat16_37;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat1.x = u_xlat2.x * u_xlat16_28;
    u_xlat16_28 = u_xlat1.y * 0.5;
    u_xlat16_11.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat1.x * u_xlat16_11.x + u_xlat16_28;
    u_xlat16_11.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_29 = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + u_xlat16_11.x;
    u_xlat16_28 = u_xlat1.y * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_0.z, u_xlat16_28);
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * _emissiveColor.www + u_xlat16_10.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat1.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb37 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_10.xy = (bool(u_xlatb37)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat1.xy = u_xlat16_10.xy * _edgeDisturbParam.xy + u_xlat1.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_1.x = texture(_edgeNoiseMap, u_xlat1.xy).y;
    u_xlat19.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat19.xy = u_xlat16_10.xy * _edgeNoiseParam.xy + u_xlat19.xy;
    u_xlat1.xy = u_xlat16_1.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat19.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_1.x = texture(_edgeNoiseMap, u_xlat1.xy).x;
    u_xlatb19.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_10.x = (u_xlatb19.x) ? u_xlat16_10.x : 1.0;
    u_xlat16_10.x = (u_xlatb19.y) ? u_xlat16_10.y : u_xlat16_10.x;
    u_xlat16_28 = (-u_xlat16_10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb19.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_10.x = (u_xlatb19.x) ? u_xlat16_28 : u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_1.x + u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_10.x = u_xlat16_10.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_65;
    u_xlat16_28 = u_xlat16_10.x * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_28 : u_xlat16_10.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
ivec4 u_xlati1;
bool u_xlatb1;
vec4 u_xlat2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat19;
mediump float u_xlat16_19;
bvec2 u_xlatb19;
vec3 u_xlat20;
float u_xlat21;
vec3 u_xlat22;
mediump float u_xlat16_28;
mediump float u_xlat16_29;
mediump float u_xlat16_37;
int u_xlati37;
bool u_xlatb37;
float u_xlat38;
vec2 u_xlat39;
float u_xlat44;
float u_xlat55;
bool u_xlatb55;
float u_xlat56;
bool u_xlatb56;
float u_xlat57;
float u_xlat59;
mediump float u_xlat16_60;
float u_xlat61;
float u_xlat62;
float u_xlat63;
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
    u_xlat19.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat19.x = (-u_xlat1.x) + u_xlat19.x;
    u_xlat0.z = _ShadowBias.y * u_xlat19.x + u_xlat1.x;
    u_xlat1.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat1.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
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
    u_xlat2.xyz = u_xlat0.xyw + u_xlat2.xyz;
    vec3 txVec3 = vec3(u_xlat2.xy,u_xlat2.z);
    u_xlat1.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat1.x = dot(u_xlat1, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat16_6.x = (-_ShadowBias.w) + 1.0;
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat1.x = (-u_xlat1.x) + 1.0;
    u_xlat16_19 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_19 * _shadowStrength;
    u_xlat1.x = (-u_xlat1.x) * u_xlat16_6.x + 1.0;
    u_xlat19.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat1.x = max(u_xlat1.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat1.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat1.x = u_xlat1.x + -1.0;
    u_xlat1.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat1.xx + vec2(1.0, 1.0);
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = max(u_xlat16_60, 6.10351563e-05);
    u_xlat16_10.x = u_xlat16_60 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_10.x = (-u_xlat16_10.x) * u_xlat16_10.x + 1.0;
    u_xlat16_10.x = max(u_xlat16_10.x, 0.0);
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_10.x;
    u_xlat16_28 = float(1.0) / float(u_xlat16_60);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat16_60 = u_xlat16_10.x * u_xlat16_28;
    u_xlat16_10.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_10.x));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_10.x);
#endif
    u_xlat16_10.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_10.x);
    u_xlat16_10.xzw = u_xlat16_10.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_10.yyy + u_xlat16_10.xzw;
    u_xlat16_64 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_10.xyz);
    u_xlat16_64 = u_xlat16_64 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_11.x = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_11.x);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_64;
    u_xlat16_11.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_60 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat3.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_10.xyz;
    u_xlat55 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat3.xyz = vec3(u_xlat55) * u_xlat3.xyz;
    u_xlat16_64 = dot(u_xlat16_10.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat3.x = (-u_xlat16_64) + 1.0;
    u_xlat16_10.x = u_xlat3.x * u_xlat3.x;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_10.x = u_xlat3.x * u_xlat16_10.x;
    u_xlat16_28 = u_xlat3.x * u_xlat16_10.x;
    u_xlat3.x = (-u_xlat16_10.x) * u_xlat3.x + 1.0;
    u_xlat21 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat21 = fract(u_xlat21);
    u_xlat16_4.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat39.xy = u_xlat16_4.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = vec2(u_xlat21) * u_xlat39.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_inkFlowScale);
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_0 = texture(_albedoMap, u_xlat4.xy);
    u_xlat16_10.xzw = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xzw = u_xlat16_0.xyz * u_xlat16_10.xzw + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat21 = _inkFlowSpeed * _Time.y;
    u_xlat21 = fract(u_xlat21);
    u_xlat39.xy = vec2(u_xlat21) * u_xlat39.xy;
    u_xlat21 = (-u_xlat21) + 0.5;
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat39.xy = u_xlat39.xy * vec2(_inkFlowScale);
    u_xlat39.xy = (-u_xlat39.xy) * u_xlat16_4.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat39.xy);
    u_xlat16_12.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_4.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xzw = u_xlat16_0.xyz * u_xlat16_10.xzw + (-u_xlat16_13.xyz);
    u_xlat16_65 = u_xlat16_0.w + (-u_xlat16_4.w);
    u_xlat16_65 = abs(u_xlat21) * u_xlat16_65 + u_xlat16_4.w;
    u_xlat16_10.xzw = abs(vec3(u_xlat21)) * u_xlat16_10.xzw;
    u_xlat16_10.xzw = u_xlat16_4.xyz * u_xlat16_12.xyz + u_xlat16_10.xzw;
    u_xlat16_12.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_12.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_13.xyz = u_xlat16_10.xzw * u_xlat16_12.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_12.xyz;
    u_xlat16_4.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_12.xyz = u_xlat16_4.yyy * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat3.xyz = u_xlat3.xxx * u_xlat16_12.xyz;
    u_xlat57 = u_xlat16_12.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat3.xyz = vec3(u_xlat57) * vec3(u_xlat16_28) + u_xlat3.xyz;
    u_xlat16_28 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat16_28 = u_xlat16_28 * u_xlat16_28;
    u_xlat16_28 = max(u_xlat16_28, 0.0078125);
    u_xlat61 = (-u_xlat55) * u_xlat16_28 + u_xlat55;
    u_xlat61 = u_xlat55 * u_xlat61 + u_xlat16_28;
    u_xlat61 = sqrt(u_xlat61);
    u_xlat61 = u_xlat55 + u_xlat61;
    u_xlat61 = u_xlat61 + 6.10351563e-05;
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_60);
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = (-u_xlat8.x) * u_xlat16_28 + u_xlat8.x;
    u_xlat44 = u_xlat8.x * u_xlat44 + u_xlat16_28;
    u_xlat44 = sqrt(u_xlat44);
    u_xlat44 = u_xlat44 + u_xlat8.x;
    u_xlat44 = u_xlat44 + 6.10351563e-05;
    u_xlat61 = u_xlat61 * u_xlat44;
    u_xlat61 = float(1.0) / u_xlat61;
    u_xlat61 = min(u_xlat61, 16.0);
    u_xlat62 = u_xlat16_28 + -1.0;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat56 = u_xlat61 * u_xlat56;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = vec3(u_xlat55) * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_11.xyz * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat19.xxx * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat56 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat9.xyz = vec3(u_xlat56) * u_xlat9.xyz;
    u_xlat16_66 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat56 = dot(u_xlat7.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat56 = min(max(u_xlat56, 0.0), 1.0);
#else
    u_xlat56 = clamp(u_xlat56, 0.0, 1.0);
#endif
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat56 * u_xlat62 + 1.0;
    u_xlat56 = u_xlat56 * u_xlat56;
    u_xlat56 = u_xlat16_28 / u_xlat56;
    u_xlat56 = u_xlat56 * 0.318309873;
    u_xlat56 = min(u_xlat56, 16.0);
    u_xlat61 = (-u_xlat16_66) + 1.0;
    u_xlat16_66 = u_xlat61 * u_xlat61;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat9.x = (-u_xlat16_66) * u_xlat61 + 1.0;
    u_xlat16_66 = u_xlat61 * u_xlat16_66;
    u_xlat9.xyz = u_xlat16_12.xyz * u_xlat9.xxx;
    u_xlat9.xyz = vec3(u_xlat57) * vec3(u_xlat16_66) + u_xlat9.xyz;
    u_xlat61 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat61 = min(max(u_xlat61, 0.0), 1.0);
#else
    u_xlat61 = clamp(u_xlat61, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat61) * u_xlat16_28 + u_xlat61;
    u_xlat63 = u_xlat61 * u_xlat63 + u_xlat16_28;
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat61 + u_xlat63;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat63 = u_xlat44 * u_xlat63;
    u_xlat63 = float(1.0) / u_xlat63;
    u_xlat63 = min(u_xlat63, 16.0);
    u_xlat56 = u_xlat56 * u_xlat63;
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat56);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.xyz = min(max(u_xlat9.xyz, 0.0), 1.0);
#else
    u_xlat9.xyz = clamp(u_xlat9.xyz, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = vec3(u_xlat61) * u_xlat9.xyz;
    u_xlat16_66 = u_xlat61 + (-_toonLambertThreshold);
    u_xlat16_66 = u_xlat16_66 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat9.xyz = u_xlat9.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat9.xyz * u_xlat16_6.xyz + u_xlat3.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_67 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_67 = max(u_xlat16_67, 6.10351563e-05);
    u_xlat16_68 = inversesqrt(u_xlat16_67);
    u_xlat16_15.xyz = u_xlat3.xyz * vec3(u_xlat16_68);
    u_xlat16_68 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.00100000005>=abs(u_xlat16_68));
#else
    u_xlatb56 = 0.00100000005>=abs(u_xlat16_68);
#endif
    u_xlat16_16.xy = (bool(u_xlatb56)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_17.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(u_xlat16_60) + u_xlat16_15.xyz;
    u_xlat56 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat56 = inversesqrt(u_xlat56);
    u_xlat2.xyz = vec3(u_xlat56) * u_xlat2.xyz;
    u_xlat16_60 = dot(u_xlat16_15.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat2.x = dot(u_xlat7.xyz, u_xlat2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat2.x * u_xlat62 + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat2.x;
    u_xlat2.x = u_xlat16_28 / u_xlat2.x;
    u_xlat2.x = u_xlat2.x * 0.318309873;
    u_xlat2.x = min(u_xlat2.x, 16.0);
    u_xlat20.x = (-u_xlat16_60) + 1.0;
    u_xlat16_60 = u_xlat20.x * u_xlat20.x;
    u_xlat16_60 = u_xlat20.x * u_xlat16_60;
    u_xlat16_60 = u_xlat20.x * u_xlat16_60;
    u_xlat38 = (-u_xlat16_60) * u_xlat20.x + 1.0;
    u_xlat16_60 = u_xlat20.x * u_xlat16_60;
    u_xlat20.xyz = u_xlat16_12.xyz * vec3(u_xlat38);
    u_xlat20.xyz = vec3(u_xlat57) * vec3(u_xlat16_60) + u_xlat20.xyz;
    u_xlat3.x = dot(u_xlat7.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_15.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat21 = (-u_xlat3.x) * u_xlat16_28 + u_xlat3.x;
    u_xlat21 = u_xlat3.x * u_xlat21 + u_xlat16_28;
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 + u_xlat3.x;
    u_xlat21 = u_xlat21 + 6.10351563e-05;
    u_xlat21 = u_xlat21 * u_xlat44;
    u_xlat21 = float(1.0) / u_xlat21;
    u_xlat21 = min(u_xlat21, 16.0);
    u_xlat2.x = u_xlat2.x * u_xlat21;
    u_xlat2.xyz = u_xlat20.xyz * u_xlat2.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat2.xyz = u_xlat2.xyz * _directSpecularColor.xyz;
    u_xlat2.xyz = u_xlat3.xxx * u_xlat2.xyz;
    u_xlat16_68 = u_xlat16_67 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_67 = float(1.0) / float(u_xlat16_67);
    u_xlat16_68 = (-u_xlat16_68) * u_xlat16_68 + 1.0;
    u_xlat16_68 = max(u_xlat16_68, 0.0);
    u_xlat16_68 = u_xlat16_68 * u_xlat16_68;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_68;
    u_xlat16_67 = max(u_xlat16_16.x, u_xlat16_67);
#ifdef UNITY_ADRENO_ES3
    u_xlatb56 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb56 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_68 = (u_xlatb56) ? 1.0 : 0.0;
    u_xlat16_60 = max(u_xlat16_60, u_xlat16_68);
    u_xlat16_60 = u_xlat16_60 * u_xlat16_67;
    u_xlat16_15.xyz = vec3(u_xlat16_60) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat2.xyz = u_xlat2.xyz * u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat2.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_60 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_10.xzw = vec3(u_xlat16_60) * u_xlat16_10.xzw;
    u_xlat16_60 = u_xlat16_66 * -2.0 + 3.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_60 = u_xlat16_60 * u_xlat16_66;
    u_xlat16_16.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_16.xyz = vec3(u_xlat16_60) * u_xlat16_16.xyz + _toonLambertColor.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xzw * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_16.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = vec3(u_xlat55) * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_15.xyz * u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_11.xyz = u_xlat19.xxx * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * u_xlat3.xxx + u_xlat16_6.xyz;
    u_xlat16_6.xyz = u_xlat16_14.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_11.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_11.xyz + u_xlat7.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat16_11.xyz);
    u_xlat16_60 = inversesqrt(u_xlat16_60);
    u_xlat16_11.xyz = vec3(u_xlat16_60) * u_xlat16_11.xyz;
    u_xlat16_60 = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_60 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_60) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_4.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_66 + u_xlat16_60;
    u_xlat16_60 = u_xlat16_4.w * u_xlat16_60;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_67 = u_xlat16_60 * u_xlat16_66;
    u_xlat1.xy = min(u_xlat1.xz, vec2(u_xlat16_67));
    u_xlat1.x = min(u_xlat16_0.z, u_xlat1.x);
    u_xlat16_15.xyz = u_xlat16_10.xzw * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat1.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat1.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat1.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_10.xzw * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat1.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_11.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_11.xz);
    u_xlat16_16.y = u_xlat16_11.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati1.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati37 = int(int_bitfieldInsert(2,u_xlati1.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati37].xyz;
    u_xlati1.x = int(uint(uint(u_xlati1.x) & 1u));
    u_xlati37 = (u_xlati1.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati1.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati37].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_67 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_17.xyz;
    u_xlat16_10.xzw = u_xlat16_10.xzw * u_xlat16_15.xyz + u_xlat16_6.xyz;
    u_xlat16_68 = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_68 = u_xlat16_68 + u_xlat16_68;
    u_xlat1.xzw = (-u_xlat7.xyz) * vec3(u_xlat16_68) + (-u_xlat16_13.xyz);
    u_xlat2.x = dot(u_xlat16_11.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_4.z = dot(u_xlat16_11.xyz, u_xlat1.xzw);
    u_xlat16_11.xyz = u_xlat16_4.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat20.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat1.xzw);
    u_xlat1.xzw = vec3(u_xlat16_28) * u_xlat20.xyz + u_xlat1.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xw);
    u_xlat13.y = u_xlat1.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_28 = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat8.y = u_xlat16_4.x;
    u_xlat16_1.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_1.zzz;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_28);
    u_xlat16_15.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat1.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat1.xzw * u_xlat1.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb1)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_15.xyz;
    u_xlat16_3.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_28 = floor(u_xlat16_3.w);
    u_xlat16_11.x = u_xlat16_28 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_3.x = u_xlat16_11.x * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_3.x = u_xlat16_28 * 16.0 + u_xlat16_3.z;
    u_xlat16_11.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_37 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_28 = u_xlat16_11.z * 15.0 + (-u_xlat16_28);
    u_xlat16_11.x = (-u_xlat16_37) + u_xlat16_1.x;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_11.x + u_xlat16_37;
    u_xlat16_28 = u_xlat16_66 * u_xlat16_28;
    u_xlat1.x = u_xlat2.x * u_xlat16_28;
    u_xlat16_28 = u_xlat1.y * 0.5;
    u_xlat16_11.x = (-u_xlat1.y) * 0.5 + 1.0;
    u_xlat16_28 = u_xlat1.x * u_xlat16_11.x + u_xlat16_28;
    u_xlat16_11.x = u_xlat16_28 + u_xlat16_28;
    u_xlat16_29 = (-u_xlat16_28) * 2.0 + 1.0;
    u_xlat16_28 = u_xlat16_28 * u_xlat16_29 + u_xlat16_11.x;
    u_xlat16_28 = u_xlat1.y * u_xlat16_28;
    u_xlat16_28 = min(u_xlat16_0.z, u_xlat16_28);
    u_xlat16_11.xyz = vec3(u_xlat16_28) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_10.xzw;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz + u_xlat16_14.xyz;
    u_xlat16_64 = dot(u_xlat16_11.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_10.xyz = u_xlat16_11.xyz * _emissiveColor.www + u_xlat16_10.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat1.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb37 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb37 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_10.xy = (bool(u_xlatb37)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat1.xy = u_xlat16_10.xy * _edgeDisturbParam.xy + u_xlat1.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_1.x = texture(_edgeNoiseMap, u_xlat1.xy).y;
    u_xlat19.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat19.xy = u_xlat16_10.xy * _edgeNoiseParam.xy + u_xlat19.xy;
    u_xlat1.xy = u_xlat16_1.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat19.xy;
    u_xlat1.xy = fract(u_xlat1.xy);
    u_xlat16_1.x = texture(_edgeNoiseMap, u_xlat1.xy).x;
    u_xlatb19.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_10.x = (u_xlatb19.x) ? u_xlat16_10.x : 1.0;
    u_xlat16_10.x = (u_xlatb19.y) ? u_xlat16_10.y : u_xlat16_10.x;
    u_xlat16_28 = (-u_xlat16_10.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb19.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_10.x = (u_xlatb19.x) ? u_xlat16_28 : u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_1.x + u_xlat16_10.x;
    u_xlat16_10.x = u_xlat16_10.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_10.x = u_xlat16_10.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_10.x = min(max(u_xlat16_10.x, 0.0), 1.0);
#else
    u_xlat16_10.x = clamp(u_xlat16_10.x, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * u_xlat16_65;
    u_xlat16_28 = u_xlat16_10.x * _albedoColor.w + u_xlat16_64;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_28 = min(max(u_xlat16_28, 0.0), 1.0);
#else
    u_xlat16_28 = clamp(u_xlat16_28, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_10.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_28 : u_xlat16_10.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
int u_xlati16;
bvec2 u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
bool u_xlatb32;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat48;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat58;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_inkFlowScale);
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_3 = texture(_albedoMap, u_xlat4.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(_inkFlowScale);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat16.xy);
    u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + (-u_xlat16_7.yzx);
    u_xlat16_49 = u_xlat16_3.w + (-u_xlat16_4.w);
    u_xlat16_49 = abs(u_xlat0.x) * u_xlat16_49 + u_xlat16_4.w;
    u_xlat16_5.xyz = abs(u_xlat0.xxx) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz + u_xlat16_5.zxy;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_50 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_50) * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat48 = u_xlat16_48 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat48) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_50 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_7.xyz = u_xlat4.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_50 = max(u_xlat16_50, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_50) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat16_8.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_50 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_50) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat11.x;
    u_xlat4.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat52 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat52) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat52 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_50 = u_xlat52 + (-_toonLambertThreshold);
    u_xlat16_50 = u_xlat16_50 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_50 * -2.0 + 3.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_50) * u_xlat16_8.xyz + _toonLambertColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_7.xyz;
    u_xlat58 = dot(u_xlat10.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat58) + u_xlat16_7.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_2.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_5.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_18.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat12.xyz = u_xlat11.xyz * u_xlat16_18.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xxx * u_xlat11.xyz;
    u_xlat16.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat11.xyz = u_xlat16.xxx * u_xlat12.xyz;
    u_xlat16_18.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat10.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat58 = (-u_xlat16_18.x) + 1.0;
    u_xlat16_18.x = u_xlat58 * u_xlat58;
    u_xlat16_18.x = u_xlat58 * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat58 * u_xlat16_18.x;
    u_xlat11.x = (-u_xlat16_18.x) * u_xlat58 + 1.0;
    u_xlat16_18.x = u_xlat58 * u_xlat16_18.x;
    u_xlat11.xyz = u_xlat16_5.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat0.xxx * u_xlat16_18.xxx + u_xlat11.xyz;
    u_xlat12.x = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat0.x = (-u_xlat12.x) * u_xlat16_18.x + u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x + u_xlat16_18.x;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat12.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat58 = (-u_xlat52) * u_xlat16_18.x + u_xlat52;
    u_xlat58 = u_xlat52 * u_xlat58 + u_xlat16_18.x;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat52 + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat58;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat58 = u_xlat16_18.x + -1.0;
    u_xlat16.x = u_xlat16.x * u_xlat58 + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_18.x / u_xlat16.x;
    u_xlat0.y = u_xlat16.x * 0.318309873;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat52) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_6.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_53 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_13.xyz = vec3(u_xlat16_53) * u_xlat16_13.xyz;
    u_xlat16_53 = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat16.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_6.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16.xxx + (-u_xlat16_14.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16.xxx + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.zxy;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_9.y = u_xlat16_13.y;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_9.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlati16 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati52 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati16].xyz + u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_9.xyw;
    u_xlat16_14.xyz = u_xlat16_9.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_9.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = dot((-u_xlat16_7.xyz), u_xlat10.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat15.xyz = (-u_xlat10.xyz) * u_xlat16_6.xxx + (-u_xlat16_7.xyz);
    u_xlat16.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_3.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_3.x = u_xlat16_50 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_3.x = u_xlat16_34 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_34 = u_xlat16_6.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = u_xlat16_52 + (-u_xlat16_10);
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_10;
    u_xlat16_34 = u_xlat16_54 * u_xlat16_34;
    u_xlat16.x = u_xlat16.x * u_xlat16_34;
    u_xlat16_34 = u_xlat0.x * 0.5;
    u_xlat16_50 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat16.x * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_6.x = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_6.x + u_xlat16_50;
    u_xlat16_34 = u_xlat0.x * u_xlat16_34;
    u_xlat16_34 = min(u_xlat16_0.z, u_xlat16_34);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat15.xyz);
    u_xlat0.xyz = u_xlat16_18.xxx * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_18.x);
    u_xlat16_2.xyw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_2.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat11.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _emissiveColor.zxy;
    u_xlat16_1.xyz = u_xlat16_18.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_18.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat48 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat3.x = u_xlat48 * 0.0625 + u_xlat3.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_16.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb32 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb32)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat16.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat16.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat16.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat16.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb16.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb16.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_17 = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_17 : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_49;
    u_xlat16_17 = u_xlat16_1.x * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_17 : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
int u_xlati16;
bvec2 u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_18;
bool u_xlatb32;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_34;
float u_xlat48;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
float u_xlat58;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_inkFlowScale);
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_3 = texture(_albedoMap, u_xlat4.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(_inkFlowScale);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat16.xy);
    u_xlat16_6.xyz = u_xlat16_4.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + (-u_xlat16_7.yzx);
    u_xlat16_49 = u_xlat16_3.w + (-u_xlat16_4.w);
    u_xlat16_49 = abs(u_xlat0.x) * u_xlat16_49 + u_xlat16_4.w;
    u_xlat16_5.xyz = abs(u_xlat0.xxx) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_4.zxy * u_xlat16_6.xyz + u_xlat16_5.zxy;
    u_xlat16_6.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_50 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_50) * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat48 = u_xlat16_48 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat48) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_50 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_53 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_53 = max(u_xlat16_53, 6.10351563e-05);
    u_xlat16_54 = inversesqrt(u_xlat16_53);
    u_xlat16_7.xyz = u_xlat4.xyz * vec3(u_xlat16_54);
    u_xlat16_54 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_54));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_54);
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_54 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_54 = u_xlat16_54 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_50 = max(u_xlat16_50, u_xlat16_54);
    u_xlat16_54 = u_xlat16_53 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_53 = float(1.0) / float(u_xlat16_53);
    u_xlat16_54 = (-u_xlat16_54) * u_xlat16_54 + 1.0;
    u_xlat16_54 = max(u_xlat16_54, 0.0);
    u_xlat16_54 = u_xlat16_54 * u_xlat16_54;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_53 = max(u_xlat16_8.x, u_xlat16_53);
    u_xlat16_50 = u_xlat16_50 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_50) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat16_8.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_50 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_50) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat11.x;
    u_xlat4.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat52 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat52) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat52 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_50 = u_xlat52 + (-_toonLambertThreshold);
    u_xlat16_50 = u_xlat16_50 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_50 = min(max(u_xlat16_50, 0.0), 1.0);
#else
    u_xlat16_50 = clamp(u_xlat16_50, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_50 * -2.0 + 3.0;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_50;
    u_xlat16_50 = u_xlat16_50 * u_xlat16_53;
    u_xlat16_8.xyz = vec3(u_xlat16_50) * u_xlat16_8.xyz + _toonLambertColor.zxy;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_7.xyz;
    u_xlat58 = dot(u_xlat10.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(u_xlat58) + u_xlat16_7.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_2.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_5.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_18.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_18.x = inversesqrt(u_xlat16_18.x);
    u_xlat12.xyz = u_xlat11.xyz * u_xlat16_18.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_7.xyz = u_xlat16_18.xxx * u_xlat11.xyz;
    u_xlat16.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat11.xyz = u_xlat16.xxx * u_xlat12.xyz;
    u_xlat16_18.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_18.x = min(max(u_xlat16_18.x, 0.0), 1.0);
#else
    u_xlat16_18.x = clamp(u_xlat16_18.x, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat10.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat58 = (-u_xlat16_18.x) + 1.0;
    u_xlat16_18.x = u_xlat58 * u_xlat58;
    u_xlat16_18.x = u_xlat58 * u_xlat16_18.x;
    u_xlat16_18.x = u_xlat58 * u_xlat16_18.x;
    u_xlat11.x = (-u_xlat16_18.x) * u_xlat58 + 1.0;
    u_xlat16_18.x = u_xlat58 * u_xlat16_18.x;
    u_xlat11.xyz = u_xlat16_5.xyz * u_xlat11.xxx;
    u_xlat11.xyz = u_xlat0.xxx * u_xlat16_18.xxx + u_xlat11.xyz;
    u_xlat12.x = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_18.x = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat16_18.x = u_xlat16_18.x * u_xlat16_18.x;
    u_xlat16_18.x = max(u_xlat16_18.x, 0.0078125);
    u_xlat0.x = (-u_xlat12.x) * u_xlat16_18.x + u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x + u_xlat16_18.x;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat12.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat58 = (-u_xlat52) * u_xlat16_18.x + u_xlat52;
    u_xlat58 = u_xlat52 * u_xlat58 + u_xlat16_18.x;
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat52 + u_xlat58;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat58;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat58 = u_xlat16_18.x + -1.0;
    u_xlat16.x = u_xlat16.x * u_xlat58 + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_18.x / u_xlat16.x;
    u_xlat0.y = u_xlat16.x * 0.318309873;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.zxy;
    u_xlat11.xyz = vec3(u_xlat52) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.zxy + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_6.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_53 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat16_13.xyz = vec3(u_xlat16_53) * u_xlat16_13.xyz;
    u_xlat16_53 = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * 0.5 + 0.5;
    u_xlat16_54 = (-u_xlat16_53) + u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_54 + u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.w * u_xlat16_53;
    u_xlat16_54 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_54 + -1.0;
    u_xlat16_54 = _occlusionScale * u_xlat16_54 + 1.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat0.x = min(u_xlat16_53, 1.0);
    u_xlat16.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_6.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16.xxx + (-u_xlat16_14.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16.xxx + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.zxy;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_9.y = u_xlat16_13.y;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_9.xyz = vec3(u_xlat16_54) * u_xlat16_14.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlati16 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati52 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati16].xyz + u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_9.xyw;
    u_xlat16_14.xyz = u_xlat16_9.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_53 = dot(u_xlat16_9.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = dot((-u_xlat16_7.xyz), u_xlat10.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat15.xyz = (-u_xlat10.xyz) * u_xlat16_6.xxx + (-u_xlat16_7.xyz);
    u_xlat16.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_34 = floor(u_xlat16_3.w);
    u_xlat16_50 = u_xlat16_34 + 1.0;
    u_xlat16_50 = min(u_xlat16_50, 15.0);
    u_xlat16_3.x = u_xlat16_50 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_3.x = u_xlat16_34 * 16.0 + u_xlat16_3.z;
    u_xlat16_6.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_6.xy).x;
    u_xlat16_34 = u_xlat16_6.z * 15.0 + (-u_xlat16_34);
    u_xlat16_50 = u_xlat16_52 + (-u_xlat16_10);
    u_xlat16_34 = u_xlat16_34 * u_xlat16_50 + u_xlat16_10;
    u_xlat16_34 = u_xlat16_54 * u_xlat16_34;
    u_xlat16.x = u_xlat16.x * u_xlat16_34;
    u_xlat16_34 = u_xlat0.x * 0.5;
    u_xlat16_50 = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_34 = u_xlat16.x * u_xlat16_50 + u_xlat16_34;
    u_xlat16_50 = u_xlat16_34 + u_xlat16_34;
    u_xlat16_6.x = (-u_xlat16_34) * 2.0 + 1.0;
    u_xlat16_34 = u_xlat16_34 * u_xlat16_6.x + u_xlat16_50;
    u_xlat16_34 = u_xlat0.x * u_xlat16_34;
    u_xlat16_34 = min(u_xlat16_0.z, u_xlat16_34);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat15.xyz);
    u_xlat0.xyz = u_xlat16_18.xxx * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_18.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_18.x;
    u_xlat16_18.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_18.x);
    u_xlat16_2.xyw = u_xlat16_0.www * u_xlat16_0.zxy;
    u_xlat0.xyz = u_xlat16_2.xyw * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xyw = u_xlat16_2.xyw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_6.xyz = vec3(u_xlat16_53) * u_xlat16_2.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyw = (bool(u_xlatb0)) ? u_xlat16_6.xyz : u_xlat16_2.xyw;
    u_xlat16_2.xyw = u_xlat16_2.xyw * u_xlat16_5.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_34) * u_xlat16_2.xyw;
    u_xlat16_5.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat11.yzx * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.yzx;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_18.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_18.xyz = u_xlat16_0.zxy * u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _emissiveColor.zxy;
    u_xlat16_1.xyz = u_xlat16_18.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_18.xyz = (-u_xlat16_1.xyz) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_18.xyz + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_1.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat3.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat48 = floor(u_xlat3.x);
    u_xlat3.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat48);
    u_xlat3.x = u_xlat48 * 0.0625 + u_xlat3.y;
    u_xlat16_16.xyz = textureLod(_ACESLutTex, u_xlat3.xz, 0.0).xyz;
    u_xlat4.xy = u_xlat3.xw + vec2(0.0625, 0.03125);
    u_xlat16_4.xyz = textureLod(_ACESLutTex, u_xlat4.xy, 0.0).xyz;
    u_xlat4.xyz = (-u_xlat16_16.xyz) + u_xlat16_4.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat16_16.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb32 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb32)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat16.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat16.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat16.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat16.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb16.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb16.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_17 = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_17 : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_49;
    u_xlat16_17 = u_xlat16_1.x * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_17 : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bvec2 u_xlatb18;
float u_xlat19;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_42;
float u_xlat54;
float u_xlat55;
bool u_xlatb55;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat54 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat54 = fract(u_xlat54);
    u_xlat16_1.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_inkFlowScale);
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_2 = texture(_albedoMap, u_xlat2.xy);
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat54 = _inkFlowSpeed * _Time.y;
    u_xlat54 = fract(u_xlat54);
    u_xlat1.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat54 = (-u_xlat54) + 0.5;
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat1.xy = u_xlat1.xy * vec2(_inkFlowScale);
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + (-u_xlat16_12.yzx);
    u_xlat16_60 = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_60 = abs(u_xlat54) * u_xlat16_60 + u_xlat16_1.w;
    u_xlat16_10.xyz = abs(vec3(u_xlat54)) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + u_xlat16_10.zxy;
    u_xlat16_11.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat54 + (-_toonLambertThreshold);
    u_xlat16_64 = u_xlat16_64 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + _toonLambertColor.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat55) + u_xlat16_12.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat3.xyz = u_xlat1.xyw * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat1.xyw * vec3(u_xlat16_64);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat19 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat19 * u_xlat19;
    u_xlat16_64 = u_xlat19 * u_xlat16_64;
    u_xlat16_64 = u_xlat19 * u_xlat16_64;
    u_xlat55 = (-u_xlat16_64) * u_xlat19 + 1.0;
    u_xlat16_64 = u_xlat19 * u_xlat16_64;
    u_xlat3.xyz = u_xlat16_10.xyz * vec3(u_xlat55);
    u_xlat3.xyz = u_xlat18.xxx * vec3(u_xlat16_64) + u_xlat3.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat18.x = (-u_xlat4.x) * u_xlat16_64 + u_xlat4.x;
    u_xlat18.x = u_xlat4.x * u_xlat18.x + u_xlat16_64;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat4.x;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat19 = (-u_xlat54) * u_xlat16_64 + u_xlat54;
    u_xlat19 = u_xlat54 * u_xlat19 + u_xlat16_64;
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat54 + u_xlat19;
    u_xlat19 = u_xlat19 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat19;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat19 = u_xlat16_64 + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat19 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_64 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat1.x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyw = min(max(u_xlat1.xyw, 0.0), 1.0);
#else
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
#endif
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.zxy;
    u_xlat1.xyw = vec3(u_xlat54) * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_2.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_2.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_65));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_64 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat4.y = u_xlat16_2.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_64);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_2.w);
    u_xlat16_65 = u_xlat16_64 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_2.x = u_xlat16_65 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_64 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_64 = u_xlat16_12.z * 15.0 + (-u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65 + u_xlat16_36;
    u_xlat16_64 = u_xlat16_66 * u_xlat16_64;
    u_xlat0.x = u_xlat3.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_65 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_65 + u_xlat16_64;
    u_xlat16_65 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_12.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_1.z, u_xlat16_64);
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.ywx * u_xlat16_6.yzx + u_xlat16_10.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_24.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_24.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_24.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_24.x : 1.0;
    u_xlat16_24.x = (u_xlatb18.y) ? u_xlat16_24.y : u_xlat16_24.x;
    u_xlat16_42 = (-u_xlat16_24.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_42 : u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_0.x + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_24.x = u_xlat16_24.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_60;
    u_xlat16_6.x = u_xlat16_24.x * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
UNITY_LOCATION(12) uniform mediump sampler2D _ACESLutTex;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump vec3 u_xlat16_18;
bvec2 u_xlatb18;
float u_xlat19;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_42;
float u_xlat54;
float u_xlat55;
bool u_xlatb55;
float u_xlat59;
mediump float u_xlat16_60;
mediump float u_xlat16_64;
mediump float u_xlat16_65;
mediump float u_xlat16_66;
mediump float u_xlat16_67;
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
    u_xlat16_18.x = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18.x * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.zxy;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat54 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat54 = fract(u_xlat54);
    u_xlat16_1.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_inkFlowScale);
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_2 = texture(_albedoMap, u_xlat2.xy);
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat54 = _inkFlowSpeed * _Time.y;
    u_xlat54 = fract(u_xlat54);
    u_xlat1.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat54 = (-u_xlat54) + 0.5;
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat1.xy = u_xlat1.xy * vec2(_inkFlowScale);
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_1.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + (-u_xlat16_12.yzx);
    u_xlat16_60 = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_60 = abs(u_xlat54) * u_xlat16_60 + u_xlat16_1.w;
    u_xlat16_10.xyz = abs(vec3(u_xlat54)) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.zxy * u_xlat16_11.xyz + u_xlat16_10.zxy;
    u_xlat16_11.xyz = _albedoColor.zxy + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-_toonLambertColor.zxy) + vec3(1.0, 1.0, 1.0);
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat54 + (-_toonLambertThreshold);
    u_xlat16_64 = u_xlat16_64 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + _toonLambertColor.zxy;
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].zxy;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat55) + u_xlat16_12.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.x = u_xlat16_10.z * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_64 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat3.xyz = u_xlat1.xyw * vec3(u_xlat16_64) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat1.xyw * vec3(u_xlat16_64);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_64 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat19 = (-u_xlat16_64) + 1.0;
    u_xlat16_64 = u_xlat19 * u_xlat19;
    u_xlat16_64 = u_xlat19 * u_xlat16_64;
    u_xlat16_64 = u_xlat19 * u_xlat16_64;
    u_xlat55 = (-u_xlat16_64) * u_xlat19 + 1.0;
    u_xlat16_64 = u_xlat19 * u_xlat16_64;
    u_xlat3.xyz = u_xlat16_10.xyz * vec3(u_xlat55);
    u_xlat3.xyz = u_xlat18.xxx * vec3(u_xlat16_64) + u_xlat3.xyz;
    u_xlat4.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = max(u_xlat16_64, 0.0078125);
    u_xlat18.x = (-u_xlat4.x) * u_xlat16_64 + u_xlat4.x;
    u_xlat18.x = u_xlat4.x * u_xlat18.x + u_xlat16_64;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat4.x;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat19 = (-u_xlat54) * u_xlat16_64 + u_xlat54;
    u_xlat19 = u_xlat54 * u_xlat19 + u_xlat16_64;
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat54 + u_xlat19;
    u_xlat19 = u_xlat19 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat19;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat19 = u_xlat16_64 + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat19 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_64 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat1.x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyw = min(max(u_xlat1.xyw, 0.0), 1.0);
#else
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
#endif
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.zxy;
    u_xlat1.xyw = vec3(u_xlat54) * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.zxy;
    u_xlat16_12.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_14.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_65 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_65 * 0.5 + 0.5;
    u_xlat16_66 = (-u_xlat16_65) + u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_65 = u_xlat16_2.w * u_xlat16_66 + u_xlat16_65;
    u_xlat16_65 = u_xlat16_2.w * u_xlat16_65;
    u_xlat16_66 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 + -1.0;
    u_xlat16_66 = _occlusionScale * u_xlat16_66 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_65));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.zxy;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.zxy * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_65 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_64) * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_64 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat4.y = u_xlat16_2.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_64);
    u_xlat16_14.xyz = u_xlat16_2.www * u_xlat16_2.zxy;
    u_xlat0.xzw = u_xlat16_14.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_14.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_15.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_14.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_14.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_14.xyz;
    u_xlat16_2.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_64 = floor(u_xlat16_2.w);
    u_xlat16_65 = u_xlat16_64 + 1.0;
    u_xlat16_65 = min(u_xlat16_65, 15.0);
    u_xlat16_2.x = u_xlat16_65 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_64 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_64 = u_xlat16_12.z * 15.0 + (-u_xlat16_64);
    u_xlat16_65 = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65 + u_xlat16_36;
    u_xlat16_64 = u_xlat16_66 * u_xlat16_64;
    u_xlat0.x = u_xlat3.x * u_xlat16_64;
    u_xlat16_64 = u_xlat0.y * 0.5;
    u_xlat16_65 = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_64 = u_xlat0.x * u_xlat16_65 + u_xlat16_64;
    u_xlat16_65 = u_xlat16_64 + u_xlat16_64;
    u_xlat16_12.x = (-u_xlat16_64) * 2.0 + 1.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_64 = u_xlat0.y * u_xlat16_64;
    u_xlat16_64 = min(u_xlat16_1.z, u_xlat16_64);
    u_xlat16_10.xyz = vec3(u_xlat16_64) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.zxy;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_6.xyz = u_xlat1.ywx * u_xlat16_6.yzx + u_xlat16_10.yzx;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_0.zxy * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_0.zxy * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.zxy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _emissiveColor.www + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.zxy;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat1.xw = u_xlat0.xz * vec2(15.0, 0.9375);
    u_xlat54 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat54);
    u_xlat1.x = u_xlat54 * 0.0625 + u_xlat1.y;
    u_xlat16_18.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat1.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat1.xy, 0.0).xyz;
    u_xlat1.xyz = (-u_xlat16_18.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat1.xyz + u_xlat16_18.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_24.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_24.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_24.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_24.x : 1.0;
    u_xlat16_24.x = (u_xlatb18.y) ? u_xlat16_24.y : u_xlat16_24.x;
    u_xlat16_42 = (-u_xlat16_24.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_42 : u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_0.x + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_24.x = u_xlat16_24.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_60;
    u_xlat16_6.x = u_xlat16_24.x * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
int u_xlati16;
bvec2 u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat27;
bool u_xlatb32;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_38;
float u_xlat48;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat59;
mediump float u_xlat16_59;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_inkFlowScale);
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_3 = texture(_albedoMap, u_xlat4.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(_inkFlowScale);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat16.xy);
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_49 = u_xlat16_3.w + (-u_xlat16_4.w);
    u_xlat16_49 = abs(u_xlat0.x) * u_xlat16_49 + u_xlat16_4.w;
    u_xlat16_5.xyz = abs(u_xlat0.xxx) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_50 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_50) * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat48 = u_xlat16_48 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat48) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_53 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_54 = max(u_xlat16_54, 6.10351563e-05);
    u_xlat16_7.x = inversesqrt(u_xlat16_54);
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xxx;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_55);
    u_xlat16_55 = u_xlat16_54 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_54 = float(1.0) / float(u_xlat16_54);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_55;
    u_xlat16_54 = max(u_xlat16_8.x, u_xlat16_54);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_8.xyz = vec3(u_xlat16_53) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat16_8.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat11.x;
    u_xlat4.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat52 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat52) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat52 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat52 + (-_toonLambertThreshold);
    u_xlat16_53 = u_xlat16_53 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_8.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz + _toonLambertColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_7.xyz;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_7.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_2.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_53) * u_xlat11.xyz;
    u_xlat16.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat11.xyz = u_xlat16.xxx * u_xlat12.xyz;
    u_xlat16_53 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat10.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat11.x = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat11.x * u_xlat11.x;
    u_xlat16_53 = u_xlat11.x * u_xlat16_53;
    u_xlat16_53 = u_xlat11.x * u_xlat16_53;
    u_xlat27 = (-u_xlat16_53) * u_xlat11.x + 1.0;
    u_xlat16_53 = u_xlat11.x * u_xlat16_53;
    u_xlat11.xyz = u_xlat16_5.xyz * vec3(u_xlat27);
    u_xlat11.xyz = u_xlat0.xxx * vec3(u_xlat16_53) + u_xlat11.xyz;
    u_xlat12.x = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat0.x = (-u_xlat12.x) * u_xlat16_53 + u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x + u_xlat16_53;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat12.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat59 = (-u_xlat52) * u_xlat16_53 + u_xlat52;
    u_xlat59 = u_xlat52 * u_xlat59 + u_xlat16_53;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat52 + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat59;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat59 = u_xlat16_53 + -1.0;
    u_xlat16.x = u_xlat16.x * u_xlat59 + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_53 / u_xlat16.x;
    u_xlat0.y = u_xlat16.x * 0.318309873;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = vec3(u_xlat52) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_6.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_54 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_13.xyz;
    u_xlat16_54 = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_54 * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_54) + u_xlat16_55;
    u_xlat16_56 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_56 + 1.0;
    u_xlat16_54 = u_xlat16_2.w * u_xlat16_55 + u_xlat16_54;
    u_xlat16_54 = u_xlat16_2.w * u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_55;
    u_xlat0.x = min(u_xlat16_54, 1.0);
    u_xlat16.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_6.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16.xxx + (-u_xlat16_14.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16.xxx + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_9.y = u_xlat16_13.y;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_9.xyz = vec3(u_xlat16_55) * u_xlat16_14.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlati16 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati52 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati16].xyz + u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_9.xyw;
    u_xlat16_14.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_54 = dot(u_xlat16_9.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = dot((-u_xlat16_7.xyz), u_xlat10.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat15.xyz = (-u_xlat10.xyz) * u_xlat16_6.xxx + (-u_xlat16_7.xyz);
    u_xlat16.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_3.w);
    u_xlat16_22.x = u_xlat16_6.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_3.x = u_xlat16_22.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_6.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_59 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_6.x = u_xlat16_6.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_22.x = u_xlat16_52 + (-u_xlat16_59);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_22.x + u_xlat16_59;
    u_xlat16_6.x = u_xlat16_55 * u_xlat16_6.x;
    u_xlat16.x = u_xlat16.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat0.x * 0.5;
    u_xlat16_22.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_6.x = u_xlat16.x * u_xlat16_22.x + u_xlat16_6.x;
    u_xlat16_22.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_38 = (-u_xlat16_6.x) * 2.0 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_38 + u_xlat16_22.x;
    u_xlat16_6.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_0.z, u_xlat16_6.x);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_53) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_53 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_53);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = vec3(u_xlat16_54) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22.xyz = (bool(u_xlatb0)) ? u_xlat16_22.xyz : u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _emissiveColor.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb32 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb32)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat16.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat16.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat16.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat16.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb16.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb16.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_17 = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_17 : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_49;
    u_xlat16_17 = u_xlat16_1.x * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_17 : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _toonLambertColor;
uniform 	mediump float _toonLambertThreshold;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(4) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(5) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(9) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
bool u_xlatb4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
mediump vec4 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
vec3 u_xlat12;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
ivec3 u_xlati15;
vec2 u_xlat16;
mediump vec3 u_xlat16_16;
int u_xlati16;
bvec2 u_xlatb16;
mediump float u_xlat16_17;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
float u_xlat27;
bool u_xlatb32;
mediump vec2 u_xlat16_33;
mediump float u_xlat16_38;
float u_xlat48;
mediump float u_xlat16_48;
mediump float u_xlat16_49;
mediump float u_xlat16_50;
float u_xlat52;
mediump float u_xlat16_52;
int u_xlati52;
mediump float u_xlat16_53;
mediump float u_xlat16_54;
mediump float u_xlat16_55;
mediump float u_xlat16_56;
float u_xlat59;
mediump float u_xlat16_59;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_1.x = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_17 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_17 = max(u_xlat16_17, 6.10351563e-05);
    u_xlat16_33.x = inversesqrt(u_xlat16_17);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_33.xxx;
    u_xlat16_33.x = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_33.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_33.x);
#endif
    u_xlat16_33.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_3.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_33.yyy + u_xlat16_3.xyz;
    u_xlat16_49 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_2.xyz);
    u_xlat16_49 = u_xlat16_49 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_49 = min(max(u_xlat16_49, 0.0), 1.0);
#else
    u_xlat16_49 = clamp(u_xlat16_49, 0.0, 1.0);
#endif
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_1.x = max(u_xlat16_1.x, u_xlat16_49);
    u_xlat16_49 = u_xlat16_17 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_17 = float(1.0) / float(u_xlat16_17);
    u_xlat16_49 = (-u_xlat16_49) * u_xlat16_49 + 1.0;
    u_xlat16_49 = max(u_xlat16_49, 0.0);
    u_xlat16_49 = u_xlat16_49 * u_xlat16_49;
    u_xlat16_17 = u_xlat16_49 * u_xlat16_17;
    u_xlat16_17 = max(u_xlat16_33.x, u_xlat16_17);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_17;
    u_xlat16_1.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.x = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16_16.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16.xy = u_xlat16_16.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat4.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat4.xy = u_xlat4.xy * vec2(_inkFlowScale);
    u_xlat4.xy = (-u_xlat4.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_3 = texture(_albedoMap, u_xlat4.xy);
    u_xlat16_5.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat0.x = _inkFlowSpeed * _Time.y;
    u_xlat0.x = fract(u_xlat0.x);
    u_xlat16.xy = u_xlat0.xx * u_xlat16.xy;
    u_xlat0.x = (-u_xlat0.x) + 0.5;
    u_xlat0.x = u_xlat0.x + u_xlat0.x;
    u_xlat16.xy = u_xlat16.xy * vec2(_inkFlowScale);
    u_xlat16.xy = (-u_xlat16.xy) * u_xlat16_16.zz + vs_TEXCOORD3.xy;
    u_xlat16_4 = texture(_albedoMap, u_xlat16.xy);
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_7.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_3.xyz * u_xlat16_5.xyz + (-u_xlat16_7.xyz);
    u_xlat16_49 = u_xlat16_3.w + (-u_xlat16_4.w);
    u_xlat16_49 = abs(u_xlat0.x) * u_xlat16_49 + u_xlat16_4.w;
    u_xlat16_5.xyz = abs(u_xlat0.xxx) * u_xlat16_5.xyz;
    u_xlat16_5.xyz = u_xlat16_4.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_6.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_0 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_6.xyz = u_xlat16_0.www * u_xlat16_6.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_50 = (-u_xlat16_0.y) * _metallicMultiplier + 1.0;
    u_xlat16_6.xyz = vec3(u_xlat16_50) * u_xlat16_7.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_6.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_48 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat48 = u_xlat16_48 * _shadowStrength;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = vec3(u_xlat48) * u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb4 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_53 = (u_xlatb4) ? 1.0 : 0.0;
    u_xlat4.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_54 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat16_54 = max(u_xlat16_54, 6.10351563e-05);
    u_xlat16_7.x = inversesqrt(u_xlat16_54);
    u_xlat16_7.xyz = u_xlat4.xyz * u_xlat16_7.xxx;
    u_xlat16_55 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb4 = !!(0.00100000005>=abs(u_xlat16_55));
#else
    u_xlatb4 = 0.00100000005>=abs(u_xlat16_55);
#endif
    u_xlat16_8.xy = (bool(u_xlatb4)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_9.xyz = u_xlat16_8.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * u_xlat16_8.yyy + u_xlat16_9.xyz;
    u_xlat16_55 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_7.xyz);
    u_xlat16_55 = u_xlat16_55 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_53 = max(u_xlat16_53, u_xlat16_55);
    u_xlat16_55 = u_xlat16_54 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_54 = float(1.0) / float(u_xlat16_54);
    u_xlat16_55 = (-u_xlat16_55) * u_xlat16_55 + 1.0;
    u_xlat16_55 = max(u_xlat16_55, 0.0);
    u_xlat16_55 = u_xlat16_55 * u_xlat16_55;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_55;
    u_xlat16_54 = max(u_xlat16_8.x, u_xlat16_54);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_8.xyz = vec3(u_xlat16_53) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_8.xyz = vec3(u_xlat48) * u_xlat16_8.xyz;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_53 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_9.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_53) + vs_TEXCOORD2.yzx;
    u_xlat48 = dot(u_xlat16_9.xyz, u_xlat16_9.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat16_9.xyz;
    u_xlat11.xyz = u_xlat10.xyz * vs_TEXCOORD1.zxy;
    u_xlat11.xyz = vs_TEXCOORD1.yzx * u_xlat10.yzx + (-u_xlat11.xyz);
    u_xlat11.xyz = u_xlat11.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat11.x;
    u_xlat4.x = u_xlat10.z;
    u_xlat16_12.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_9.xyz = u_xlat16_12.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat4.x = dot(u_xlat16_9.xyz, u_xlat4.xyz);
    u_xlat11.x = u_xlat10.y;
    u_xlat10.y = u_xlat11.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_9.xyz, u_xlat10.xyz);
    u_xlat11.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_9.xyz, u_xlat11.xyz);
    u_xlat48 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat48 = max(u_xlat48, 1.17549435e-38);
    u_xlat48 = inversesqrt(u_xlat48);
    u_xlat10.xyz = vec3(u_xlat48) * u_xlat4.xyz;
    u_xlat52 = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_7.xyz = vec3(u_xlat52) * u_xlat16_8.xyz;
    u_xlat16_8.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat52 = dot(u_xlat10.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat52 = min(max(u_xlat52, 0.0), 1.0);
#else
    u_xlat52 = clamp(u_xlat52, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat52 + (-_toonLambertThreshold);
    u_xlat16_53 = u_xlat16_53 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16_54 = u_xlat16_53 * -2.0 + 3.0;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = u_xlat16_53 * u_xlat16_54;
    u_xlat16_8.xyz = vec3(u_xlat16_53) * u_xlat16_8.xyz + _toonLambertColor.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_7.xyz = u_xlat16_8.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_7.xyz;
    u_xlat11.x = dot(u_xlat10.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat11.xxx + u_xlat16_7.xyz;
    u_xlat16_2.xy = u_xlat16_0.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_5.xyz = u_xlat16_2.yyy * u_xlat16_5.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat0.x = u_xlat16_5.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_53 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_53 = inversesqrt(u_xlat16_53);
    u_xlat12.xyz = u_xlat11.xyz * vec3(u_xlat16_53) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_53) * u_xlat11.xyz;
    u_xlat16.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16.x = inversesqrt(u_xlat16.x);
    u_xlat11.xyz = u_xlat16.xxx * u_xlat12.xyz;
    u_xlat16_53 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_53 = min(max(u_xlat16_53, 0.0), 1.0);
#else
    u_xlat16_53 = clamp(u_xlat16_53, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat10.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat11.x = (-u_xlat16_53) + 1.0;
    u_xlat16_53 = u_xlat11.x * u_xlat11.x;
    u_xlat16_53 = u_xlat11.x * u_xlat16_53;
    u_xlat16_53 = u_xlat11.x * u_xlat16_53;
    u_xlat27 = (-u_xlat16_53) * u_xlat11.x + 1.0;
    u_xlat16_53 = u_xlat11.x * u_xlat16_53;
    u_xlat11.xyz = u_xlat16_5.xyz * vec3(u_xlat27);
    u_xlat11.xyz = u_xlat0.xxx * vec3(u_xlat16_53) + u_xlat11.xyz;
    u_xlat12.x = dot(u_xlat10.xyz, u_xlat16_7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_53 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat16_53 = u_xlat16_53 * u_xlat16_53;
    u_xlat16_53 = max(u_xlat16_53, 0.0078125);
    u_xlat0.x = (-u_xlat12.x) * u_xlat16_53 + u_xlat12.x;
    u_xlat0.x = u_xlat12.x * u_xlat0.x + u_xlat16_53;
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x + u_xlat12.x;
    u_xlat0.x = u_xlat0.x + 6.10351563e-05;
    u_xlat59 = (-u_xlat52) * u_xlat16_53 + u_xlat52;
    u_xlat59 = u_xlat52 * u_xlat59 + u_xlat16_53;
    u_xlat59 = sqrt(u_xlat59);
    u_xlat59 = u_xlat52 + u_xlat59;
    u_xlat59 = u_xlat59 + 6.10351563e-05;
    u_xlat0.x = u_xlat0.x * u_xlat59;
    u_xlat0.x = float(1.0) / u_xlat0.x;
    u_xlat59 = u_xlat16_53 + -1.0;
    u_xlat16.x = u_xlat16.x * u_xlat59 + 1.0;
    u_xlat16.x = u_xlat16.x * u_xlat16.x;
    u_xlat16.x = u_xlat16_53 / u_xlat16.x;
    u_xlat0.y = u_xlat16.x * 0.318309873;
    u_xlat0.xy = min(u_xlat0.xy, vec2(16.0, 16.0));
    u_xlat0.x = u_xlat0.x * u_xlat0.y;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xyz = min(max(u_xlat11.xyz, 0.0), 1.0);
#else
    u_xlat11.xyz = clamp(u_xlat11.xyz, 0.0, 1.0);
#endif
    u_xlat11.xyz = u_xlat11.xyz * _directSpecularColor.xyz;
    u_xlat11.xyz = vec3(u_xlat52) * u_xlat11.xyz;
    u_xlat16_1.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_1.xyz;
    u_xlat16_8.xyz = u_xlat16_6.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_9.xyz = u_xlat16_6.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_13.xyz = (-u_xlat4.xyz) * vec3(u_xlat48) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_13.xyz + u_xlat10.xyz;
    u_xlat16_54 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_54 = inversesqrt(u_xlat16_54);
    u_xlat16_13.xyz = vec3(u_xlat16_54) * u_xlat16_13.xyz;
    u_xlat16_54 = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54 = min(max(u_xlat16_54, 0.0), 1.0);
#else
    u_xlat16_54 = clamp(u_xlat16_54, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_54 * 0.5 + 0.5;
    u_xlat16_55 = (-u_xlat16_54) + u_xlat16_55;
    u_xlat16_56 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_56 + 1.0;
    u_xlat16_54 = u_xlat16_2.w * u_xlat16_55 + u_xlat16_54;
    u_xlat16_54 = u_xlat16_2.w * u_xlat16_54;
    u_xlat16_55 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_55 = min(max(u_xlat16_55, 0.0), 1.0);
#else
    u_xlat16_55 = clamp(u_xlat16_55, 0.0, 1.0);
#endif
    u_xlat16_55 = u_xlat16_55 + -1.0;
    u_xlat16_55 = _occlusionScale * u_xlat16_55 + 1.0;
    u_xlat16_54 = u_xlat16_54 * u_xlat16_55;
    u_xlat0.x = min(u_xlat16_54, 1.0);
    u_xlat16.x = min(u_xlat0.x, u_xlat16_0.z);
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_9.xyz = u_xlat16.xxx * u_xlat16_9.xyz;
    u_xlat16_14.xyz = u_xlat16_6.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16.xxx * u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.xyz * u_xlat16.xxx + (-u_xlat16_14.xyz);
    u_xlat16_8.xyz = u_xlat16_8.xyz * u_xlat16.xxx + u_xlat16_9.xyz;
    u_xlat16_8.xyz = u_xlat16_8.xyz * _localDiffuseGI.xyz;
    u_xlat16_9.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_9.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_9.y = u_xlat16_13.y;
    u_xlat16_14.xyz = u_xlat16_9.xyz * u_xlat16_9.xyz;
    u_xlati15.xyz = ivec3(uvec3(lessThan(u_xlat16_9.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_9.xyz = vec3(u_xlat16_55) * u_xlat16_14.xyz;
    u_xlati16 = int(int_bitfieldInsert(2,u_xlati15.y,0,1) );
    u_xlat16_14.xyz = u_xlat16_9.yyy * _IrradianceACCoeffs[u_xlati16].xyz;
    u_xlati16 = int(uint(uint(u_xlati15.x) & 1u));
    u_xlati52 = (u_xlati15.z != 0) ? 5 : 4;
    u_xlat16_9.xyw = u_xlat16_9.xxx * _IrradianceACCoeffs[u_xlati16].xyz + u_xlat16_14.xyz;
    u_xlat16_9.xyz = u_xlat16_9.zzz * _IrradianceACCoeffs[u_xlati52].xyz + u_xlat16_9.xyw;
    u_xlat16_14.xyz = u_xlat16_9.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_54 = dot(u_xlat16_9.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_14.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_8.xyz + u_xlat16_1.xyz;
    u_xlat16_6.x = dot((-u_xlat16_7.xyz), u_xlat10.xyz);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat15.xyz = (-u_xlat10.xyz) * u_xlat16_6.xxx + (-u_xlat16_7.xyz);
    u_xlat16.x = dot(u_xlat16_13.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_13.xyz, u_xlat15.xyz);
    u_xlat16_6.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_6.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_6.x = floor(u_xlat16_3.w);
    u_xlat16_22.x = u_xlat16_6.x + 1.0;
    u_xlat16_22.x = min(u_xlat16_22.x, 15.0);
    u_xlat16_3.x = u_xlat16_22.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_52 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_3.x = u_xlat16_6.x * 16.0 + u_xlat16_3.z;
    u_xlat16_7.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_7.xy = u_xlat16_7.xy * vec2(0.00390625, 0.0625);
    u_xlat16_59 = texture(_SpecularOcclusionLut3D, u_xlat16_7.xy).x;
    u_xlat16_6.x = u_xlat16_6.z * 15.0 + (-u_xlat16_6.x);
    u_xlat16_22.x = u_xlat16_52 + (-u_xlat16_59);
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_22.x + u_xlat16_59;
    u_xlat16_6.x = u_xlat16_55 * u_xlat16_6.x;
    u_xlat16.x = u_xlat16.x * u_xlat16_6.x;
    u_xlat16_6.x = u_xlat0.x * 0.5;
    u_xlat16_22.x = (-u_xlat0.x) * 0.5 + 1.0;
    u_xlat16_6.x = u_xlat16.x * u_xlat16_22.x + u_xlat16_6.x;
    u_xlat16_22.x = u_xlat16_6.x + u_xlat16_6.x;
    u_xlat16_38 = (-u_xlat16_6.x) * 2.0 + 1.0;
    u_xlat16_6.x = u_xlat16_6.x * u_xlat16_38 + u_xlat16_22.x;
    u_xlat16_6.x = u_xlat0.x * u_xlat16_6.x;
    u_xlat16_6.x = min(u_xlat16_0.z, u_xlat16_6.x);
    u_xlat0.xyz = u_xlat4.xyz * vec3(u_xlat48) + (-u_xlat15.xyz);
    u_xlat0.xyz = vec3(u_xlat16_53) * u_xlat0.xyz + u_xlat15.xyz;
    u_xlat16_53 = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xz);
    u_xlat0.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xz);
    u_xlat0.x = u_xlat16_53;
    u_xlat16_53 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat12.y = u_xlat16_2.x;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat12.xy).xy;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyz, u_xlat16_53);
    u_xlat16_7.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_7.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_7.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_7.xyz = u_xlat16_7.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_22.xyz = vec3(u_xlat16_54) * u_xlat16_7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_22.xyz = (bool(u_xlatb0)) ? u_xlat16_22.xyz : u_xlat16_7.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_22.xyz;
    u_xlat16_5.xyz = u_xlat16_6.xxx * u_xlat16_5.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz + u_xlat16_1.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_6.xyz;
    u_xlat16_5.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_5.xyz;
    u_xlat16_5.x = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.x = min(max(u_xlat16_5.x, 0.0), 1.0);
#else
    u_xlat16_5.x = clamp(u_xlat16_5.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_21.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_21.xyz = u_xlat16_0.xyz * u_xlat16_21.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * _emissiveColor.xyz;
    u_xlat16_1.xyz = u_xlat16_21.xyz * _emissiveColor.www + u_xlat16_1.xyz;
    u_xlat16_21.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_21.xyz + u_xlat16_1.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb32 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_1.xy = (bool(u_xlatb32)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_1.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat16.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat16.xy = u_xlat16_1.xy * _edgeNoiseParam.xy + u_xlat16.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat16.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb16.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_1.x : 1.0;
    u_xlat16_1.x = (u_xlatb16.y) ? u_xlat16_1.y : u_xlat16_1.x;
    u_xlat16_17 = (-u_xlat16_1.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb16.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb16.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_1.x = (u_xlatb16.x) ? u_xlat16_17 : u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_0.x + u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_1.x = u_xlat16_1.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_49;
    u_xlat16_17 = u_xlat16_1.x * _albedoColor.w + u_xlat16_5.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_17 = min(max(u_xlat16_17, 0.0), 1.0);
#else
    u_xlat16_17 = clamp(u_xlat16_17, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_1.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_17 : u_xlat16_1.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_18;
bvec2 u_xlatb18;
float u_xlat19;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_30;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_42;
float u_xlat54;
float u_xlat55;
bool u_xlatb55;
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
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat8.yyyy;
    u_xlat2 = u_xlat2 * u_xlat8.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat8.zzzz + u_xlat2;
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
    u_xlat16_18 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat54 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat54 = fract(u_xlat54);
    u_xlat16_1.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_inkFlowScale);
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_2 = texture(_albedoMap, u_xlat2.xy);
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat54 = _inkFlowSpeed * _Time.y;
    u_xlat54 = fract(u_xlat54);
    u_xlat1.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat54 = (-u_xlat54) + 0.5;
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat1.xy = u_xlat1.xy * vec2(_inkFlowScale);
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat16_60 = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_60 = abs(u_xlat54) * u_xlat16_60 + u_xlat16_1.w;
    u_xlat16_10.xyz = abs(vec3(u_xlat54)) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat54 + (-_toonLambertThreshold);
    u_xlat16_64 = u_xlat16_64 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + _toonLambertColor.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat55) + u_xlat16_12.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_65 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat3.xyz = u_xlat1.xyw * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat1.xyw * vec3(u_xlat16_65);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat19 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat19 * u_xlat19;
    u_xlat16_65 = u_xlat19 * u_xlat16_65;
    u_xlat16_65 = u_xlat19 * u_xlat16_65;
    u_xlat55 = (-u_xlat16_65) * u_xlat19 + 1.0;
    u_xlat16_65 = u_xlat19 * u_xlat16_65;
    u_xlat3.xyz = u_xlat16_10.xyz * vec3(u_xlat55);
    u_xlat3.xyz = u_xlat18.xxx * vec3(u_xlat16_65) + u_xlat3.xyz;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat18.x = (-u_xlat8.x) * u_xlat16_65 + u_xlat8.x;
    u_xlat18.x = u_xlat8.x * u_xlat18.x + u_xlat16_65;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat8.x;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat19 = (-u_xlat54) * u_xlat16_65 + u_xlat54;
    u_xlat19 = u_xlat54 * u_xlat19 + u_xlat16_65;
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat54 + u_xlat19;
    u_xlat19 = u_xlat19 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat19;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat19 = u_xlat16_65 + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat19 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_65 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat1.x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyw = min(max(u_xlat1.xyw, 0.0), 1.0);
#else
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
#endif
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.xyz;
    u_xlat1.xyw = vec3(u_xlat54) * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_67 = (-u_xlat16_66) + u_xlat16_67;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_66 = u_xlat16_2.w * u_xlat16_67 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_2.w * u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 + -1.0;
    u_xlat16_67 = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_65) * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_65 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat8.y = u_xlat16_2.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_65);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_65 = floor(u_xlat16_2.w);
    u_xlat16_12.x = u_xlat16_65 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_2.x = u_xlat16_12.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_65 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_65 = u_xlat16_12.z * 15.0 + (-u_xlat16_65);
    u_xlat16_12.x = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_12.x + u_xlat16_36;
    u_xlat16_65 = u_xlat16_67 * u_xlat16_65;
    u_xlat0.x = u_xlat3.x * u_xlat16_65;
    u_xlat16_65 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat0.x * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_12.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30 = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30 + u_xlat16_12.x;
    u_xlat16_65 = u_xlat0.y * u_xlat16_65;
    u_xlat16_65 = min(u_xlat16_1.z, u_xlat16_65);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * _emissiveColor.www + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_24.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_24.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_24.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_24.x : 1.0;
    u_xlat16_24.x = (u_xlatb18.y) ? u_xlat16_24.y : u_xlat16_24.x;
    u_xlat16_42 = (-u_xlat16_24.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_42 : u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_0.x + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_24.x = u_xlat16_24.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_60;
    u_xlat16_6.x = u_xlat16_24.x * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _edgeNoiseParam;
uniform 	mediump vec4 _edgeDisturbParam;
uniform 	mediump float _use_Dissolve_UV2;
uniform 	mediump float _edgeNoiseDisturb;
uniform 	mediump float _albedoDissolveDirection;
uniform 	mediump float _albedoDissolveDirectionFlip;
uniform 	mediump float _albedoDissolveThreshold;
uniform 	mediump float _albedoDissolveFallOff;
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
uniform 	mediump float _inkFlowSpeed;
uniform 	mediump float _inkFlowScale;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _edgeNoiseMap;
UNITY_LOCATION(6) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(7) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(9) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _inkFlowMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec3 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec3 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec2 u_xlat18;
mediump float u_xlat16_18;
bvec2 u_xlatb18;
float u_xlat19;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec2 u_xlat16_24;
mediump float u_xlat16_30;
mediump float u_xlat16_36;
int u_xlati36;
bool u_xlatb36;
mediump float u_xlat16_42;
float u_xlat54;
float u_xlat55;
bool u_xlatb55;
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
    u_xlat8.xyz = (bool(u_xlatb4)) ? u_xlat22.xyz : vs_TEXCOORD0.xyz;
    u_xlat3 = u_xlat3 * u_xlat8.yyyy;
    u_xlat2 = u_xlat2 * u_xlat8.xxxx + u_xlat3;
    u_xlat1 = u_xlat1 * u_xlat8.zzzz + u_xlat2;
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
    u_xlat16_18 = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).x;
    u_xlat16_6.x = u_xlat16_18 * _shadowStrength;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_6.x + 1.0;
    u_xlat18.x = u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_6.xyz + _shadowColor.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat54 = _Time.y * _inkFlowSpeed + 0.5;
    u_xlat54 = fract(u_xlat54);
    u_xlat16_1.xyz = texture(_inkFlowMap, vs_TEXCOORD3.xy).xyz;
    u_xlat1.xy = u_xlat16_1.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat2.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat2.xy = u_xlat2.xy * vec2(_inkFlowScale);
    u_xlat2.xy = (-u_xlat2.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_2 = texture(_albedoMap, u_xlat2.xy);
    u_xlat16_10.xyz = u_xlat16_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat54 = _inkFlowSpeed * _Time.y;
    u_xlat54 = fract(u_xlat54);
    u_xlat1.xy = vec2(u_xlat54) * u_xlat1.xy;
    u_xlat54 = (-u_xlat54) + 0.5;
    u_xlat54 = u_xlat54 + u_xlat54;
    u_xlat1.xy = u_xlat1.xy * vec2(_inkFlowScale);
    u_xlat1.xy = (-u_xlat1.xy) * u_xlat16_1.zz + vs_TEXCOORD3.xy;
    u_xlat16_1 = texture(_albedoMap, u_xlat1.xy);
    u_xlat16_11.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_2.xyz * u_xlat16_10.xyz + (-u_xlat16_12.xyz);
    u_xlat16_60 = (-u_xlat16_1.w) + u_xlat16_2.w;
    u_xlat16_60 = abs(u_xlat54) * u_xlat16_60 + u_xlat16_1.w;
    u_xlat16_10.xyz = abs(vec3(u_xlat54)) * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat16_1.xyz * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat16_11.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_1 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_1.www * u_xlat16_11.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_12.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_11.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_64 = (-u_xlat16_1.y) * _metallicMultiplier + 1.0;
    u_xlat16_11.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (-_toonLambertColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat54 = dot(u_xlat7.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_64 = u_xlat54 + (-_toonLambertThreshold);
    u_xlat16_64 = u_xlat16_64 * 20.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_64 = min(max(u_xlat16_64, 0.0), 1.0);
#else
    u_xlat16_64 = clamp(u_xlat16_64, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_64 * -2.0 + 3.0;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_64;
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_12.xyz = vec3(u_xlat16_64) * u_xlat16_12.xyz + _toonLambertColor.xyz;
    u_xlat16_12.xyz = u_xlat16_11.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_13.xyz = vec3(u_xlat55) * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873) + u_xlat16_13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb55 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb55) ? 1.0 : 0.0;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_65 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_65 = max(u_xlat16_65, 6.10351563e-05);
    u_xlat16_66 = inversesqrt(u_xlat16_65);
    u_xlat16_13.xyz = u_xlat2.xyz * vec3(u_xlat16_66);
    u_xlat16_66 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(0.00100000005>=abs(u_xlat16_66));
#else
    u_xlatb55 = 0.00100000005>=abs(u_xlat16_66);
#endif
    u_xlat16_14.xy = (bool(u_xlatb55)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_15.xyz = u_xlat16_14.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * u_xlat16_14.yyy + u_xlat16_15.xyz;
    u_xlat16_66 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_13.xyz);
    u_xlat55 = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_66);
    u_xlat16_66 = u_xlat16_65 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_65 = float(1.0) / float(u_xlat16_65);
    u_xlat16_66 = (-u_xlat16_66) * u_xlat16_66 + 1.0;
    u_xlat16_66 = max(u_xlat16_66, 0.0);
    u_xlat16_66 = u_xlat16_66 * u_xlat16_66;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_66;
    u_xlat16_65 = max(u_xlat16_14.x, u_xlat16_65);
    u_xlat16_64 = u_xlat16_64 * u_xlat16_65;
    u_xlat16_13.xyz = vec3(u_xlat16_64) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat16_13.xyz = u_xlat16_11.xyz * u_xlat16_13.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_13.xyz = u_xlat18.xxx * u_xlat16_13.xyz;
    u_xlat16_12.xyz = u_xlat16_13.xyz * vec3(u_xlat55) + u_xlat16_12.xyz;
    u_xlat16_2.xy = u_xlat16_1.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_10.xyz = u_xlat16_2.yyy * u_xlat16_10.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat18.x = u_xlat16_10.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat1.xyw = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_65 = dot(u_xlat1.xyw, u_xlat1.xyw);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat3.xyz = u_xlat1.xyw * vec3(u_xlat16_65) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_13.xyz = u_xlat1.xyw * vec3(u_xlat16_65);
    u_xlat1.x = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyw = u_xlat1.xxx * u_xlat3.xyz;
    u_xlat16_65 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat7.xyz, u_xlat1.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat19 = (-u_xlat16_65) + 1.0;
    u_xlat16_65 = u_xlat19 * u_xlat19;
    u_xlat16_65 = u_xlat19 * u_xlat16_65;
    u_xlat16_65 = u_xlat19 * u_xlat16_65;
    u_xlat55 = (-u_xlat16_65) * u_xlat19 + 1.0;
    u_xlat16_65 = u_xlat19 * u_xlat16_65;
    u_xlat3.xyz = u_xlat16_10.xyz * vec3(u_xlat55);
    u_xlat3.xyz = u_xlat18.xxx * vec3(u_xlat16_65) + u_xlat3.xyz;
    u_xlat8.x = dot(u_xlat7.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_2.x * u_xlat16_2.x;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat16_65 = u_xlat16_65 * u_xlat16_65;
    u_xlat16_65 = max(u_xlat16_65, 0.0078125);
    u_xlat18.x = (-u_xlat8.x) * u_xlat16_65 + u_xlat8.x;
    u_xlat18.x = u_xlat8.x * u_xlat18.x + u_xlat16_65;
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat8.x;
    u_xlat18.x = u_xlat18.x + 6.10351563e-05;
    u_xlat19 = (-u_xlat54) * u_xlat16_65 + u_xlat54;
    u_xlat19 = u_xlat54 * u_xlat19 + u_xlat16_65;
    u_xlat19 = sqrt(u_xlat19);
    u_xlat19 = u_xlat54 + u_xlat19;
    u_xlat19 = u_xlat19 + 6.10351563e-05;
    u_xlat18.x = u_xlat18.x * u_xlat19;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat19 = u_xlat16_65 + -1.0;
    u_xlat1.x = u_xlat1.x * u_xlat19 + 1.0;
    u_xlat1.x = u_xlat1.x * u_xlat1.x;
    u_xlat1.x = u_xlat16_65 / u_xlat1.x;
    u_xlat1.x = u_xlat1.x * 0.318309873;
    u_xlat1.x = min(u_xlat1.x, 16.0);
    u_xlat18.x = u_xlat18.x * u_xlat1.x;
    u_xlat1.xyw = u_xlat3.xyz * u_xlat18.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyw = min(max(u_xlat1.xyw, 0.0), 1.0);
#else
    u_xlat1.xyw = clamp(u_xlat1.xyw, 0.0, 1.0);
#endif
    u_xlat1.xyw = u_xlat1.xyw * _directSpecularColor.xyz;
    u_xlat1.xyw = vec3(u_xlat54) * u_xlat1.xyw;
    u_xlat1.xyw = u_xlat1.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat59) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_14.xyz + u_xlat7.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_66 = inversesqrt(u_xlat16_66);
    u_xlat16_14.xyz = vec3(u_xlat16_66) * u_xlat16_14.xyz;
    u_xlat16_66 = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_66 = min(max(u_xlat16_66, 0.0), 1.0);
#else
    u_xlat16_66 = clamp(u_xlat16_66, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_66 * 0.5 + 0.5;
    u_xlat16_67 = (-u_xlat16_66) + u_xlat16_67;
    u_xlat16_68 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_2.w = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_66 = u_xlat16_2.w * u_xlat16_67 + u_xlat16_66;
    u_xlat16_66 = u_xlat16_2.w * u_xlat16_66;
    u_xlat16_67 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_67 = min(max(u_xlat16_67, 0.0), 1.0);
#else
    u_xlat16_67 = clamp(u_xlat16_67, 0.0, 1.0);
#endif
    u_xlat16_67 = u_xlat16_67 + -1.0;
    u_xlat16_67 = _occlusionScale * u_xlat16_67 + 1.0;
    u_xlat16_66 = u_xlat16_66 * u_xlat16_67;
    u_xlat0.xy = min(u_xlat0.xz, vec2(u_xlat16_66));
    u_xlat0.x = min(u_xlat0.x, u_xlat16_1.z);
    u_xlat16_15.xyz = u_xlat16_11.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat0.xxx * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat0.xxx + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_11.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_16.y = u_xlat16_14.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_67) * u_xlat16_17.xyz;
    u_xlati36 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati36].xyz;
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlati36 = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati36].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_66 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_17.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot((-u_xlat16_13.xyz), u_xlat7.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xzw = (-u_xlat7.xyz) * u_xlat16_12.xxx + (-u_xlat16_13.xyz);
    u_xlat3.x = dot(u_xlat16_14.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat16_2.z = dot(u_xlat16_14.xyz, u_xlat0.xzw);
    u_xlat16_12.xyz = u_xlat16_2.xzw * vec3(1.09769487, 0.5, 1.0) + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat5.xyz * vec3(u_xlat59) + (-u_xlat0.xzw);
    u_xlat0.xzw = vec3(u_xlat16_65) * u_xlat21.xyz + u_xlat0.xzw;
    u_xlat16_13.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat13.y = u_xlat0.z;
    u_xlat16_13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat13.xz = u_xlat16_13.xz;
    u_xlat16_65 = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat8.y = u_xlat16_2.x;
    u_xlat16_0.xz = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_14.xyz = u_xlat16_10.xyz * u_xlat16_0.xxx + u_xlat16_0.zzz;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_65);
    u_xlat16_15.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xzw = u_xlat16_15.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_15.xyz = u_xlat0.xzw * u_xlat0.xzw;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_16.xyz = vec3(u_xlat16_66) * u_xlat16_15.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_15.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_15.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.xyz;
    u_xlat16_2.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_65 = floor(u_xlat16_2.w);
    u_xlat16_12.x = u_xlat16_65 + 1.0;
    u_xlat16_12.x = min(u_xlat16_12.x, 15.0);
    u_xlat16_2.x = u_xlat16_12.x * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_2.x = u_xlat16_65 * 16.0 + u_xlat16_2.z;
    u_xlat16_12.xy = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_36 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_65 = u_xlat16_12.z * 15.0 + (-u_xlat16_65);
    u_xlat16_12.x = (-u_xlat16_36) + u_xlat16_0.x;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_12.x + u_xlat16_36;
    u_xlat16_65 = u_xlat16_67 * u_xlat16_65;
    u_xlat0.x = u_xlat3.x * u_xlat16_65;
    u_xlat16_65 = u_xlat0.y * 0.5;
    u_xlat16_12.x = (-u_xlat0.y) * 0.5 + 1.0;
    u_xlat16_65 = u_xlat0.x * u_xlat16_12.x + u_xlat16_65;
    u_xlat16_12.x = u_xlat16_65 + u_xlat16_65;
    u_xlat16_30 = (-u_xlat16_65) * 2.0 + 1.0;
    u_xlat16_65 = u_xlat16_65 * u_xlat16_30 + u_xlat16_12.x;
    u_xlat16_65 = u_xlat0.y * u_xlat16_65;
    u_xlat16_65 = min(u_xlat16_1.z, u_xlat16_65);
    u_xlat16_12.xyz = vec3(u_xlat16_65) * u_xlat16_14.xyz;
    u_xlat16_14.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_11.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz + u_xlat16_11.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_6.xyz = u_xlat1.xyw * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_0.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_12.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_0.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _emissiveColor.xyz;
    u_xlat16_11.xyz = u_xlat16_12.xyz * _emissiveColor.www + u_xlat16_11.xyz;
    u_xlat16_12.xyz = (-u_xlat16_11.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_11.xyz;
    u_xlat0.xy = _edgeDisturbParam.zw * _Time.yy;
#ifdef UNITY_ADRENO_ES3
    u_xlatb36 = !!(_use_Dissolve_UV2<0.5);
#else
    u_xlatb36 = _use_Dissolve_UV2<0.5;
#endif
    u_xlat16_24.xy = (bool(u_xlatb36)) ? vs_TEXCOORD3.xy : vs_TEXCOORD3.zw;
    u_xlat0.xy = u_xlat16_24.xy * _edgeDisturbParam.xy + u_xlat0.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).y;
    u_xlat18.xy = _edgeNoiseParam.zw * _Time.yy;
    u_xlat18.xy = u_xlat16_24.xy * _edgeNoiseParam.xy + u_xlat18.xy;
    u_xlat0.xy = u_xlat16_0.xx * vec2(vec2(_edgeNoiseDisturb, _edgeNoiseDisturb)) + u_xlat18.xy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat16_0.x = texture(_edgeNoiseMap, u_xlat0.xy).x;
    u_xlatb18.xy = equal(vec4(vec4(_albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection, _albedoDissolveDirection)), vec4(0.0, 1.0, 0.0, 0.0)).xy;
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_24.x : 1.0;
    u_xlat16_24.x = (u_xlatb18.y) ? u_xlat16_24.y : u_xlat16_24.x;
    u_xlat16_42 = (-u_xlat16_24.x) + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18.x = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip));
#else
    u_xlatb18.x = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_albedoDissolveDirectionFlip);
#endif
    u_xlat16_24.x = (u_xlatb18.x) ? u_xlat16_42 : u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_0.x + u_xlat16_24.x;
    u_xlat16_24.x = u_xlat16_24.x * 0.5 + (-_albedoDissolveThreshold);
    u_xlat16_24.x = u_xlat16_24.x / _albedoDissolveFallOff;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_24.x = min(max(u_xlat16_24.x, 0.0), 1.0);
#else
    u_xlat16_24.x = clamp(u_xlat16_24.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * u_xlat16_60;
    u_xlat16_6.x = u_xlat16_24.x * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_24.x = u_xlat16_24.x * _albedoColor.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_24.x;
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
}
CustomEditor "CodeGenShaderGUI.Theseus_ToonLambert_InkFlowTransOutlineGUI"
}