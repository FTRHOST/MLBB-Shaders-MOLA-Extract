//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "NPR/Hero_NprV2_EnergyBody" {
Properties {

_albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoPower ("Albedo贴图强度", Range(0.1, 5)) = 2.200000047683716

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

_normalMap ("法线贴图", 2D) = "bump" { }

_EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (1,1,1,1)

_UseMoire_ON ("开启摩尔纹效果", Float) = 0.0

_MoireEmissiveMap ("摩尔纹贴图", 2D) = "white" { }

_MoireEmissiveColor ("摩尔纹颜色", Color) = (1,1,1,1)

_Saturation ("摩尔纹饱和度", Range(0, 5)) = 1.0

_MoireEmissiveMask ("摩尔纹遮罩", 2D) = "white" { }

_MoireMaskPower ("摩尔纹遮罩范围", Range(0, 10)) = 1.0

_MoireMaskIntensity ("摩尔纹遮罩强度", Float) = 1.0

_MoireWarpMap ("摩尔纹扭曲贴图", 2D) = "white" { }

_MoireWarp ("摩尔纹扭曲强度", Range(0, 1)) = 0.0

_MoireWarpSpeed ("摩尔纹扭曲流动速度", Range(-1, 1)) = 0.0

_MoireParallax ("摩尔纹视差偏移", Range(-1, 1)) = 0.0

_FresnelMask ("相关遮罩(R:菲涅尔遮罩;G:边缘光遮罩)", 2D) = "white" { }

_FresnelColor ("菲涅尔颜色", Color) = (0,0,0,0)

_FresnelPower ("菲涅尔范围", Range(0, 10)) = 1.0

_FresnelIntensity ("菲涅尔强度", Float) = 1.0

_RimColor ("边缘光颜色", Color) = (1,1,1,1)

_RimPower ("边缘光范围", Range(0, 30)) = 1.5

_RimIntensity ("边缘光强度", Float) = 1.0

_UseFlowLight2U ("流光启用3U", Float) = 0.0

_FlowLightMask ("流光遮罩", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

_CubeMap ("环境贴图", Cube) = "white" { }

_CubeMask ("环境贴图遮罩", 2D) = "white" { }

_CubeMapMip ("环境贴图Mip", Range(1, 7)) = 1.0

_CubeMapIntensity ("环境贴图强度", Range(0, 5)) = 1.0

_AlphaMask ("透明遮罩", 2D) = "white" { }

_Alpha ("外层透明度", Range(0, 1)) = 1.0

_InsideAlpha ("内层透明度", Range(0, 1)) = 1.0

_OutlineWidth ("描边宽度", Range(0, 0.1)) = 0.009999999776482582

_OutlineColor ("描边颜色", Color) = (0,0,0,1)

}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
 Name "InsideAlpha"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Cull Front
  GpuProgramID 31972
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump float _InsideAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _AlphaMask;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_AlphaMask, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_0 * _InsideAlpha;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
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
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD0;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump float _InsideAlpha;
UNITY_LOCATION(0) uniform mediump sampler2D _AlphaMask;
in highp vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
mediump float u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_AlphaMask, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat16_0 * _InsideAlpha;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump float _InsideAlpha;
uniform lowp sampler2D _AlphaMask;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_AlphaMask, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_0 * _InsideAlpha;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
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
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
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
uniform 	mediump float _InsideAlpha;
uniform lowp sampler2D _AlphaMask;
varying highp vec2 vs_TEXCOORD0;
#define SV_Target0 gl_FragData[0]
lowp float u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_AlphaMask, vs_TEXCOORD0.xy).x;
    SV_Target0.w = u_xlat10_0 * _InsideAlpha;
    SV_Target0.xyz = vec3(0.0, 0.0, 0.0);
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
  Tags { "LIGHTMODE" = "FORWARDBASE" "QUEUE" = "Transparent" "RenderType" = "Transparent" "SHADOWSUPPORT" = "true" }
  GpuProgramID 114043
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_NORMAL0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
    vs_NORMAL0.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD1.w = u_xlat16_2;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _albedoPower;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump float _UseMoire_ON;
uniform 	mediump vec4 _MoireEmissiveMap_ST;
uniform 	mediump vec4 _MoireEmissiveColor;
uniform 	mediump float _MoireMaskPower;
uniform 	mediump float _MoireMaskIntensity;
uniform 	mediump vec4 _MoireWarpMap_ST;
uniform 	mediump float _MoireWarp;
uniform 	mediump float _MoireWarpSpeed;
uniform 	mediump float _MoireParallax;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _CubeMapMip;
uniform 	mediump float _CubeMapIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MoireEmissiveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MoireEmissiveMask;
UNITY_LOCATION(5) uniform mediump sampler2D _MoireWarpMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(8) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _CubeMask;
UNITY_LOCATION(10) uniform mediump samplerCube _CubeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_NORMAL0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
float u_xlat16;
mediump float u_xlat16_16;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xy = texture(_normalMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_22 = (-u_xlat16_22) + 1.0;
    u_xlat16_1.z = sqrt(u_xlat16_22);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat2.z = vs_NORMAL0.x;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_NORMAL0.xyz);
    u_xlat16_1.xyz = (-vs_NORMAL0.yzx) * u_xlat16_1.xxx + vs_TEXCOORD1.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_NORMAL0.zxy;
    u_xlat4.xyz = vs_NORMAL0.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD1.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_NORMAL0.y;
    u_xlat2.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_NORMAL0.z;
    u_xlat2.z = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, (-u_xlat16_1.xyz));
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_2 = textureLod(_CubeMap, u_xlat2.xyz, _CubeMapMip);
    u_xlat16_5.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = max(abs(u_xlat16_5.xyz), vec3(0.00048828125, 0.00048828125, 0.00048828125));
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_CubeMapIntensity, _CubeMapIntensity, _CubeMapIntensity));
    u_xlat16_21 = texture(_CubeMask, vs_TEXCOORD3.xy).x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_albedoPower, _albedoPower, _albedoPower));
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_5.xyz = u_xlat16_6.xyz * _AlbedoColor.xyz + u_xlat16_5.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(abs(u_xlat0.x), 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = u_xlat0.x * _FresnelPower;
    u_xlat7 = exp2(u_xlat7);
    u_xlat16_22 = max(_FresnelIntensity, 0.0);
    u_xlat7 = u_xlat7 * u_xlat16_22;
    u_xlat7 = min(u_xlat7, 1.0);
    u_xlat16_14.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat14.x = u_xlat16_14.x * u_xlat7;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat2.xyz * _FresnelColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_5.xyz;
    u_xlat14.x = u_xlat0.x * _MoireMaskPower;
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat16_22 = max(_MoireMaskIntensity, 0.0);
    u_xlat14.x = u_xlat14.x * u_xlat16_22;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat9.x = (-u_xlat14.x) + 1.0;
    u_xlat16_16 = texture(_MoireEmissiveMask, vs_TEXCOORD3.xy).x;
    u_xlat9.x = min(u_xlat16_16, u_xlat9.x);
    u_xlat3.xy = _Time.yy * vec2(vec2(_MoireWarpSpeed, _MoireWarpSpeed)) + _MoireWarpMap_ST.zw;
    u_xlat3.xy = vs_TEXCOORD4.xy * _MoireWarpMap_ST.xy + u_xlat3.xy;
    u_xlat16_23 = texture(_MoireWarpMap, u_xlat3.xy).x;
    u_xlat16_22 = u_xlat16_23 * 2.0 + -1.0;
    u_xlat3.xy = vec2(u_xlat16_22) * vec2(_MoireWarp) + vs_TEXCOORD4.xy;
    u_xlat3.xy = u_xlat3.xy * _MoireEmissiveMap_ST.xy + _MoireEmissiveMap_ST.zw;
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat3.xy = vec2(vec2(_MoireParallax, _MoireParallax)) * u_xlat4.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_MoireEmissiveMap, u_xlat3.xy).xyz;
    u_xlat10.xyz = vec3(u_xlat16_16) * u_xlat16_3.xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) * u_xlat16_16 + 1.0;
    u_xlat14.x = max(u_xlat14.x, u_xlat16_16);
    u_xlat14.x = u_xlat14.x * (-u_xlat10.x) + u_xlat10.x;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat16_8.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz;
    u_xlat16 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz + (-vec3(u_xlat16));
    u_xlat3.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat3.xyz + vec3(u_xlat16);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * u_xlat14.xxx + u_xlat9.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * vec3(_UseMoire_ON);
    u_xlat16_26 = (-_UseMoire_ON) + 1.0;
    u_xlat16_8.xyz = u_xlat16_5.xyz * vec3(u_xlat16_26) + u_xlat16_8.xyz;
    u_xlat16_5.x = max(_RimIntensity, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat9.xyz = u_xlat0.xxx * _RimColor.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * u_xlat16_14.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat14.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat9.xy = bool(u_xlatb0) ? vs_TEXCOORD4.xy : vec2(0.0, 0.0);
    u_xlat0.xz = u_xlat14.xy + u_xlat9.xy;
    u_xlat16_5.xy = u_xlat0.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_5.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_26 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    u_xlat16_0.x = texture(_FlowLightTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_0.x);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_8.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_AlphaMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = max(u_xlat16_2.x, u_xlat16_0.x);
    u_xlat0.x = max(u_xlat7, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_NORMAL0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
    vs_NORMAL0.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD1.w = u_xlat16_2;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _albedoPower;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump float _UseMoire_ON;
uniform 	mediump vec4 _MoireEmissiveMap_ST;
uniform 	mediump vec4 _MoireEmissiveColor;
uniform 	mediump float _MoireMaskPower;
uniform 	mediump float _MoireMaskIntensity;
uniform 	mediump vec4 _MoireWarpMap_ST;
uniform 	mediump float _MoireWarp;
uniform 	mediump float _MoireWarpSpeed;
uniform 	mediump float _MoireParallax;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _CubeMapMip;
uniform 	mediump float _CubeMapIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MoireEmissiveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MoireEmissiveMask;
UNITY_LOCATION(5) uniform mediump sampler2D _MoireWarpMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(8) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _CubeMask;
UNITY_LOCATION(10) uniform mediump samplerCube _CubeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_NORMAL0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
float u_xlat16;
mediump float u_xlat16_16;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xy = texture(_normalMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_22 = (-u_xlat16_22) + 1.0;
    u_xlat16_1.z = sqrt(u_xlat16_22);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat2.z = vs_NORMAL0.x;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_NORMAL0.xyz);
    u_xlat16_1.xyz = (-vs_NORMAL0.yzx) * u_xlat16_1.xxx + vs_TEXCOORD1.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_NORMAL0.zxy;
    u_xlat4.xyz = vs_NORMAL0.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD1.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_NORMAL0.y;
    u_xlat2.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_NORMAL0.z;
    u_xlat2.z = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, (-u_xlat16_1.xyz));
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_2 = textureLod(_CubeMap, u_xlat2.xyz, _CubeMapMip);
    u_xlat16_5.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = max(abs(u_xlat16_5.xyz), vec3(0.00048828125, 0.00048828125, 0.00048828125));
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_CubeMapIntensity, _CubeMapIntensity, _CubeMapIntensity));
    u_xlat16_21 = texture(_CubeMask, vs_TEXCOORD3.xy).x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_albedoPower, _albedoPower, _albedoPower));
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_5.xyz = u_xlat16_6.xyz * _AlbedoColor.xyz + u_xlat16_5.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(abs(u_xlat0.x), 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = u_xlat0.x * _FresnelPower;
    u_xlat7 = exp2(u_xlat7);
    u_xlat16_22 = max(_FresnelIntensity, 0.0);
    u_xlat7 = u_xlat7 * u_xlat16_22;
    u_xlat7 = min(u_xlat7, 1.0);
    u_xlat16_14.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat14.x = u_xlat16_14.x * u_xlat7;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat2.xyz * _FresnelColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_5.xyz;
    u_xlat14.x = u_xlat0.x * _MoireMaskPower;
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat16_22 = max(_MoireMaskIntensity, 0.0);
    u_xlat14.x = u_xlat14.x * u_xlat16_22;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat9.x = (-u_xlat14.x) + 1.0;
    u_xlat16_16 = texture(_MoireEmissiveMask, vs_TEXCOORD3.xy).x;
    u_xlat9.x = min(u_xlat16_16, u_xlat9.x);
    u_xlat3.xy = _Time.yy * vec2(vec2(_MoireWarpSpeed, _MoireWarpSpeed)) + _MoireWarpMap_ST.zw;
    u_xlat3.xy = vs_TEXCOORD4.xy * _MoireWarpMap_ST.xy + u_xlat3.xy;
    u_xlat16_23 = texture(_MoireWarpMap, u_xlat3.xy).x;
    u_xlat16_22 = u_xlat16_23 * 2.0 + -1.0;
    u_xlat3.xy = vec2(u_xlat16_22) * vec2(_MoireWarp) + vs_TEXCOORD4.xy;
    u_xlat3.xy = u_xlat3.xy * _MoireEmissiveMap_ST.xy + _MoireEmissiveMap_ST.zw;
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat3.xy = vec2(vec2(_MoireParallax, _MoireParallax)) * u_xlat4.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_MoireEmissiveMap, u_xlat3.xy).xyz;
    u_xlat10.xyz = vec3(u_xlat16_16) * u_xlat16_3.xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) * u_xlat16_16 + 1.0;
    u_xlat14.x = max(u_xlat14.x, u_xlat16_16);
    u_xlat14.x = u_xlat14.x * (-u_xlat10.x) + u_xlat10.x;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat16_8.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz;
    u_xlat16 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz + (-vec3(u_xlat16));
    u_xlat3.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat3.xyz + vec3(u_xlat16);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * u_xlat14.xxx + u_xlat9.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * vec3(_UseMoire_ON);
    u_xlat16_26 = (-_UseMoire_ON) + 1.0;
    u_xlat16_8.xyz = u_xlat16_5.xyz * vec3(u_xlat16_26) + u_xlat16_8.xyz;
    u_xlat16_5.x = max(_RimIntensity, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat9.xyz = u_xlat0.xxx * _RimColor.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * u_xlat16_14.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat14.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat9.xy = bool(u_xlatb0) ? vs_TEXCOORD4.xy : vec2(0.0, 0.0);
    u_xlat0.xz = u_xlat14.xy + u_xlat9.xy;
    u_xlat16_5.xy = u_xlat0.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_5.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_26 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    u_xlat16_0.x = texture(_FlowLightTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_0.x);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_8.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_AlphaMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = max(u_xlat16_2.x, u_xlat16_0.x);
    u_xlat0.x = max(u_xlat7, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_NORMAL0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
    vs_NORMAL0.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD1.w = u_xlat16_2;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _albedoPower;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump float _UseMoire_ON;
uniform 	mediump vec4 _MoireEmissiveMap_ST;
uniform 	mediump vec4 _MoireEmissiveColor;
uniform 	mediump float _MoireMaskPower;
uniform 	mediump float _MoireMaskIntensity;
uniform 	mediump vec4 _MoireWarpMap_ST;
uniform 	mediump float _MoireWarp;
uniform 	mediump float _MoireWarpSpeed;
uniform 	mediump float _MoireParallax;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _CubeMapMip;
uniform 	mediump float _CubeMapIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MoireEmissiveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MoireEmissiveMask;
UNITY_LOCATION(5) uniform mediump sampler2D _MoireWarpMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(8) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _CubeMask;
UNITY_LOCATION(10) uniform mediump samplerCube _CubeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_NORMAL0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
float u_xlat16;
mediump float u_xlat16_16;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xy = texture(_normalMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_22 = (-u_xlat16_22) + 1.0;
    u_xlat16_1.z = sqrt(u_xlat16_22);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat2.z = vs_NORMAL0.x;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_NORMAL0.xyz);
    u_xlat16_1.xyz = (-vs_NORMAL0.yzx) * u_xlat16_1.xxx + vs_TEXCOORD1.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_NORMAL0.zxy;
    u_xlat4.xyz = vs_NORMAL0.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD1.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_NORMAL0.y;
    u_xlat2.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_NORMAL0.z;
    u_xlat2.z = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, (-u_xlat16_1.xyz));
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_2 = textureLod(_CubeMap, u_xlat2.xyz, _CubeMapMip);
    u_xlat16_5.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = max(abs(u_xlat16_5.xyz), vec3(0.00048828125, 0.00048828125, 0.00048828125));
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_CubeMapIntensity, _CubeMapIntensity, _CubeMapIntensity));
    u_xlat16_21 = texture(_CubeMask, vs_TEXCOORD3.xy).x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_albedoPower, _albedoPower, _albedoPower));
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_5.xyz = u_xlat16_6.xyz * _AlbedoColor.xyz + u_xlat16_5.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(abs(u_xlat0.x), 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = u_xlat0.x * _FresnelPower;
    u_xlat7 = exp2(u_xlat7);
    u_xlat16_22 = max(_FresnelIntensity, 0.0);
    u_xlat7 = u_xlat7 * u_xlat16_22;
    u_xlat7 = min(u_xlat7, 1.0);
    u_xlat16_14.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat14.x = u_xlat16_14.x * u_xlat7;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat2.xyz * _FresnelColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_5.xyz;
    u_xlat14.x = u_xlat0.x * _MoireMaskPower;
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat16_22 = max(_MoireMaskIntensity, 0.0);
    u_xlat14.x = u_xlat14.x * u_xlat16_22;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat9.x = (-u_xlat14.x) + 1.0;
    u_xlat16_16 = texture(_MoireEmissiveMask, vs_TEXCOORD3.xy).x;
    u_xlat9.x = min(u_xlat16_16, u_xlat9.x);
    u_xlat3.xy = _Time.yy * vec2(vec2(_MoireWarpSpeed, _MoireWarpSpeed)) + _MoireWarpMap_ST.zw;
    u_xlat3.xy = vs_TEXCOORD4.xy * _MoireWarpMap_ST.xy + u_xlat3.xy;
    u_xlat16_23 = texture(_MoireWarpMap, u_xlat3.xy).x;
    u_xlat16_22 = u_xlat16_23 * 2.0 + -1.0;
    u_xlat3.xy = vec2(u_xlat16_22) * vec2(_MoireWarp) + vs_TEXCOORD4.xy;
    u_xlat3.xy = u_xlat3.xy * _MoireEmissiveMap_ST.xy + _MoireEmissiveMap_ST.zw;
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat3.xy = vec2(vec2(_MoireParallax, _MoireParallax)) * u_xlat4.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_MoireEmissiveMap, u_xlat3.xy).xyz;
    u_xlat10.xyz = vec3(u_xlat16_16) * u_xlat16_3.xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) * u_xlat16_16 + 1.0;
    u_xlat14.x = max(u_xlat14.x, u_xlat16_16);
    u_xlat14.x = u_xlat14.x * (-u_xlat10.x) + u_xlat10.x;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat16_8.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz;
    u_xlat16 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz + (-vec3(u_xlat16));
    u_xlat3.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat3.xyz + vec3(u_xlat16);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * u_xlat14.xxx + u_xlat9.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * vec3(_UseMoire_ON);
    u_xlat16_26 = (-_UseMoire_ON) + 1.0;
    u_xlat16_8.xyz = u_xlat16_5.xyz * vec3(u_xlat16_26) + u_xlat16_8.xyz;
    u_xlat16_5.x = max(_RimIntensity, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat9.xyz = u_xlat0.xxx * _RimColor.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * u_xlat16_14.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat14.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat9.xy = bool(u_xlatb0) ? vs_TEXCOORD4.xy : vec2(0.0, 0.0);
    u_xlat0.xz = u_xlat14.xy + u_xlat9.xy;
    u_xlat16_5.xy = u_xlat0.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_5.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_26 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    u_xlat16_0.x = texture(_FlowLightTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_0.x);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_8.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_AlphaMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = max(u_xlat16_2.x, u_xlat16_0.x);
    u_xlat0.x = max(u_xlat7, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
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
in highp vec2 in_TEXCOORD0;
in highp vec2 in_TEXCOORD1;
in highp vec2 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_NORMAL0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
vec3 u_xlat0;
vec4 u_xlat1;
mediump float u_xlat16_2;
vec3 u_xlat3;
float u_xlat12;
bool u_xlatb12;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    vs_TEXCOORD0.xyz = u_xlat0.xyz;
    gl_Position = u_xlat1 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD0.w = 0.0;
    u_xlat0.x = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(in_NORMAL0.xyz, hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat12 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat0.xyz = vec3(u_xlat12) * u_xlat0.xyz;
    vs_NORMAL0.xyz = u_xlat0.xyz;
    vs_NORMAL0.w = 0.0;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat12 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat12 = max(u_xlat12, 1.17549435e-38);
    u_xlat12 = inversesqrt(u_xlat12);
    u_xlat1.xyz = vec3(u_xlat12) * u_xlat1.xyz;
    vs_TEXCOORD1.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb12 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat12 = (u_xlatb12) ? 1.0 : -1.0;
    u_xlat16_2 = u_xlat12 * in_TANGENT0.w;
    vs_TEXCOORD1.w = u_xlat16_2;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat0.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    vs_TEXCOORD2.xyz = vec3(u_xlat16_2) * u_xlat0.xyz;
    vs_TEXCOORD2.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    vs_TEXCOORD4.xy = in_TEXCOORD2.xy;
    vs_TEXCOORD4.zw = vec2(0.0, 0.0);
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
uniform 	mediump vec4 _FogCol;
uniform 	mediump float _albedoPower;
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump float _UseMoire_ON;
uniform 	mediump vec4 _MoireEmissiveMap_ST;
uniform 	mediump vec4 _MoireEmissiveColor;
uniform 	mediump float _MoireMaskPower;
uniform 	mediump float _MoireMaskIntensity;
uniform 	mediump vec4 _MoireWarpMap_ST;
uniform 	mediump float _MoireWarp;
uniform 	mediump float _MoireWarpSpeed;
uniform 	mediump float _MoireParallax;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _RimColor;
uniform 	mediump float _RimPower;
uniform 	mediump float _RimIntensity;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump float _CubeMapMip;
uniform 	mediump float _CubeMapIntensity;
uniform 	mediump float _Saturation;
uniform 	mediump float _Alpha;
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
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(1) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(2) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(3) uniform mediump sampler2D _MoireEmissiveMap;
UNITY_LOCATION(4) uniform mediump sampler2D _MoireEmissiveMask;
UNITY_LOCATION(5) uniform mediump sampler2D _MoireWarpMap;
UNITY_LOCATION(6) uniform mediump sampler2D _FresnelMask;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(8) uniform mediump sampler2D _AlphaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _CubeMask;
UNITY_LOCATION(10) uniform mediump samplerCube _CubeMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_NORMAL0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec3 u_xlat3;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
float u_xlat7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec2 u_xlat14;
mediump vec2 u_xlat16_14;
float u_xlat16;
mediump float u_xlat16_16;
float u_xlat21;
mediump float u_xlat16_21;
mediump float u_xlat16_22;
mediump float u_xlat16_23;
mediump float u_xlat16_26;
void main()
{
    u_xlat16_0.xy = texture(_normalMap, vs_TEXCOORD3.xy).xy;
    u_xlat16_1.xy = u_xlat16_0.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_22 = dot(u_xlat16_1.xy, u_xlat16_1.xy);
    u_xlat16_22 = (-u_xlat16_22) + 1.0;
    u_xlat16_1.z = sqrt(u_xlat16_22);
    u_xlat0.x = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_1.xyz;
    u_xlat2.z = vs_NORMAL0.x;
    u_xlat16_1.x = dot(vs_TEXCOORD1.xyz, vs_NORMAL0.xyz);
    u_xlat16_1.xyz = (-vs_NORMAL0.yzx) * u_xlat16_1.xxx + vs_TEXCOORD1.yzx;
    u_xlat21 = dot(u_xlat16_1.xyz, u_xlat16_1.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat3.xyz = vec3(u_xlat21) * u_xlat16_1.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_NORMAL0.zxy;
    u_xlat4.xyz = vs_NORMAL0.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD1.www;
    u_xlat2.y = u_xlat4.x;
    u_xlat2.x = u_xlat3.z;
    u_xlat2.x = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat3.y = u_xlat4.z;
    u_xlat3.z = vs_NORMAL0.y;
    u_xlat2.y = dot(u_xlat0.xyz, u_xlat3.xyz);
    u_xlat4.z = vs_NORMAL0.z;
    u_xlat2.z = dot(u_xlat0.xyz, u_xlat4.xyz);
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat2.xyz;
    u_xlat2.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_1.xyz = u_xlat16_1.xxx * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, (-u_xlat16_1.xyz));
    u_xlat21 = u_xlat21 + u_xlat21;
    u_xlat2.xyz = u_xlat16_1.xyz * vec3(u_xlat21) + u_xlat0.xyz;
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat2.xyz = vec3(u_xlat21) * u_xlat2.xyz;
    u_xlat16_2 = textureLod(_CubeMap, u_xlat2.xyz, _CubeMapMip);
    u_xlat16_5.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = max(abs(u_xlat16_5.xyz), vec3(0.00048828125, 0.00048828125, 0.00048828125));
    u_xlat2.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat2.xyz * vec3(vec3(_CubeMapIntensity, _CubeMapIntensity, _CubeMapIntensity));
    u_xlat16_21 = texture(_CubeMask, vs_TEXCOORD3.xy).x;
    u_xlat16_5.xyz = vec3(u_xlat16_21) * u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_albedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = log2(u_xlat16_2.xyz);
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(vec3(_albedoPower, _albedoPower, _albedoPower));
    u_xlat16_6.xyz = exp2(u_xlat16_6.xyz);
    u_xlat16_5.xyz = u_xlat16_6.xyz * _AlbedoColor.xyz + u_xlat16_5.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = max(u_xlat21, 1.17549435e-38);
    u_xlat21 = inversesqrt(u_xlat21);
    u_xlat0.xyz = vec3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.x = dot(u_xlat0.xyz, u_xlat16_1.xyz);
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = max(abs(u_xlat0.x), 0.00048828125);
    u_xlat0.x = log2(u_xlat0.x);
    u_xlat7 = u_xlat0.x * _FresnelPower;
    u_xlat7 = exp2(u_xlat7);
    u_xlat16_22 = max(_FresnelIntensity, 0.0);
    u_xlat7 = u_xlat7 * u_xlat16_22;
    u_xlat7 = min(u_xlat7, 1.0);
    u_xlat16_14.xy = texture(_FresnelMask, vs_TEXCOORD3.xy).xy;
    u_xlat14.x = u_xlat16_14.x * u_xlat7;
    u_xlat2.xyz = u_xlat16_5.xyz * u_xlat14.xxx;
    u_xlat2.xyz = u_xlat2.xyz * _FresnelColor.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xyz = min(max(u_xlat2.xyz, 0.0), 1.0);
#else
    u_xlat2.xyz = clamp(u_xlat2.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat2.xyz + u_xlat16_5.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_5.xyz = min(max(u_xlat16_5.xyz, 0.0), 1.0);
#else
    u_xlat16_5.xyz = clamp(u_xlat16_5.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_2.xyz * _EmissiveColor.xyz + u_xlat16_5.xyz;
    u_xlat14.x = u_xlat0.x * _MoireMaskPower;
    u_xlat0.x = u_xlat0.x * _RimPower;
    u_xlat0.x = exp2(u_xlat0.x);
    u_xlat14.x = exp2(u_xlat14.x);
    u_xlat16_22 = max(_MoireMaskIntensity, 0.0);
    u_xlat14.x = u_xlat14.x * u_xlat16_22;
    u_xlat14.x = min(u_xlat14.x, 1.0);
    u_xlat9.x = (-u_xlat14.x) + 1.0;
    u_xlat16_16 = texture(_MoireEmissiveMask, vs_TEXCOORD3.xy).x;
    u_xlat9.x = min(u_xlat16_16, u_xlat9.x);
    u_xlat3.xy = _Time.yy * vec2(vec2(_MoireWarpSpeed, _MoireWarpSpeed)) + _MoireWarpMap_ST.zw;
    u_xlat3.xy = vs_TEXCOORD4.xy * _MoireWarpMap_ST.xy + u_xlat3.xy;
    u_xlat16_23 = texture(_MoireWarpMap, u_xlat3.xy).x;
    u_xlat16_22 = u_xlat16_23 * 2.0 + -1.0;
    u_xlat3.xy = vec2(u_xlat16_22) * vec2(_MoireWarp) + vs_TEXCOORD4.xy;
    u_xlat3.xy = u_xlat3.xy * _MoireEmissiveMap_ST.xy + _MoireEmissiveMap_ST.zw;
    u_xlat4.x = dot(vs_TEXCOORD1.xyz, u_xlat16_1.xyz);
    u_xlat4.y = dot(vs_TEXCOORD2.xyz, u_xlat16_1.xyz);
    u_xlat3.xy = vec2(vec2(_MoireParallax, _MoireParallax)) * u_xlat4.xy + u_xlat3.xy;
    u_xlat16_3.xyz = texture(_MoireEmissiveMap, u_xlat3.xy).xyz;
    u_xlat10.xyz = vec3(u_xlat16_16) * u_xlat16_3.xyz;
    u_xlat16_1.x = (-u_xlat16_3.x) * u_xlat16_16 + 1.0;
    u_xlat14.x = max(u_xlat14.x, u_xlat16_16);
    u_xlat14.x = u_xlat14.x * (-u_xlat10.x) + u_xlat10.x;
    u_xlat14.x = (-u_xlat14.x) + 1.0;
    u_xlat16_8.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz;
    u_xlat16 = dot(u_xlat16_8.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat3.xyz = u_xlat10.xyz * _MoireEmissiveColor.xyz + (-vec3(u_xlat16));
    u_xlat3.xyz = vec3(vec3(_Saturation, _Saturation, _Saturation)) * u_xlat3.xyz + vec3(u_xlat16);
    u_xlat9.xyz = u_xlat9.xxx * u_xlat3.xyz;
    u_xlat9.xyz = u_xlat16_5.xyz * u_xlat14.xxx + u_xlat9.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * vec3(_UseMoire_ON);
    u_xlat16_26 = (-_UseMoire_ON) + 1.0;
    u_xlat16_8.xyz = u_xlat16_5.xyz * vec3(u_xlat16_26) + u_xlat16_8.xyz;
    u_xlat16_5.x = max(_RimIntensity, 0.0);
    u_xlat0.x = u_xlat0.x * u_xlat16_5.x;
    u_xlat9.xyz = u_xlat0.xxx * _RimColor.xyz;
    u_xlat16_8.xyz = u_xlat9.xyz * u_xlat16_14.yyy + u_xlat16_8.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb0 = _UseFlowLight2U>=0.5;
#endif
    u_xlat14.xy = (bool(u_xlatb0)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat9.xy = bool(u_xlatb0) ? vs_TEXCOORD4.xy : vec2(0.0, 0.0);
    u_xlat0.xz = u_xlat14.xy + u_xlat9.xy;
    u_xlat16_5.xy = u_xlat0.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_5.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xz).x;
    u_xlat16_5.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_26 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_26) * u_xlat16_5.xyz;
    u_xlat16_0.x = texture(_FlowLightTex, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = min(u_xlat16_1.x, u_xlat16_0.x);
    u_xlat16_1.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_8.xyz;
    u_xlat16_5.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_1.xyz;
    u_xlat16_0.x = texture(_AlphaMask, vs_TEXCOORD3.xy).x;
    u_xlat16_1.x = max(u_xlat16_2.x, u_xlat16_0.x);
    u_xlat0.x = max(u_xlat7, u_xlat16_1.x);
    u_xlat0.x = u_xlat0.x * _Alpha;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    SV_Target0.w = u_xlat0.x;
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
}
}
 Pass {
 Name "Outline"
  Tags { "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 ZWrite Off
 Cull Front
  GpuProgramID 180037
Program "vp" {
SubProgram "gles hw_tier00 " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump float _OutlineWidth;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.x = in_COLOR0.x * _OutlineWidth;
    u_xlat0.xyz = in_NORMAL0.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _OutlineColor;
uniform lowp sampler2D _albedoMap;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_albedoMap, vs_TEXCOORD3.xy);
    SV_Target0 = u_xlat10_0 * _OutlineColor;
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
uniform 	mediump float _OutlineWidth;
attribute highp vec4 in_POSITION0;
attribute highp vec3 in_NORMAL0;
attribute highp vec4 in_COLOR0;
attribute highp vec2 in_TEXCOORD0;
varying highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.x = in_COLOR0.x * _OutlineWidth;
    u_xlat0.xyz = in_NORMAL0.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _OutlineColor;
uniform lowp sampler2D _albedoMap;
varying highp vec2 vs_TEXCOORD3;
#define SV_Target0 gl_FragData[0]
lowp vec4 u_xlat10_0;
void main()
{
    u_xlat10_0 = texture2D(_albedoMap, vs_TEXCOORD3.xy);
    SV_Target0 = u_xlat10_0 * _OutlineColor;
    return;
}

#endif
"
}
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
uniform 	mediump float _OutlineWidth;
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
in highp vec3 in_NORMAL0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.x = in_COLOR0.x * _OutlineWidth;
    u_xlat0.xyz = in_NORMAL0.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _OutlineColor;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    SV_Target0 = u_xlat16_0 * _OutlineColor;
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
uniform 	mediump float _OutlineWidth;
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
in highp vec3 in_NORMAL0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out highp vec2 vs_TEXCOORD3;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.x = in_COLOR0.x * _OutlineWidth;
    u_xlat0.xyz = in_NORMAL0.xyz * u_xlat0.xxx + in_POSITION0.xyz;
    u_xlat1.xyz = u_xlat0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyw = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * u_xlat0.xxx + u_xlat1.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * u_xlat0.zzz + u_xlat0.xyw;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
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
uniform 	mediump vec4 _OutlineColor;
UNITY_LOCATION(0) uniform mediump sampler2D _albedoMap;
in highp vec2 vs_TEXCOORD3;
layout(location = 0) out mediump vec4 SV_Target0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    SV_Target0 = u_xlat16_0 * _OutlineColor;
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
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  GpuProgramID 205867
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
CustomEditor "CodeGenShaderGUI.Show_NprV2_EnergyBodyGUI"
}