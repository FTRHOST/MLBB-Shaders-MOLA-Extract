//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic)_GradientFlowHair_ColorChang" {
Properties {

_cull ("剔除模式", Float) = 2.0

_renderingMode ("渲染模式", Float) = 0.0

_cutoff ("AlphaCut", Range(0, 1)) = 0.0

_srcblend ("源混合", Float) = 1.0

_dstblend ("目标混合", Float) = 0.0

_srcblendalpha ("源透明", Float) = 1.0

_dstblendalpha ("目标混合", Float) = 0.0

_specularAlphaMode ("高光透明模式", Float) = 1.0

[Toggle] _alphatomask ("AlphaToCoverage", Float) = 0.0

_SpecularOcclusionLut3D ("高光遮挡Lut3D", 2D) = "black" { }

_DfgTexture ("DFG贴图", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_AlbedoMap ("Albedo贴图", 2D) = "white" { }

_AlbedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _MaterialParamsMap ("RMO贴图", 2D) = "white" { }

_MetallicMultiplier ("金属度", Range(0, 1)) = 1.0

_RoughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _NormalMap ("法线贴图", 2D) = "bump" { }

[Tex] _EmissiveMap ("自发光贴图", 2D) = "white" { }

_EmissiveColor ("自发光颜色", Color) = (0,0,0,1)

_MergeTex01 ("合并贴图01", 2D) = "white" { }

_MergeTex02 ("合并贴图02", 2D) = "white" { }

_ChangColorDissolveMap_ST ("换色边缘扰动贴图缩放偏移(XY:缩放; ZW:位移)", Vector) = (1,1,0,0)

_AlbedoChangMap ("换色后Albedo贴图", 2D) = "white" { }

_AlbedoChangColor ("换色后Albedo颜色", Color) = (1,1,1,1)

_UpChangEdgeColor ("上层换色边缘颜色", Color) = (1,1,1,1)

_UpChangColorShrink ("上层换色边缘压缩", Float) = 5.0

_UpChangColorRange ("上层换色边缘范围", Float) = 1.0

_ChangEdgeColor ("下层换色边缘颜色", Color) = (1,1,1,1)

_ChangColorShrink ("下层换色边缘压缩", Float) = 5.0

_ChangColorRange ("下层换色边缘范围", Float) = 1.0

_ChangColorAmount ("换色进度", Range(-2, 2)) = 0.0

_GradientFlowDirSpeed ("彩色流动方向速度", Vector) = (1,0,0,0)

_GlitterFlowFactory ("闪点流动方向速度", Vector) = (1,1,1,1)

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_GlitterFlowMaskFactory ("闪点遮罩参数", Vector) = (1,1,1,1)

_GlitterFlowTilling ("闪点遮罩缩放偏移(XY:缩放; ZW:位移)", Vector) = (1,1,0,0)

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightTex ("流光纹理", 2D) = "black" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,1,1,1)

_FresnelColor ("边缘光颜色", Color) = (1,1,1,1)

_FresnelSaturation ("边缘光饱和度", Range(0, 10)) = 1.0

_FresnelOffset ("边缘光偏移", Vector) = (1,1,1,1)

_FresnelPower ("边缘光范围", Range(0, 10)) = 5.0

_FresnelIntensity ("边缘光强度", Range(0, 5)) = 1.0

_AnisotropicMap ("各向异性扰动贴图", 2D) = "white" { }

_SunShift ("主要各向异性扭曲", Float) = 1.0

_SunShiftOffset ("主要各向异性偏移", Float) = 1.0

_AnisotropicMultiplier ("主要各项异性强度", Range(0, 1)) = 1.0

_SunShift2nd ("次要各向异性扭曲", Float) = 1.0

_SunShiftOffset2nd ("次要各向异性偏移", Float) = 1.0

_AnisotropicMultiplier2nd ("次要各项异性强度", Range(0, 1)) = 1.0

_DirectSpecularColor ("主要各向异性高光颜色", Color) = (1,1,1,1)

_DirectSpecularColor2nd ("次要各向异性高光颜色", Color) = (1,1,1,1)

_ChangDirectSpecularColor ("换色后主要各向异性高光颜色", Color) = (1,1,1,1)

_ChangDirectSpecularColor2nd ("换色后次要各向异性高光颜色", Color) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (0.315,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_OcclusionScale ("AO强度", Range(0, 1)) = 1.0

_ShadowStrengthMap ("阴影遮罩贴图", 2D) = "white" { }

_ShadowStrength ("阴影强度", Range(0, 3)) = 1.6799999475479126

_ShadowColor ("阴影颜色", Color) = (0.367925,0,0,0)

[Toggle] _Crystal_UseCustomColor ("Use Custom Color", Float) = 0.0

_Crystal_CustomColorMask ("Custom Color Mask", 2D) = "black" { }

_Crystal_CustomColor_R_Color ("R Color", Color) = (1,1,1,1)

_Crystal_CustomColor_G_Color ("G Color", Color) = (1,1,1,1)

_Crystal_CustomColor_B_Color ("B Color", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 11943
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec4 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
float u_xlat31;
int u_xlati31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_45;
float u_xlat47;
float u_xlat48;
float u_xlat51;
mediump float u_xlat16_58;
float u_xlat60;
mediump float u_xlat16_61;
mediump vec2 u_xlat16_70;
float u_xlat76;
float u_xlat77;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_88;
mediump float u_xlat16_90;
float u_xlat91;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
mediump float u_xlat16_98;
mediump float u_xlat16_99;
float u_xlat100;
mediump float u_xlat16_101;
mediump float u_xlat16_102;
float u_xlat105;
float u_xlat106;
float u_xlat107;
float u_xlat108;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat29.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat29.xy = fract(u_xlat29.xy);
    u_xlat29.xy = u_xlat29.xy + u_xlat16_1.xy;
    u_xlat16_29 = texture(_MergeTex01, u_xlat29.xy).z;
    u_xlat29.x = u_xlat16_29 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_58 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_87 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat31 = u_xlat2.x * _UpChangColorShrink + u_xlat16_87;
    u_xlat16_1.x = u_xlat31 + u_xlat31;
    u_xlat60 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat31 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_30.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_30.x = (-u_xlat60) + 1.0;
    u_xlat16_30.xyz = u_xlat16_30.xxx * _UpChangEdgeColor.xyz;
    u_xlat87 = u_xlat2.x * _ChangColorShrink + u_xlat16_87;
    u_xlat16_3.x = u_xlat87 + u_xlat87;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat87 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_32.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_32.x = (-u_xlat2.x) + 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * _ChangEdgeColor.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xxx + u_xlat16_32.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_32.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_32.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_32.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_32.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_2.xw = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_11.xyz = vec3(u_xlat16_88) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb87 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat87 = (u_xlatb87) ? 1.0 : -1.0;
    u_xlat87 = u_xlat87 * vs_TEXCOORD2.w;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_91 = texture(_AnisotropicMap, u_xlat16_12.xy).x;
    u_xlat91 = u_xlat16_91 * 2.0 + -1.0;
    u_xlat16_90 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_93 = u_xlat16_90 + -1.0;
    u_xlat16_94 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_95 = u_xlat16_94 + -1.0;
    u_xlat92 = u_xlat91 * _SunShift + _SunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat96 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat96) + u_xlat4.xyz;
    u_xlat96 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat96 = inversesqrt(u_xlat96);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat96);
    u_xlat13.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat87) * u_xlat13.xyz;
    u_xlat16_98 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_98 = inversesqrt(u_xlat16_98);
    u_xlat16_12.xyz = vec3(u_xlat16_98) * vs_TEXCOORD1.yzx;
    u_xlat87 = u_xlat91 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_98 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_1.xyz * vec3(u_xlat16_98);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_32.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_98 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_99 = max(u_xlat16_98, 0.0078125);
    u_xlat16_101 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_102 = u_xlat16_101 * 0.5 + 0.5;
    u_xlat16_102 = (-u_xlat16_101) + u_xlat16_102;
    u_xlat16_101 = u_xlat16_45.z * u_xlat16_102 + u_xlat16_101;
    u_xlat16_101 = u_xlat16_45.z * u_xlat16_101;
    u_xlat16_101 = u_xlat16_3.x * u_xlat16_101;
    u_xlat18.xyz = u_xlat10.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat18.xyz = vec3(u_xlat31) * u_xlat18.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat92) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat91 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat21.xyz = vec3(u_xlat91) * u_xlat21.xyz;
    u_xlat91 = u_xlat16_90 * u_xlat16_61;
    u_xlat91 = max(u_xlat91, 0.00100000005);
    u_xlat96 = (-u_xlat16_93) + 1.0;
    u_xlat97 = u_xlat16_61 * u_xlat96;
    u_xlat97 = max(u_xlat97, 0.00100000005);
    u_xlat16_90 = dot(u_xlat4.zxy, u_xlat18.xyz);
    u_xlat100 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat16_16 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat105 = dot(u_xlat21.xyz, u_xlat18.xyz);
    u_xlat106 = dot(u_xlat21.xyz, u_xlat16_11.xyz);
    u_xlat107 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat87) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat22.xyz = vec3(u_xlat87) * u_xlat22.xyz;
    u_xlat87 = u_xlat16_94 * u_xlat16_61;
    u_xlat87 = max(u_xlat87, 0.00100000005);
    u_xlat108 = (-u_xlat16_95) + 1.0;
    u_xlat108 = u_xlat16_61 * u_xlat108;
    u_xlat108 = max(u_xlat108, 0.00100000005);
    u_xlat18.x = dot(u_xlat22.xyz, u_xlat18.xyz);
    u_xlat47 = dot(u_xlat22.xyz, u_xlat16_11.xyz);
    u_xlat76 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = u_xlat87 * u_xlat108;
    u_xlat23.x = u_xlat16_90 * u_xlat108;
    u_xlat23.y = u_xlat87 * u_xlat18.x;
    u_xlat23.z = u_xlat31 * u_xlat22.x;
    u_xlat18.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat18.x = max(u_xlat18.x, 6.10351563e-05);
    u_xlat51 = u_xlat22.x * 0.318309873;
    u_xlat18.x = u_xlat22.x / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat51 * u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat20.y = u_xlat100 * u_xlat87;
    u_xlat20.z = u_xlat47 * u_xlat108;
    u_xlat47 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat20.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat19.y = u_xlat16_16 * u_xlat87;
    u_xlat19.z = u_xlat76 * u_xlat108;
    u_xlat87 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat19.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat47 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat47 = u_xlat91 * u_xlat97;
    u_xlat22.x = u_xlat16_90 * u_xlat97;
    u_xlat22.y = u_xlat91 * u_xlat105;
    u_xlat22.z = u_xlat31 * u_xlat47;
    u_xlat31 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat76 = u_xlat47 * 0.318309873;
    u_xlat31 = u_xlat47 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat76 * u_xlat31;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat20.y = u_xlat91 * u_xlat100;
    u_xlat20.z = u_xlat97 * u_xlat106;
    u_xlat100 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat20.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat19.y = u_xlat91 * u_xlat16_16;
    u_xlat19.z = u_xlat97 * u_xlat107;
    u_xlat105 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat105 = sqrt(u_xlat105);
    u_xlat105 = u_xlat105 + u_xlat19.x;
    u_xlat105 = u_xlat105 + 6.10351563e-05;
    u_xlat105 = u_xlat100 * u_xlat105 + 6.10351563e-05;
    u_xlat105 = float(1.0) / u_xlat105;
    u_xlat48 = (-u_xlat16_102) + 1.0;
    u_xlat16_90 = u_xlat48 * u_xlat48;
    u_xlat16_90 = u_xlat48 * u_xlat16_90;
    u_xlat16_90 = u_xlat48 * u_xlat16_90;
    u_xlat16_94 = u_xlat48 * u_xlat16_90;
    u_xlat77 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_90) * u_xlat48 + 1.0;
    u_xlat22.xyz = u_xlat16_1.xyz * vec3(u_xlat48);
    u_xlat22.xyz = vec3(u_xlat77) * vec3(u_xlat16_94) + u_xlat22.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31 = u_xlat31 * u_xlat105;
    u_xlat23.xyz = u_xlat22.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat19.xxx * u_xlat23.xyz;
    u_xlat87 = u_xlat18.x * u_xlat87;
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat87);
    u_xlat22.xyz = u_xlat16_14.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat19.xxx * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat22.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat22.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_90 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_90);
    u_xlat16_14.xyz = vec3(u_xlat16_94) * u_xlat23.xyz;
    u_xlat16_25.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_95;
    u_xlat16_90 = max(u_xlat16_25.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_94 * u_xlat16_90;
    u_xlat16_25.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xw = u_xlat16_2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xw = min(max(u_xlat2.xw, 0.0), 1.0);
#else
    u_xlat2.xw = clamp(u_xlat2.xw, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat10.xyz * vec3(u_xlat16_88) + u_xlat16_14.xyz;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat23.xyz;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_14.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat5.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_94 = dot(u_xlat4.zxy, u_xlat23.xyz);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_14.xyz);
    u_xlat31 = dot(u_xlat21.xyz, u_xlat23.xyz);
    u_xlat18.x = dot(u_xlat21.xyz, u_xlat16_14.xyz);
    u_xlat23.x = u_xlat16_94 * u_xlat97;
    u_xlat23.y = u_xlat31 * u_xlat91;
    u_xlat23.z = u_xlat87 * u_xlat47;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat47 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat76 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat27.y = u_xlat91 * u_xlat16_95;
    u_xlat27.z = u_xlat97 * u_xlat18.x;
    u_xlat31 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat27.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat100 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat18.x = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat18.x * u_xlat18.x;
    u_xlat16_90 = u_xlat18.x * u_xlat16_90;
    u_xlat16_90 = u_xlat18.x * u_xlat16_90;
    u_xlat16_94 = u_xlat18.x * u_xlat16_90;
    u_xlat18.x = (-u_xlat16_90) * u_xlat18.x + 1.0;
    u_xlat23.xyz = u_xlat16_1.xyz * u_xlat18.xxx;
    u_xlat23.xyz = vec3(u_xlat77) * vec3(u_xlat16_94) + u_xlat23.xyz;
    u_xlat16_14.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat27.xxx * u_xlat16_14.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat27.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_25.xyz * u_xlat23.xyz;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat2.xxx + u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_24.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat19.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat19.xyw, u_xlat19.xyw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_90);
    u_xlat16_24.xyz = vec3(u_xlat16_94) * u_xlat19.xyw;
    u_xlat16_26.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_26.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_94 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_95;
    u_xlat16_90 = max(u_xlat16_26.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_94 * u_xlat16_90;
    u_xlat16_26.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xyw = u_xlat10.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat87 = dot(u_xlat19.xyw, u_xlat19.xyw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xyw = vec3(u_xlat87) * u_xlat19.xyw;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat19.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_24.xyz, u_xlat19.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_94 = dot(u_xlat4.zxy, u_xlat19.xyw);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_24.xyz);
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat19.xyw);
    u_xlat31 = dot(u_xlat21.xyz, u_xlat16_24.xyz);
    u_xlat21.x = u_xlat16_94 * u_xlat97;
    u_xlat21.y = u_xlat2.x * u_xlat91;
    u_xlat21.z = u_xlat87 * u_xlat47;
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat47 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat76 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat22.y = u_xlat91 * u_xlat16_95;
    u_xlat22.z = u_xlat31 * u_xlat97;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat22.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat100 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat31 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat31 * u_xlat31;
    u_xlat16_90 = u_xlat31 * u_xlat16_90;
    u_xlat16_90 = u_xlat31 * u_xlat16_90;
    u_xlat16_94 = u_xlat31 * u_xlat16_90;
    u_xlat31 = (-u_xlat16_90) * u_xlat31 + 1.0;
    u_xlat18.xyz = u_xlat16_1.xyz * vec3(u_xlat31);
    u_xlat18.xyz = vec3(u_xlat77) * vec3(u_xlat16_94) + u_xlat18.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * u_xlat16_26.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat2.www * u_xlat16_24.xyz;
    u_xlat87 = u_xlat87 * u_xlat2.x;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat16_8.xyz * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat22.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_26.xyz * u_xlat18.xyz;
    u_xlat16_8.xyz = u_xlat18.xyz * u_xlat2.www + u_xlat16_25.xyz;
    u_xlat16_14.xyz = u_xlat16_24.xyz * u_xlat22.xxx + u_xlat16_14.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_24.y = u_xlat16_15.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_24.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat2.x = min(u_xlat16_101, 1.0);
    u_xlat91 = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_25.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = vec3(u_xlat91) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat91) * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = vec3(u_xlat91) * u_xlat16_26.xyz;
    u_xlat16_26.xyz = vec3(u_xlat91) * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat91) + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * vec3(u_xlat91) + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlati31 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati31].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_26.xyz;
    u_xlati87 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_24.xyw;
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_26.xyz;
    u_xlat13.xyz = vec3(u_xlat92) * u_xlat16_12.xyz + u_xlat13.xyz;
    u_xlat87 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat13.xyz = vec3(u_xlat87) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb87 = u_xlat16_93>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb87)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat13.xyz);
    u_xlat18.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat18.xyz);
    u_xlat16_61 = u_xlat16_61 * 8.0;
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = u_xlat16_61 * abs(u_xlat16_93);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_61) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat4.xyz = vec3(u_xlat87) * u_xlat4.xyz;
    u_xlat16_61 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_61 = u_xlat16_61 + u_xlat16_61;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_61) + (-u_xlat16_11.xyz);
    u_xlat13.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat13.xyz = vec3(u_xlat16_99) * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat18.xyz = u_xlat4.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = abs(vec3(u_xlat16_93)) * u_xlat18.xyz + u_xlat13.xyz;
    u_xlat16_61 = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_61);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat4.xyz);
    u_xlat16_45.x = u_xlat16_32.x * 1.09769487;
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_90 = floor(u_xlat16_4.w);
    u_xlat16_93 = u_xlat16_90 + 1.0;
    u_xlat16_93 = min(u_xlat16_93, 15.0);
    u_xlat16_94 = u_xlat16_12.z * 15.0 + (-u_xlat16_90);
    u_xlat16_4.x = u_xlat16_90 * 16.0 + u_xlat16_4.y;
    u_xlat16_12.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_70.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_70.xy = u_xlat16_70.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_70.xy).x;
    u_xlat16_12.y = u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_90 = (-u_xlat16_0.x) + u_xlat16_87;
    u_xlat16_90 = u_xlat16_94 * u_xlat16_90 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_90;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.x * 0.5;
    u_xlat16_90 = (-u_xlat2.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_90 + u_xlat16_3.x;
    u_xlat16_90 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_93 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93 + u_xlat16_90;
    u_xlat16_3.x = u_xlat2.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_90 = dot(_IndirectCubemapRotationParams.xy, u_xlat13.xz);
    u_xlat13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat13.xz);
    u_xlat13.x = u_xlat16_90;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_61);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_61 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_12.xyz;
    u_xlat20.y = u_xlat16_32.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat10.xy * vec2(u_xlat16_88) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_88 = (-u_xlat0.x) + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.00100000005);
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _FresnelPower;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_3.x = max(_FresnelIntensity, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _FresnelColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_58) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw + u_xlat16_1.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_11.xyz);
    u_xlat16_3.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_87 = texture(_MergeTex01, u_xlat16_3.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_88 = _GlitterScale * 0.681690156;
    u_xlat2.xy = vec2(u_xlat16_88) * u_xlat2.xy;
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_88 = u_xlat16_87 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * _GlitterIntensity;
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _GlitterContrast;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_88 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_3.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_3.xy = u_xlat0.xz * vec2(u_xlat16_88) + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_88 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_88) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_88 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat87 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat87 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_2.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump float u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
vec4 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
float u_xlat31;
int u_xlati31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_45;
float u_xlat47;
float u_xlat48;
float u_xlat51;
mediump float u_xlat16_58;
float u_xlat60;
mediump float u_xlat16_61;
mediump vec2 u_xlat16_70;
float u_xlat76;
float u_xlat77;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_88;
mediump float u_xlat16_90;
float u_xlat91;
mediump float u_xlat16_91;
float u_xlat92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
mediump float u_xlat16_98;
mediump float u_xlat16_99;
float u_xlat100;
mediump float u_xlat16_101;
mediump float u_xlat16_102;
float u_xlat105;
float u_xlat106;
float u_xlat107;
float u_xlat108;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat29.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat29.xy = fract(u_xlat29.xy);
    u_xlat29.xy = u_xlat29.xy + u_xlat16_1.xy;
    u_xlat16_29 = texture(_MergeTex01, u_xlat29.xy).z;
    u_xlat29.x = u_xlat16_29 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_58 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_87 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat31 = u_xlat2.x * _UpChangColorShrink + u_xlat16_87;
    u_xlat16_1.x = u_xlat31 + u_xlat31;
    u_xlat60 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat31 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_30.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_30.x = (-u_xlat60) + 1.0;
    u_xlat16_30.xyz = u_xlat16_30.xxx * _UpChangEdgeColor.xyz;
    u_xlat87 = u_xlat2.x * _ChangColorShrink + u_xlat16_87;
    u_xlat16_3.x = u_xlat87 + u_xlat87;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat87 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_32.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_32.x = (-u_xlat2.x) + 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * _ChangEdgeColor.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xxx + u_xlat16_32.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_32.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_32.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_32.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_32.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_2.xw = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_11.xyz = vec3(u_xlat16_88) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb87 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat87 = (u_xlatb87) ? 1.0 : -1.0;
    u_xlat87 = u_xlat87 * vs_TEXCOORD2.w;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_91 = texture(_AnisotropicMap, u_xlat16_12.xy).x;
    u_xlat91 = u_xlat16_91 * 2.0 + -1.0;
    u_xlat16_90 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_93 = u_xlat16_90 + -1.0;
    u_xlat16_94 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_95 = u_xlat16_94 + -1.0;
    u_xlat92 = u_xlat91 * _SunShift + _SunShiftOffset;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat96 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat96) + u_xlat4.xyz;
    u_xlat96 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat96 = inversesqrt(u_xlat96);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat96);
    u_xlat13.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat87) * u_xlat13.xyz;
    u_xlat16_98 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_98 = inversesqrt(u_xlat16_98);
    u_xlat16_12.xyz = vec3(u_xlat16_98) * vs_TEXCOORD1.yzx;
    u_xlat87 = u_xlat91 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_45.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_98 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_1.xyz * vec3(u_xlat16_98);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_32.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_98 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_99 = max(u_xlat16_98, 0.0078125);
    u_xlat16_101 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_101 = min(max(u_xlat16_101, 0.0), 1.0);
#else
    u_xlat16_101 = clamp(u_xlat16_101, 0.0, 1.0);
#endif
    u_xlat16_102 = u_xlat16_101 * 0.5 + 0.5;
    u_xlat16_102 = (-u_xlat16_101) + u_xlat16_102;
    u_xlat16_101 = u_xlat16_45.z * u_xlat16_102 + u_xlat16_101;
    u_xlat16_101 = u_xlat16_45.z * u_xlat16_101;
    u_xlat16_101 = u_xlat16_3.x * u_xlat16_101;
    u_xlat18.xyz = u_xlat10.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31 = dot(u_xlat18.xyz, u_xlat18.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat18.xyz = vec3(u_xlat31) * u_xlat18.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat92) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat91 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat21.xyz = vec3(u_xlat91) * u_xlat21.xyz;
    u_xlat91 = u_xlat16_90 * u_xlat16_61;
    u_xlat91 = max(u_xlat91, 0.00100000005);
    u_xlat96 = (-u_xlat16_93) + 1.0;
    u_xlat97 = u_xlat16_61 * u_xlat96;
    u_xlat97 = max(u_xlat97, 0.00100000005);
    u_xlat16_90 = dot(u_xlat4.zxy, u_xlat18.xyz);
    u_xlat100 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat16_16 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat105 = dot(u_xlat21.xyz, u_xlat18.xyz);
    u_xlat106 = dot(u_xlat21.xyz, u_xlat16_11.xyz);
    u_xlat107 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat87) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat22.xyz = vec3(u_xlat87) * u_xlat22.xyz;
    u_xlat87 = u_xlat16_94 * u_xlat16_61;
    u_xlat87 = max(u_xlat87, 0.00100000005);
    u_xlat108 = (-u_xlat16_95) + 1.0;
    u_xlat108 = u_xlat16_61 * u_xlat108;
    u_xlat108 = max(u_xlat108, 0.00100000005);
    u_xlat18.x = dot(u_xlat22.xyz, u_xlat18.xyz);
    u_xlat47 = dot(u_xlat22.xyz, u_xlat16_11.xyz);
    u_xlat76 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.x = u_xlat87 * u_xlat108;
    u_xlat23.x = u_xlat16_90 * u_xlat108;
    u_xlat23.y = u_xlat87 * u_xlat18.x;
    u_xlat23.z = u_xlat31 * u_xlat22.x;
    u_xlat18.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat18.x = max(u_xlat18.x, 6.10351563e-05);
    u_xlat51 = u_xlat22.x * 0.318309873;
    u_xlat18.x = u_xlat22.x / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat18.x;
    u_xlat18.x = u_xlat51 * u_xlat18.x;
    u_xlat18.x = min(u_xlat18.x, 16.0);
    u_xlat20.y = u_xlat100 * u_xlat87;
    u_xlat20.z = u_xlat47 * u_xlat108;
    u_xlat47 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat20.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat19.y = u_xlat16_16 * u_xlat87;
    u_xlat19.z = u_xlat76 * u_xlat108;
    u_xlat87 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat19.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat47 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat47 = u_xlat91 * u_xlat97;
    u_xlat22.x = u_xlat16_90 * u_xlat97;
    u_xlat22.y = u_xlat91 * u_xlat105;
    u_xlat22.z = u_xlat31 * u_xlat47;
    u_xlat31 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat76 = u_xlat47 * 0.318309873;
    u_xlat31 = u_xlat47 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat76 * u_xlat31;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat20.y = u_xlat91 * u_xlat100;
    u_xlat20.z = u_xlat97 * u_xlat106;
    u_xlat100 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat20.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat19.y = u_xlat91 * u_xlat16_16;
    u_xlat19.z = u_xlat97 * u_xlat107;
    u_xlat105 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat105 = sqrt(u_xlat105);
    u_xlat105 = u_xlat105 + u_xlat19.x;
    u_xlat105 = u_xlat105 + 6.10351563e-05;
    u_xlat105 = u_xlat100 * u_xlat105 + 6.10351563e-05;
    u_xlat105 = float(1.0) / u_xlat105;
    u_xlat48 = (-u_xlat16_102) + 1.0;
    u_xlat16_90 = u_xlat48 * u_xlat48;
    u_xlat16_90 = u_xlat48 * u_xlat16_90;
    u_xlat16_90 = u_xlat48 * u_xlat16_90;
    u_xlat16_94 = u_xlat48 * u_xlat16_90;
    u_xlat77 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat77 = min(max(u_xlat77, 0.0), 1.0);
#else
    u_xlat77 = clamp(u_xlat77, 0.0, 1.0);
#endif
    u_xlat48 = (-u_xlat16_90) * u_xlat48 + 1.0;
    u_xlat22.xyz = u_xlat16_1.xyz * vec3(u_xlat48);
    u_xlat22.xyz = vec3(u_xlat77) * vec3(u_xlat16_94) + u_xlat22.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31 = u_xlat31 * u_xlat105;
    u_xlat23.xyz = u_xlat22.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat19.xxx * u_xlat23.xyz;
    u_xlat87 = u_xlat18.x * u_xlat87;
    u_xlat22.xyz = u_xlat22.xyz * vec3(u_xlat87);
    u_xlat22.xyz = u_xlat16_14.xyz * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat19.xxx * u_xlat22.xyz;
    u_xlat22.xyz = u_xlat22.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat22.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat22.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_90 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_90);
    u_xlat16_14.xyz = vec3(u_xlat16_94) * u_xlat23.xyz;
    u_xlat16_25.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_25.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_25.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_95;
    u_xlat16_90 = max(u_xlat16_25.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_94 * u_xlat16_90;
    u_xlat16_25.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xw = u_xlat16_2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xw = min(max(u_xlat2.xw, 0.0), 1.0);
#else
    u_xlat2.xw = clamp(u_xlat2.xw, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat10.xyz * vec3(u_xlat16_88) + u_xlat16_14.xyz;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat23.xyz;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_14.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat27.x = dot(u_xlat5.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat27.x = min(max(u_xlat27.x, 0.0), 1.0);
#else
    u_xlat27.x = clamp(u_xlat27.x, 0.0, 1.0);
#endif
    u_xlat16_94 = dot(u_xlat4.zxy, u_xlat23.xyz);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_14.xyz);
    u_xlat31 = dot(u_xlat21.xyz, u_xlat23.xyz);
    u_xlat18.x = dot(u_xlat21.xyz, u_xlat16_14.xyz);
    u_xlat23.x = u_xlat16_94 * u_xlat97;
    u_xlat23.y = u_xlat31 * u_xlat91;
    u_xlat23.z = u_xlat87 * u_xlat47;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat47 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat76 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat27.y = u_xlat91 * u_xlat16_95;
    u_xlat27.z = u_xlat97 * u_xlat18.x;
    u_xlat31 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat27.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat100 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat18.x = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat18.x * u_xlat18.x;
    u_xlat16_90 = u_xlat18.x * u_xlat16_90;
    u_xlat16_90 = u_xlat18.x * u_xlat16_90;
    u_xlat16_94 = u_xlat18.x * u_xlat16_90;
    u_xlat18.x = (-u_xlat16_90) * u_xlat18.x + 1.0;
    u_xlat23.xyz = u_xlat16_1.xyz * u_xlat18.xxx;
    u_xlat23.xyz = vec3(u_xlat77) * vec3(u_xlat16_94) + u_xlat23.xyz;
    u_xlat16_14.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat27.xxx * u_xlat16_14.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat27.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_25.xyz * u_xlat23.xyz;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat2.xxx + u_xlat22.xyz;
    u_xlat16_14.xyz = u_xlat16_24.xyz * u_xlat19.xxx + u_xlat16_14.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat19.xyw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat19.xyw, u_xlat19.xyw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_90);
    u_xlat16_24.xyz = vec3(u_xlat16_94) * u_xlat19.xyw;
    u_xlat16_26.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_26.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_94 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_95;
    u_xlat16_90 = max(u_xlat16_26.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_94 * u_xlat16_90;
    u_xlat16_26.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xyw = u_xlat10.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat87 = dot(u_xlat19.xyw, u_xlat19.xyw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xyw = vec3(u_xlat87) * u_xlat19.xyw;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat19.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(u_xlat16_24.xyz, u_xlat19.xyw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat5.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat16_94 = dot(u_xlat4.zxy, u_xlat19.xyw);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_24.xyz);
    u_xlat2.x = dot(u_xlat21.xyz, u_xlat19.xyw);
    u_xlat31 = dot(u_xlat21.xyz, u_xlat16_24.xyz);
    u_xlat21.x = u_xlat16_94 * u_xlat97;
    u_xlat21.y = u_xlat2.x * u_xlat91;
    u_xlat21.z = u_xlat87 * u_xlat47;
    u_xlat87 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat47 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat76 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat22.y = u_xlat91 * u_xlat16_95;
    u_xlat22.z = u_xlat31 * u_xlat97;
    u_xlat2.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat22.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat100 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat31 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat31 * u_xlat31;
    u_xlat16_90 = u_xlat31 * u_xlat16_90;
    u_xlat16_90 = u_xlat31 * u_xlat16_90;
    u_xlat16_94 = u_xlat31 * u_xlat16_90;
    u_xlat31 = (-u_xlat16_90) * u_xlat31 + 1.0;
    u_xlat18.xyz = u_xlat16_1.xyz * vec3(u_xlat31);
    u_xlat18.xyz = vec3(u_xlat77) * vec3(u_xlat16_94) + u_xlat18.xyz;
    u_xlat16_24.xyz = u_xlat16_17.xyz * u_xlat16_26.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat2.www * u_xlat16_24.xyz;
    u_xlat87 = u_xlat87 * u_xlat2.x;
    u_xlat18.xyz = u_xlat18.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.xyz = min(max(u_xlat18.xyz, 0.0), 1.0);
#else
    u_xlat18.xyz = clamp(u_xlat18.xyz, 0.0, 1.0);
#endif
    u_xlat18.xyz = u_xlat16_8.xyz * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat22.xxx * u_xlat18.xyz;
    u_xlat18.xyz = u_xlat16_26.xyz * u_xlat18.xyz;
    u_xlat16_8.xyz = u_xlat18.xyz * u_xlat2.www + u_xlat16_25.xyz;
    u_xlat16_14.xyz = u_xlat16_24.xyz * u_xlat22.xxx + u_xlat16_14.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_24.y = u_xlat16_15.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_24.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat2.x = min(u_xlat16_101, 1.0);
    u_xlat91 = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_25.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = vec3(u_xlat91) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat91) * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = vec3(u_xlat91) * u_xlat16_26.xyz;
    u_xlat16_26.xyz = vec3(u_xlat91) * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat91) + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * vec3(u_xlat91) + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlati31 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati31].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_26.xyz;
    u_xlati87 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_24.xyw;
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_26.xyz;
    u_xlat13.xyz = vec3(u_xlat92) * u_xlat16_12.xyz + u_xlat13.xyz;
    u_xlat87 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat13.xyz = vec3(u_xlat87) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb87 = u_xlat16_93>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb87)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat13.xyz);
    u_xlat18.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat18.xyz);
    u_xlat16_61 = u_xlat16_61 * 8.0;
    u_xlat16_61 = min(u_xlat16_61, 1.0);
    u_xlat16_61 = u_xlat16_61 * abs(u_xlat16_93);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_61) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat4.xyz = vec3(u_xlat87) * u_xlat4.xyz;
    u_xlat16_61 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_61 = u_xlat16_61 + u_xlat16_61;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_61) + (-u_xlat16_11.xyz);
    u_xlat13.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat13.xyz = vec3(u_xlat16_99) * u_xlat13.xyz + u_xlat4.xyz;
    u_xlat18.xyz = u_xlat4.xyz + (-u_xlat13.xyz);
    u_xlat13.xyz = abs(vec3(u_xlat16_93)) * u_xlat18.xyz + u_xlat13.xyz;
    u_xlat16_61 = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_61;
    u_xlat16_61 = u_xlat16_61 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_61);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat4.xyz);
    u_xlat16_45.x = u_xlat16_32.x * 1.09769487;
    u_xlat16_45.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_45.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_90 = floor(u_xlat16_4.w);
    u_xlat16_93 = u_xlat16_90 + 1.0;
    u_xlat16_93 = min(u_xlat16_93, 15.0);
    u_xlat16_94 = u_xlat16_12.z * 15.0 + (-u_xlat16_90);
    u_xlat16_4.x = u_xlat16_90 * 16.0 + u_xlat16_4.y;
    u_xlat16_12.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_70.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_70.xy = u_xlat16_70.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_70.xy).x;
    u_xlat16_12.y = u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_90 = (-u_xlat16_0.x) + u_xlat16_87;
    u_xlat16_90 = u_xlat16_94 * u_xlat16_90 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_90;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.x * 0.5;
    u_xlat16_90 = (-u_xlat2.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_90 + u_xlat16_3.x;
    u_xlat16_90 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_93 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93 + u_xlat16_90;
    u_xlat16_3.x = u_xlat2.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_90 = dot(_IndirectCubemapRotationParams.xy, u_xlat13.xz);
    u_xlat13.z = dot(_IndirectCubemapRotationParams.zw, u_xlat13.xz);
    u_xlat13.x = u_xlat16_90;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat13.xyz, u_xlat16_61);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_61 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = vec3(u_xlat16_61) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_12.xyz;
    u_xlat20.y = u_xlat16_32.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xyz * u_xlat16_25.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat10.xy * vec2(u_xlat16_88) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_88 = (-u_xlat0.x) + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.00100000005);
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _FresnelPower;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_3.x = max(_FresnelIntensity, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _FresnelColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_58) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw + u_xlat16_1.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_11.xyz);
    u_xlat16_3.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_87 = texture(_MergeTex01, u_xlat16_3.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_88 = _GlitterScale * 0.681690156;
    u_xlat2.xy = vec2(u_xlat16_88) * u_xlat2.xy;
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_88 = u_xlat16_87 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * _GlitterIntensity;
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _GlitterContrast;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_88 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_3.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_3.xy = u_xlat0.xz * vec2(u_xlat16_88) + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_88 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_88) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_88 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat87 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat87 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_2.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(16) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
float u_xlat31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_46;
float u_xlat48;
vec3 u_xlat49;
mediump float u_xlat16_58;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat68;
mediump vec2 u_xlat16_71;
float u_xlat77;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_88;
float u_xlat89;
mediump float u_xlat16_90;
float u_xlat91;
float u_xlat92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
float u_xlat106;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat29.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat29.xy = fract(u_xlat29.xy);
    u_xlat29.xy = u_xlat29.xy + u_xlat16_1.xy;
    u_xlat16_29 = texture(_MergeTex01, u_xlat29.xy).z;
    u_xlat29.x = u_xlat16_29 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_58 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_87 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat31 = u_xlat2.x * _UpChangColorShrink + u_xlat16_87;
    u_xlat16_1.x = u_xlat31 + u_xlat31;
    u_xlat60 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat31 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_30.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_30.x = (-u_xlat60) + 1.0;
    u_xlat16_30.xyz = u_xlat16_30.xxx * _UpChangEdgeColor.xyz;
    u_xlat87 = u_xlat2.x * _ChangColorShrink + u_xlat16_87;
    u_xlat16_3.x = u_xlat87 + u_xlat87;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat87 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_32.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_32.x = (-u_xlat2.x) + 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * _ChangEdgeColor.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xxx + u_xlat16_32.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_32.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_32.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_32.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_32.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_10.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_88 = u_xlat16_10.z * _ShadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb87 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat87 = (u_xlatb87) ? 1.0 : -1.0;
    u_xlat87 = u_xlat87 * vs_TEXCOORD2.w;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_AnisotropicMap, u_xlat16_13.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat16_93 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_94 = u_xlat16_93 + -1.0;
    u_xlat16_95 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat89 = u_xlat2.x * _SunShift + _SunShiftOffset;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat91 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat91) + u_xlat4.xyz;
    u_xlat91 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat4.xyz = vec3(u_xlat91) * u_xlat4.xyz;
    u_xlat14.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat87) * u_xlat14.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat87 = u_xlat2.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_16.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_16.xyz = u_xlat16_3.xxx * u_xlat16_16.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_100 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_1.xyz * vec3(u_xlat16_100);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_32.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_100 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_102 = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_103 = (-u_xlat16_102) + u_xlat16_103;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_103 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_102;
    u_xlat16_102 = u_xlat16_3.x * u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat5.xyz) * vec3(u_xlat31) + vs_TEXCOORD0.xyz;
    u_xlat19.xyz = (bool(u_xlatb2)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat23;
    u_xlat21 = u_xlat19.yyyy * u_xlat21;
    u_xlat20 = u_xlat20 * u_xlat19.xxxx + u_xlat21;
    u_xlat19 = u_xlat22 * u_xlat19.zzzz + u_xlat20;
    u_xlat19 = u_xlat23 + u_xlat19;
    u_xlat2.x = _ShadowBias.x / u_xlat19.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat19.z;
    u_xlat31 = max((-u_xlat19.w), u_xlat2.x);
    u_xlat31 = (-u_xlat2.x) + u_xlat31;
    u_xlat19.z = _ShadowBias.y * u_xlat31 + u_xlat2.x;
    u_xlat19.xyz = u_xlat19.xyz / u_xlat19.www;
    u_xlat19.xyz = u_xlat19.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat19.w = max(u_xlat19.z, 9.99999975e-05);
    u_xlat16_103 = (-_ShadowBias.w) + 1.0;
    u_xlat20.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat20.z = 0.0;
    u_xlat20.xyz = u_xlat19.xyw + u_xlat20.xyz;
    vec3 txVec0 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat20.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat19.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat20.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat20, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat31 = (-u_xlat16_103) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_103;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_88 + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat91 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat22.xyz = vec3(u_xlat91) * u_xlat22.xyz;
    u_xlat91 = u_xlat16_93 * u_xlat16_61;
    u_xlat91 = max(u_xlat91, 0.00100000005);
    u_xlat92 = (-u_xlat16_94) + 1.0;
    u_xlat92 = u_xlat16_61 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xyz);
    u_xlat96 = dot(u_xlat4.zxy, u_xlat16_12.xyz);
    u_xlat16_103 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat98 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat23.xyz;
    u_xlat87 = u_xlat16_95 * u_xlat16_61;
    u_xlat87 = max(u_xlat87, 0.00100000005);
    u_xlat101 = (-u_xlat16_99) + 1.0;
    u_xlat101 = u_xlat16_61 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat48 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat77 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat106 = u_xlat87 * u_xlat101;
    u_xlat23.x = u_xlat16_93 * u_xlat101;
    u_xlat23.y = u_xlat87 * u_xlat19.x;
    u_xlat23.z = u_xlat31 * u_xlat106;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat107 = u_xlat106 * 0.318309873;
    u_xlat19.x = u_xlat106 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat107 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat96 * u_xlat87;
    u_xlat21.z = u_xlat101 * u_xlat48;
    u_xlat48 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat21.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_103 * u_xlat87;
    u_xlat20.z = u_xlat101 * u_xlat77;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat20.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat48 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat101 = u_xlat91 * u_xlat92;
    u_xlat23.x = u_xlat92 * u_xlat16_93;
    u_xlat23.y = u_xlat91 * u_xlat68;
    u_xlat23.z = u_xlat31 * u_xlat101;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat68 = u_xlat101 * 0.318309873;
    u_xlat31 = u_xlat101 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat68 * u_xlat31;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat21.y = u_xlat91 * u_xlat96;
    u_xlat21.z = u_xlat92 * u_xlat97;
    u_xlat96 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat21.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat20.y = u_xlat91 * u_xlat16_103;
    u_xlat20.z = u_xlat92 * u_xlat98;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat96 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat98 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat98 * u_xlat98;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_93 = u_xlat98 * u_xlat16_88;
    u_xlat48 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_88) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat98);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_24.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_24.xyz + _ShadowColor.xyz;
    u_xlat16_25.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31 = u_xlat31 * u_xlat97;
    u_xlat23.xyz = u_xlat49.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat87 = u_xlat19.x * u_xlat87;
    u_xlat19.xzw = u_xlat49.xyz * vec3(u_xlat87);
    u_xlat19.xzw = u_xlat16_15.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat20.xxx * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat19.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xzw = u_xlat16_24.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat23.xyz * u_xlat16_24.xyz + u_xlat19.xzw;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat49.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat49.xyz;
    u_xlat16_24.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_24.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_24.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_15.xyz;
    u_xlat87 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat49.xyz = vec3(u_xlat87) * u_xlat49.xyz;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_15.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat49.xyz);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_15.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat49.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_15.xyz);
    u_xlat27.x = u_xlat92 * u_xlat16_93;
    u_xlat27.y = u_xlat31 * u_xlat91;
    u_xlat27.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat23.y = u_xlat91 * u_xlat16_95;
    u_xlat23.z = u_xlat92 * u_xlat97;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat23.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat97 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat97 * u_xlat97;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_93 = u_xlat97 * u_xlat16_88;
    u_xlat97 = (-u_xlat16_88) * u_xlat97 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat10.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat23.xxx * u_xlat16_15.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat49.xyz = min(max(u_xlat49.xyz, 0.0), 1.0);
#else
    u_xlat49.xyz = clamp(u_xlat49.xyz, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat16_8.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat23.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat16_24.xyz * u_xlat49.xyz;
    u_xlat16_24.xyz = u_xlat49.xyz * u_xlat10.xxx + u_xlat19.xzw;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat19.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_25.xyz = vec3(u_xlat16_93) * u_xlat19.xzw;
    u_xlat16_26.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_26.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_26.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xzw = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_25.xyz;
    u_xlat87 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xzw = vec3(u_xlat87) * u_xlat19.xzw;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_25.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xzw);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat19.xzw);
    u_xlat10.x = dot(u_xlat22.xyz, u_xlat16_25.xyz);
    u_xlat22.x = u_xlat92 * u_xlat16_93;
    u_xlat22.y = u_xlat31 * u_xlat91;
    u_xlat22.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat20.y = u_xlat91 * u_xlat16_95;
    u_xlat20.z = u_xlat92 * u_xlat10.x;
    u_xlat31 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat20.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat91 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat91 * u_xlat91;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_93 = u_xlat91 * u_xlat16_88;
    u_xlat91 = (-u_xlat16_88) * u_xlat91 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat91);
    u_xlat10.xzw = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat10.xzw;
    u_xlat16_25.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.yyy * u_xlat16_25.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_8.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat20.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_26.xyz * u_xlat10.xzw;
    u_xlat16_8.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat87 = u_xlat2.x + -1.0;
    u_xlat2.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat87) + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat2.xy = min(vec2(u_xlat16_102), u_xlat2.xy);
    u_xlat2.x = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_25.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat2.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat2.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlati2 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati2].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_26.xyz;
    u_xlati87 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_24.xyw;
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat16_13.xyz + u_xlat14.xyz;
    u_xlat87 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_94>=0.0);
#else
    u_xlatb87 = u_xlat16_94>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb87)) ? u_xlat10.xyz : u_xlat4.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat10.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat16_88 = u_xlat16_61 * 8.0;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_88 = u_xlat16_88 * abs(u_xlat16_94);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_88) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat4.xyz = vec3(u_xlat87) * u_xlat4.xyz;
    u_xlat16_88 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_88) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat9.xyz = vec3(u_xlat16_100) * u_xlat9.xyz + u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_94)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_88 = -abs(u_xlat16_94) * 0.800000012 + 1.0;
    u_xlat16_88 = u_xlat16_32.x * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_88);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_46.x = u_xlat16_32.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_13.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_13.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_61 = floor(u_xlat16_4.w);
    u_xlat16_93 = u_xlat16_61 + 1.0;
    u_xlat16_93 = min(u_xlat16_93, 15.0);
    u_xlat16_94 = u_xlat16_13.z * 15.0 + (-u_xlat16_61);
    u_xlat16_4.x = u_xlat16_61 * 16.0 + u_xlat16_4.y;
    u_xlat16_13.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_71.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_71.xy = u_xlat16_71.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_71.xy).x;
    u_xlat16_13.y = u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_61 = (-u_xlat16_0.x) + u_xlat16_87;
    u_xlat16_61 = u_xlat16_94 * u_xlat16_61 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_61;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.y * 0.5;
    u_xlat16_61 = (-u_xlat2.y) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_61 + u_xlat16_3.x;
    u_xlat16_61 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_93 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93 + u_xlat16_61;
    u_xlat16_3.x = u_xlat2.y * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat21.y = u_xlat16_32.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_15.xyz;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat11.xy * vec2(u_xlat16_90) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_12.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_88 = (-u_xlat0.x) + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.00100000005);
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _FresnelPower;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_3.x = max(_FresnelIntensity, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _FresnelColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_58) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw + u_xlat16_1.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_12.xyz);
    u_xlat16_3.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_87 = texture(_MergeTex01, u_xlat16_3.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_88 = _GlitterScale * 0.681690156;
    u_xlat2.xy = vec2(u_xlat16_88) * u_xlat2.xy;
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_88 = u_xlat16_87 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * _GlitterIntensity;
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _GlitterContrast;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_88 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_3.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_3.xy = u_xlat0.xz * vec2(u_xlat16_88) + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_88 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_88) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_88 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat87 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat87 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(16) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
float u_xlat31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_46;
float u_xlat48;
vec3 u_xlat49;
mediump float u_xlat16_58;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat68;
mediump vec2 u_xlat16_71;
float u_xlat77;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_88;
float u_xlat89;
mediump float u_xlat16_90;
float u_xlat91;
float u_xlat92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
float u_xlat106;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat29.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat29.xy = fract(u_xlat29.xy);
    u_xlat29.xy = u_xlat29.xy + u_xlat16_1.xy;
    u_xlat16_29 = texture(_MergeTex01, u_xlat29.xy).z;
    u_xlat29.x = u_xlat16_29 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_58 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_87 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat31 = u_xlat2.x * _UpChangColorShrink + u_xlat16_87;
    u_xlat16_1.x = u_xlat31 + u_xlat31;
    u_xlat60 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat31 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_30.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_30.x = (-u_xlat60) + 1.0;
    u_xlat16_30.xyz = u_xlat16_30.xxx * _UpChangEdgeColor.xyz;
    u_xlat87 = u_xlat2.x * _ChangColorShrink + u_xlat16_87;
    u_xlat16_3.x = u_xlat87 + u_xlat87;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat87 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_32.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_32.x = (-u_xlat2.x) + 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * _ChangEdgeColor.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xxx + u_xlat16_32.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_32.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_32.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_32.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_32.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_10.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_88 = u_xlat16_10.z * _ShadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb87 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat87 = (u_xlatb87) ? 1.0 : -1.0;
    u_xlat87 = u_xlat87 * vs_TEXCOORD2.w;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_AnisotropicMap, u_xlat16_13.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat16_93 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_94 = u_xlat16_93 + -1.0;
    u_xlat16_95 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat89 = u_xlat2.x * _SunShift + _SunShiftOffset;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat91 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat91) + u_xlat4.xyz;
    u_xlat91 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat4.xyz = vec3(u_xlat91) * u_xlat4.xyz;
    u_xlat14.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat87) * u_xlat14.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat87 = u_xlat2.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_16.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_16.xyz = u_xlat16_3.xxx * u_xlat16_16.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_100 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_1.xyz * vec3(u_xlat16_100);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_32.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_100 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_102 = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_103 = (-u_xlat16_102) + u_xlat16_103;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_103 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_102;
    u_xlat16_102 = u_xlat16_3.x * u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat5.xyz) * vec3(u_xlat31) + vs_TEXCOORD0.xyz;
    u_xlat19.xyz = (bool(u_xlatb2)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat23;
    u_xlat21 = u_xlat19.yyyy * u_xlat21;
    u_xlat20 = u_xlat20 * u_xlat19.xxxx + u_xlat21;
    u_xlat19 = u_xlat22 * u_xlat19.zzzz + u_xlat20;
    u_xlat19 = u_xlat23 + u_xlat19;
    u_xlat2.x = _ShadowBias.x / u_xlat19.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat19.z;
    u_xlat31 = max((-u_xlat19.w), u_xlat2.x);
    u_xlat31 = (-u_xlat2.x) + u_xlat31;
    u_xlat19.z = _ShadowBias.y * u_xlat31 + u_xlat2.x;
    u_xlat19.xyz = u_xlat19.xyz / u_xlat19.www;
    u_xlat19.xyz = u_xlat19.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat19.w = max(u_xlat19.z, 9.99999975e-05);
    u_xlat16_103 = (-_ShadowBias.w) + 1.0;
    u_xlat20.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat20.z = 0.0;
    u_xlat20.xyz = u_xlat19.xyw + u_xlat20.xyz;
    vec3 txVec0 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat20.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat19.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat20.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat20, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat31 = (-u_xlat16_103) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_103;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_88 + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat91 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat22.xyz = vec3(u_xlat91) * u_xlat22.xyz;
    u_xlat91 = u_xlat16_93 * u_xlat16_61;
    u_xlat91 = max(u_xlat91, 0.00100000005);
    u_xlat92 = (-u_xlat16_94) + 1.0;
    u_xlat92 = u_xlat16_61 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xyz);
    u_xlat96 = dot(u_xlat4.zxy, u_xlat16_12.xyz);
    u_xlat16_103 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat98 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat23.xyz;
    u_xlat87 = u_xlat16_95 * u_xlat16_61;
    u_xlat87 = max(u_xlat87, 0.00100000005);
    u_xlat101 = (-u_xlat16_99) + 1.0;
    u_xlat101 = u_xlat16_61 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat48 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat77 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat106 = u_xlat87 * u_xlat101;
    u_xlat23.x = u_xlat16_93 * u_xlat101;
    u_xlat23.y = u_xlat87 * u_xlat19.x;
    u_xlat23.z = u_xlat31 * u_xlat106;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat107 = u_xlat106 * 0.318309873;
    u_xlat19.x = u_xlat106 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat107 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat96 * u_xlat87;
    u_xlat21.z = u_xlat101 * u_xlat48;
    u_xlat48 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat21.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_103 * u_xlat87;
    u_xlat20.z = u_xlat101 * u_xlat77;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat20.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat48 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat101 = u_xlat91 * u_xlat92;
    u_xlat23.x = u_xlat92 * u_xlat16_93;
    u_xlat23.y = u_xlat91 * u_xlat68;
    u_xlat23.z = u_xlat31 * u_xlat101;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat68 = u_xlat101 * 0.318309873;
    u_xlat31 = u_xlat101 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat68 * u_xlat31;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat21.y = u_xlat91 * u_xlat96;
    u_xlat21.z = u_xlat92 * u_xlat97;
    u_xlat96 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat21.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat20.y = u_xlat91 * u_xlat16_103;
    u_xlat20.z = u_xlat92 * u_xlat98;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat96 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat98 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat98 * u_xlat98;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_93 = u_xlat98 * u_xlat16_88;
    u_xlat48 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_88) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat98);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_24.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_24.xyz + _ShadowColor.xyz;
    u_xlat16_25.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31 = u_xlat31 * u_xlat97;
    u_xlat23.xyz = u_xlat49.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat87 = u_xlat19.x * u_xlat87;
    u_xlat19.xzw = u_xlat49.xyz * vec3(u_xlat87);
    u_xlat19.xzw = u_xlat16_15.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat20.xxx * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat19.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xzw = u_xlat16_24.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat23.xyz * u_xlat16_24.xyz + u_xlat19.xzw;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat49.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat49.xyz;
    u_xlat16_24.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_24.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_24.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_15.xyz;
    u_xlat87 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat49.xyz = vec3(u_xlat87) * u_xlat49.xyz;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_15.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat49.xyz);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_15.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat49.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_15.xyz);
    u_xlat27.x = u_xlat92 * u_xlat16_93;
    u_xlat27.y = u_xlat31 * u_xlat91;
    u_xlat27.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat23.y = u_xlat91 * u_xlat16_95;
    u_xlat23.z = u_xlat92 * u_xlat97;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat23.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat97 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat97 * u_xlat97;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_93 = u_xlat97 * u_xlat16_88;
    u_xlat97 = (-u_xlat16_88) * u_xlat97 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat10.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat23.xxx * u_xlat16_15.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat49.xyz = min(max(u_xlat49.xyz, 0.0), 1.0);
#else
    u_xlat49.xyz = clamp(u_xlat49.xyz, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat16_8.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat23.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat16_24.xyz * u_xlat49.xyz;
    u_xlat16_24.xyz = u_xlat49.xyz * u_xlat10.xxx + u_xlat19.xzw;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat19.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_25.xyz = vec3(u_xlat16_93) * u_xlat19.xzw;
    u_xlat16_26.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_26.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_26.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xzw = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_25.xyz;
    u_xlat87 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xzw = vec3(u_xlat87) * u_xlat19.xzw;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_25.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xzw);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat19.xzw);
    u_xlat10.x = dot(u_xlat22.xyz, u_xlat16_25.xyz);
    u_xlat22.x = u_xlat92 * u_xlat16_93;
    u_xlat22.y = u_xlat31 * u_xlat91;
    u_xlat22.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat20.y = u_xlat91 * u_xlat16_95;
    u_xlat20.z = u_xlat92 * u_xlat10.x;
    u_xlat31 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat20.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat91 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat91 * u_xlat91;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_93 = u_xlat91 * u_xlat16_88;
    u_xlat91 = (-u_xlat16_88) * u_xlat91 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat91);
    u_xlat10.xzw = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat10.xzw;
    u_xlat16_25.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.yyy * u_xlat16_25.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_8.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat20.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_26.xyz * u_xlat10.xzw;
    u_xlat16_8.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat87 = u_xlat2.x + -1.0;
    u_xlat2.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat87) + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat2.xy = min(vec2(u_xlat16_102), u_xlat2.xy);
    u_xlat2.x = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_25.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat2.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat2.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlati2 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati2].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_26.xyz;
    u_xlati87 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_24.xyw;
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat16_13.xyz + u_xlat14.xyz;
    u_xlat87 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_94>=0.0);
#else
    u_xlatb87 = u_xlat16_94>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb87)) ? u_xlat10.xyz : u_xlat4.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat10.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat16_88 = u_xlat16_61 * 8.0;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_88 = u_xlat16_88 * abs(u_xlat16_94);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_88) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat4.xyz = vec3(u_xlat87) * u_xlat4.xyz;
    u_xlat16_88 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_88) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat9.xyz = vec3(u_xlat16_100) * u_xlat9.xyz + u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_94)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_88 = -abs(u_xlat16_94) * 0.800000012 + 1.0;
    u_xlat16_88 = u_xlat16_32.x * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_88);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_46.x = u_xlat16_32.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_13.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_13.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_61 = floor(u_xlat16_4.w);
    u_xlat16_93 = u_xlat16_61 + 1.0;
    u_xlat16_93 = min(u_xlat16_93, 15.0);
    u_xlat16_94 = u_xlat16_13.z * 15.0 + (-u_xlat16_61);
    u_xlat16_4.x = u_xlat16_61 * 16.0 + u_xlat16_4.y;
    u_xlat16_13.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_71.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_71.xy = u_xlat16_71.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_71.xy).x;
    u_xlat16_13.y = u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_61 = (-u_xlat16_0.x) + u_xlat16_87;
    u_xlat16_61 = u_xlat16_94 * u_xlat16_61 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_61;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.y * 0.5;
    u_xlat16_61 = (-u_xlat2.y) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_61 + u_xlat16_3.x;
    u_xlat16_61 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_93 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93 + u_xlat16_61;
    u_xlat16_3.x = u_xlat2.y * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat21.y = u_xlat16_32.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_15.xyz;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat11.xy * vec2(u_xlat16_90) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_12.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_88 = (-u_xlat0.x) + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.00100000005);
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _FresnelPower;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_3.x = max(_FresnelIntensity, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _FresnelColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_58) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw + u_xlat16_1.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_12.xyz);
    u_xlat16_3.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_87 = texture(_MergeTex01, u_xlat16_3.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_88 = _GlitterScale * 0.681690156;
    u_xlat2.xy = vec2(u_xlat16_88) * u_xlat2.xy;
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_88 = u_xlat16_87 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * _GlitterIntensity;
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _GlitterContrast;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_88 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_3.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_3.xy = u_xlat0.xz * vec2(u_xlat16_88) + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_88 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_88) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_88 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.zxy) + _FogCol.zxy;
    u_xlat16_1.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.zxy;
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
    u_xlat87 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat87 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_5.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_2.xyz) + u_xlat16_5.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec4 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec2 u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump vec3 u_xlat16_31;
float u_xlat32;
int u_xlati32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_46;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_60;
float u_xlat62;
mediump float u_xlat16_63;
mediump vec2 u_xlat16_72;
float u_xlat79;
float u_xlat80;
float u_xlat90;
mediump float u_xlat16_90;
int u_xlati90;
bool u_xlatb90;
mediump float u_xlat16_91;
mediump float u_xlat16_93;
float u_xlat94;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_96;
mediump float u_xlat16_97;
mediump float u_xlat16_98;
float u_xlat99;
float u_xlat100;
mediump float u_xlat16_101;
mediump float u_xlat16_102;
float u_xlat103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
float u_xlat109;
float u_xlat110;
float u_xlat111;
float u_xlat113;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat30.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat30.xy = fract(u_xlat30.xy);
    u_xlat30.xy = u_xlat30.xy + u_xlat16_1.xy;
    u_xlat16_30 = texture(_MergeTex01, u_xlat30.xy).z;
    u_xlat30.x = u_xlat16_30 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_60 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_90 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat32 = u_xlat2.x * _UpChangColorShrink + u_xlat16_90;
    u_xlat16_1.x = u_xlat32 + u_xlat32;
    u_xlat62 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat32 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_31.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_31.x = (-u_xlat62) + 1.0;
    u_xlat16_31.xyz = u_xlat16_31.xxx * _UpChangEdgeColor.xyz;
    u_xlat90 = u_xlat2.x * _ChangColorShrink + u_xlat16_90;
    u_xlat16_3.x = u_xlat90 + u_xlat90;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat90 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_33.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_33.x = (-u_xlat2.x) + 1.0;
    u_xlat16_33.xyz = u_xlat16_33.xxx * _ChangEdgeColor.xyz;
    u_xlat16_33.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz;
    u_xlat16_1.xyz = u_xlat16_31.xyz * u_xlat16_1.xxx + u_xlat16_33.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_33.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_33.xyz = u_xlat10_2.xyz * u_xlat16_33.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_33.xyz = u_xlat10_2.xyz * u_xlat16_33.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_33.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_33.xyz = (-u_xlat16_33.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_33.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_33.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_33.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_91 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_91) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_2.xw = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_91 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_11.xyz = vec3(u_xlat16_91) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb90 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat90 = (u_xlatb90) ? 1.0 : -1.0;
    u_xlat90 = u_xlat90 * vs_TEXCOORD2.w;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_94 = texture(_AnisotropicMap, u_xlat16_12.xy).x;
    u_xlat94 = u_xlat16_94 * 2.0 + -1.0;
    u_xlat16_93 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_96 = u_xlat16_93 + -1.0;
    u_xlat16_97 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_98 = u_xlat16_97 + -1.0;
    u_xlat95 = u_xlat94 * _SunShift + _SunShiftOffset;
    u_xlat95 = u_xlat95 + vs_TEXCOORD5;
    u_xlat99 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat99) + u_xlat4.xyz;
    u_xlat99 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat99 = inversesqrt(u_xlat99);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat99);
    u_xlat13.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat90) * u_xlat13.xyz;
    u_xlat16_101 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_101 = inversesqrt(u_xlat16_101);
    u_xlat16_12.xyz = vec3(u_xlat16_101) * vs_TEXCOORD1.yzx;
    u_xlat90 = u_xlat94 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat90 = u_xlat90 + vs_TEXCOORD5;
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_101 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_1.xyz * vec3(u_xlat16_101);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_33.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_101 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_101 = max(u_xlat16_101, 0.0078125);
    u_xlat16_102 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_104 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_104 = (-u_xlat16_102) + u_xlat16_104;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_104 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_102;
    u_xlat16_102 = u_xlat16_3.x * u_xlat16_102;
    u_xlat19.xyz = u_xlat10.xyz * vec3(u_xlat16_91) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat32 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat19.xyz = vec3(u_xlat32) * u_xlat19.xyz;
    u_xlat32 = dot(u_xlat5.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat32 = min(max(u_xlat32, 0.0), 1.0);
#else
    u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
#endif
    u_xlat16_104 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_104 = min(max(u_xlat16_104, 0.0), 1.0);
#else
    u_xlat16_104 = clamp(u_xlat16_104, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat95) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat94 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat94 = inversesqrt(u_xlat94);
    u_xlat23.xyz = vec3(u_xlat94) * u_xlat22.xyz;
    u_xlat94 = u_xlat16_93 * u_xlat16_63;
    u_xlat94 = max(u_xlat94, 0.00100000005);
    u_xlat99 = (-u_xlat16_96) + 1.0;
    u_xlat99 = u_xlat16_63 * u_xlat99;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xyz);
    u_xlat100 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat16_105 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat103 = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat109 = dot(u_xlat23.xyz, u_xlat16_11.xyz);
    u_xlat110 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat24.xyz = vec3(u_xlat90) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat90 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat24.xyz = vec3(u_xlat90) * u_xlat24.xyz;
    u_xlat90 = u_xlat16_97 * u_xlat16_63;
    u_xlat90 = max(u_xlat90, 0.00100000005);
    u_xlat111 = (-u_xlat16_98) + 1.0;
    u_xlat111 = u_xlat16_63 * u_xlat111;
    u_xlat111 = max(u_xlat111, 0.00100000005);
    u_xlat19.x = dot(u_xlat24.xyz, u_xlat19.xyz);
    u_xlat49 = dot(u_xlat24.xyz, u_xlat16_11.xyz);
    u_xlat79 = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat113 = u_xlat90 * u_xlat111;
    u_xlat24.x = u_xlat16_93 * u_xlat111;
    u_xlat24.y = u_xlat90 * u_xlat19.x;
    u_xlat24.z = u_xlat32 * u_xlat113;
    u_xlat19.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat24.x = u_xlat113 * 0.318309873;
    u_xlat19.x = u_xlat113 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat24.x * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat90;
    u_xlat21.z = u_xlat49 * u_xlat111;
    u_xlat49 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat49 + u_xlat21.x;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_105 * u_xlat90;
    u_xlat20.z = u_xlat79 * u_xlat111;
    u_xlat90 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat90 + u_xlat20.x;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat90 = u_xlat49 * u_xlat90 + 6.10351563e-05;
    u_xlat90 = float(1.0) / u_xlat90;
    u_xlat49 = u_xlat94 * u_xlat99;
    u_xlat24.x = u_xlat16_93 * u_xlat99;
    u_xlat24.y = u_xlat94 * u_xlat103;
    u_xlat24.z = u_xlat32 * u_xlat49;
    u_xlat32 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat103 = u_xlat49 * 0.318309873;
    u_xlat32 = u_xlat49 / u_xlat32;
    u_xlat32 = u_xlat32 * u_xlat32;
    u_xlat32 = u_xlat103 * u_xlat32;
    u_xlat32 = min(u_xlat32, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat100;
    u_xlat21.z = u_xlat99 * u_xlat109;
    u_xlat100 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat21.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat20.y = u_xlat94 * u_xlat16_105;
    u_xlat20.z = u_xlat99 * u_xlat110;
    u_xlat79 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat20.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat79 = u_xlat100 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat109 = (-u_xlat16_104) + 1.0;
    u_xlat16_93 = u_xlat109 * u_xlat109;
    u_xlat16_93 = u_xlat109 * u_xlat16_93;
    u_xlat16_93 = u_xlat109 * u_xlat16_93;
    u_xlat16_97 = u_xlat109 * u_xlat16_93;
    u_xlat50 = u_xlat16_18.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat109 = (-u_xlat16_93) * u_xlat109 + 1.0;
    u_xlat24.xyz = u_xlat16_18.xyz * vec3(u_xlat109);
    u_xlat24.xyz = vec3(u_xlat50) * vec3(u_xlat16_97) + u_xlat24.xyz;
    u_xlat16_25.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat32 = u_xlat32 * u_xlat79;
    u_xlat26.xyz = u_xlat24.xyz * vec3(u_xlat32);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat16_8.xyz * u_xlat26.xyz;
    u_xlat26.xyz = u_xlat20.xxx * u_xlat26.xyz;
    u_xlat90 = u_xlat19.x * u_xlat90;
    u_xlat19.xzw = u_xlat24.xyz * vec3(u_xlat90);
    u_xlat19.xzw = u_xlat16_14.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat20.xxx * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat19.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xzw = u_xlat26.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat19.xzw;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb90 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_93 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_97 = inversesqrt(u_xlat16_93);
    u_xlat16_14.xyz = vec3(u_xlat16_97) * u_xlat24.xyz;
    u_xlat16_27.xy = (bool(u_xlatb90)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_27.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_27.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb90 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_97 = (u_xlatb90) ? 1.0 : 0.0;
    u_xlat16_98 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_98 = u_xlat16_98 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_98 = u_xlat16_98 * u_xlat16_98;
    u_xlat16_97 = max(u_xlat16_97, u_xlat16_98);
    u_xlat16_98 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_98;
    u_xlat16_93 = max(u_xlat16_27.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_97 * u_xlat16_93;
    u_xlat16_27.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xw = u_xlat16_2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xw = min(max(u_xlat2.xw, 0.0), 1.0);
#else
    u_xlat2.xw = clamp(u_xlat2.xw, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat10.xyz * vec3(u_xlat16_91) + u_xlat16_14.xyz;
    u_xlat90 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat24.xyz = vec3(u_xlat90) * u_xlat24.xyz;
    u_xlat90 = dot(u_xlat5.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat16_14.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat5.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_97 = dot(u_xlat4.zxy, u_xlat24.xyz);
    u_xlat16_98 = dot(u_xlat4.zxy, u_xlat16_14.xyz);
    u_xlat32 = dot(u_xlat23.xyz, u_xlat24.xyz);
    u_xlat80 = dot(u_xlat23.xyz, u_xlat16_14.xyz);
    u_xlat24.x = u_xlat16_97 * u_xlat99;
    u_xlat24.y = u_xlat32 * u_xlat94;
    u_xlat24.z = u_xlat90 * u_xlat49;
    u_xlat90 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat90 = max(u_xlat90, 6.10351563e-05);
    u_xlat90 = u_xlat49 / u_xlat90;
    u_xlat90 = u_xlat90 * u_xlat90;
    u_xlat90 = u_xlat103 * u_xlat90;
    u_xlat90 = min(u_xlat90, 16.0);
    u_xlat26.y = u_xlat94 * u_xlat16_98;
    u_xlat26.z = u_xlat99 * u_xlat80;
    u_xlat32 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat32 = sqrt(u_xlat32);
    u_xlat32 = u_xlat32 + u_xlat26.x;
    u_xlat32 = u_xlat32 + 6.10351563e-05;
    u_xlat32 = u_xlat100 * u_xlat32 + 6.10351563e-05;
    u_xlat32 = float(1.0) / u_xlat32;
    u_xlat80 = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat80 * u_xlat80;
    u_xlat16_93 = u_xlat80 * u_xlat16_93;
    u_xlat16_93 = u_xlat80 * u_xlat16_93;
    u_xlat16_97 = u_xlat80 * u_xlat16_93;
    u_xlat80 = (-u_xlat16_93) * u_xlat80 + 1.0;
    u_xlat24.xyz = u_xlat16_18.xyz * vec3(u_xlat80);
    u_xlat24.xyz = vec3(u_xlat50) * vec3(u_xlat16_97) + u_xlat24.xyz;
    u_xlat16_14.xyz = u_xlat16_17.xyz * u_xlat16_27.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat26.xxx * u_xlat16_14.xyz;
    u_xlat90 = u_xlat90 * u_xlat32;
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat90);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat16_8.xyz * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat26.xxx * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16_27.xyz * u_xlat24.xyz;
    u_xlat16_27.xyz = u_xlat24.xyz * u_xlat2.xxx + u_xlat19.xzw;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_14.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb90 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat19.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_93 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_97 = inversesqrt(u_xlat16_93);
    u_xlat16_25.xyz = vec3(u_xlat16_97) * u_xlat19.xzw;
    u_xlat16_28.xy = (bool(u_xlatb90)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_29.xyz = u_xlat16_28.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_28.yyy + u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb90 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_97 = (u_xlatb90) ? 1.0 : 0.0;
    u_xlat16_98 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_98 = u_xlat16_98 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_98 = u_xlat16_98 * u_xlat16_98;
    u_xlat16_97 = max(u_xlat16_97, u_xlat16_98);
    u_xlat16_98 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_98;
    u_xlat16_93 = max(u_xlat16_28.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_97 * u_xlat16_93;
    u_xlat16_28.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xzw = u_xlat10.xyz * vec3(u_xlat16_91) + u_xlat16_25.xyz;
    u_xlat90 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat19.xzw = vec3(u_xlat90) * u_xlat19.xzw;
    u_xlat90 = dot(u_xlat5.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat16_25.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_97 = dot(u_xlat4.zxy, u_xlat19.xzw);
    u_xlat16_98 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat19.xzw);
    u_xlat32 = dot(u_xlat23.xyz, u_xlat16_25.xyz);
    u_xlat23.x = u_xlat16_97 * u_xlat99;
    u_xlat23.y = u_xlat2.x * u_xlat94;
    u_xlat23.z = u_xlat90 * u_xlat49;
    u_xlat90 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat90 = max(u_xlat90, 6.10351563e-05);
    u_xlat90 = u_xlat49 / u_xlat90;
    u_xlat90 = u_xlat90 * u_xlat90;
    u_xlat90 = u_xlat103 * u_xlat90;
    u_xlat90 = min(u_xlat90, 16.0);
    u_xlat24.y = u_xlat94 * u_xlat16_98;
    u_xlat24.z = u_xlat32 * u_xlat99;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat24.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat100 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat32 = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat32 * u_xlat32;
    u_xlat16_93 = u_xlat32 * u_xlat16_93;
    u_xlat16_93 = u_xlat32 * u_xlat16_93;
    u_xlat16_97 = u_xlat32 * u_xlat16_93;
    u_xlat32 = (-u_xlat16_93) * u_xlat32 + 1.0;
    u_xlat19.xyz = u_xlat16_18.xyz * vec3(u_xlat32);
    u_xlat19.xyz = vec3(u_xlat50) * vec3(u_xlat16_97) + u_xlat19.xyz;
    u_xlat16_25.xyz = u_xlat16_17.xyz * u_xlat16_28.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat2.www * u_xlat16_25.xyz;
    u_xlat90 = u_xlat90 * u_xlat2.x;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat90);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat16_8.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat24.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat16_28.xyz * u_xlat19.xyz;
    u_xlat16_8.xyz = u_xlat19.xyz * u_xlat2.www + u_xlat16_27.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat24.xxx + u_xlat16_14.xyz;
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_25.y = u_xlat16_15.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_25.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati90 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat2.x = min(u_xlat16_102, 1.0);
    u_xlat94 = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = vec3(u_xlat94) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat94) * u_xlat16_27.xyz;
    u_xlat16_28.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = vec3(u_xlat94) * u_xlat16_28.xyz;
    u_xlat16_28.xyz = vec3(u_xlat94) * u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(u_xlat94) + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_28.xyz * vec3(u_xlat94) + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_3.xxx * u_xlat16_25.xyz;
    u_xlati32 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati32].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati90].xyz + u_xlat16_28.xyz;
    u_xlati90 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati90].xyz + u_xlat16_25.xyw;
    u_xlat16_28.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_28.xyz;
    u_xlat13.xyz = vec3(u_xlat95) * u_xlat16_12.xyz + u_xlat13.xyz;
    u_xlat90 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat13.xyz = vec3(u_xlat90) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(u_xlat16_96>=0.0);
#else
    u_xlatb90 = u_xlat16_96>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb90)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat13.xyz);
    u_xlat19.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat19.xyz);
    u_xlat16_63 = u_xlat16_63 * 8.0;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_63 = u_xlat16_63 * abs(u_xlat16_96);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_63) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat90 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat4.xyz = vec3(u_xlat90) * u_xlat4.xyz;
    u_xlat16_63 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_63 = u_xlat16_63 + u_xlat16_63;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_63) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat9.xyz = vec3(u_xlat16_101) * u_xlat9.xyz + u_xlat4.xyz;
    u_xlat13.xyz = u_xlat4.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_96)) * u_xlat13.xyz + u_xlat9.xyz;
    u_xlat16_63 = -abs(u_xlat16_96) * 0.800000012 + 1.0;
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_63);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat4.xyz);
    u_xlat16_46.x = u_xlat16_33.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_93 = floor(u_xlat16_4.w);
    u_xlat16_96 = u_xlat16_93 + 1.0;
    u_xlat16_96 = min(u_xlat16_96, 15.0);
    u_xlat16_97 = u_xlat16_12.z * 15.0 + (-u_xlat16_93);
    u_xlat16_4.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_12.x = u_xlat16_96 * 16.0 + u_xlat16_4.y;
    u_xlat16_72.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_72.xy = u_xlat16_72.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_72.xy).x;
    u_xlat16_12.y = u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_90 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_93 = (-u_xlat16_0.x) + u_xlat16_90;
    u_xlat16_93 = u_xlat16_97 * u_xlat16_93 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.x * 0.5;
    u_xlat16_93 = (-u_xlat2.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_93 + u_xlat16_3.x;
    u_xlat16_93 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_96 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_96 + u_xlat16_93;
    u_xlat16_3.x = u_xlat2.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_93 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_93;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_63);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_63 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_12.xyz;
    u_xlat21.y = u_xlat16_33.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_33.xyz = u_xlat16_18.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_33.xyz = u_xlat16_12.xyz * u_xlat16_33.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xyz * u_xlat16_27.xyz + u_xlat16_8.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + u_xlat16_8.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat10.xy * vec2(u_xlat16_91) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_93 = (-u_xlat0.x) + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.00100000005);
    u_xlat16_93 = log2(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _FresnelPower;
    u_xlat16_93 = exp2(u_xlat16_93);
    u_xlat16_6.x = max(_FresnelIntensity, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_6.x;
    u_xlat16_6.xyz = vec3(u_xlat16_93) * _FresnelColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_60) * u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(u_xlat16_60) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_3.xyz = u_xlat0.xzw + u_xlat16_3.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_11.xyz);
    u_xlat16_6.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_90 = texture(_MergeTex01, u_xlat16_6.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_93 = _GlitterScale * 0.681690156;
    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat16_93);
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_93 = u_xlat16_90 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 * _GlitterIntensity;
    u_xlat16_93 = log2(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _GlitterContrast;
    u_xlat16_93 = exp2(u_xlat16_93);
    u_xlat16_93 = min(u_xlat16_93, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_93) * _GlitterColor.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat30.xxx + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb30 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_93 = (u_xlatb30) ? 1.0 : 0.0;
    u_xlat16_6.xy = (bool(u_xlatb30)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_6.xy = u_xlat0.xz * vec2(u_xlat16_93) + u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_6.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_6.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_93 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(u_xlat16_93) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_93 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_6.xyz = vec3(u_xlat16_93) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_93) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_0.yyy * u_xlat16_7.xyz + u_xlat16_6.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_93) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_3.xyz = u_xlat16_0.zzz * u_xlat16_7.xyz + u_xlat16_6.xyz;
    }
    u_xlat16_6.xyz = (-u_xlat16_3.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_3.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(5) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(6) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(10) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(11) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(12) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
ivec4 u_xlati2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
vec3 u_xlat24;
mediump vec4 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
mediump vec3 u_xlat16_29;
vec2 u_xlat30;
mediump float u_xlat16_30;
bool u_xlatb30;
mediump vec3 u_xlat16_31;
float u_xlat32;
int u_xlati32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_46;
float u_xlat49;
float u_xlat50;
mediump float u_xlat16_60;
float u_xlat62;
mediump float u_xlat16_63;
mediump vec2 u_xlat16_72;
float u_xlat79;
float u_xlat80;
float u_xlat90;
mediump float u_xlat16_90;
int u_xlati90;
bool u_xlatb90;
mediump float u_xlat16_91;
mediump float u_xlat16_93;
float u_xlat94;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_96;
mediump float u_xlat16_97;
mediump float u_xlat16_98;
float u_xlat99;
float u_xlat100;
mediump float u_xlat16_101;
mediump float u_xlat16_102;
float u_xlat103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
float u_xlat109;
float u_xlat110;
float u_xlat111;
float u_xlat113;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat30.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat30.xy = fract(u_xlat30.xy);
    u_xlat30.xy = u_xlat30.xy + u_xlat16_1.xy;
    u_xlat16_30 = texture(_MergeTex01, u_xlat30.xy).z;
    u_xlat30.x = u_xlat16_30 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat30.x = min(max(u_xlat30.x, 0.0), 1.0);
#else
    u_xlat30.x = clamp(u_xlat30.x, 0.0, 1.0);
#endif
    u_xlat16_60 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_90 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat32 = u_xlat2.x * _UpChangColorShrink + u_xlat16_90;
    u_xlat16_1.x = u_xlat32 + u_xlat32;
    u_xlat62 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat62 = min(max(u_xlat62, 0.0), 1.0);
#else
    u_xlat62 = clamp(u_xlat62, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat32 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_31.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_31.x = (-u_xlat62) + 1.0;
    u_xlat16_31.xyz = u_xlat16_31.xxx * _UpChangEdgeColor.xyz;
    u_xlat90 = u_xlat2.x * _ChangColorShrink + u_xlat16_90;
    u_xlat16_3.x = u_xlat90 + u_xlat90;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat90 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_33.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_33.x = (-u_xlat2.x) + 1.0;
    u_xlat16_33.xyz = u_xlat16_33.xxx * _ChangEdgeColor.xyz;
    u_xlat16_33.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz;
    u_xlat16_1.xyz = u_xlat16_31.xyz * u_xlat16_1.xxx + u_xlat16_33.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_33.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_33.xyz = u_xlat10_2.xyz * u_xlat16_33.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_33.xyz = u_xlat10_2.xyz * u_xlat16_33.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_33.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_33.xyz = (-u_xlat16_33.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_33.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_33.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_33.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_91 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_91) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_2.xw = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat10.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_91 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_11.xyz = vec3(u_xlat16_91) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb90 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat90 = (u_xlatb90) ? 1.0 : -1.0;
    u_xlat90 = u_xlat90 * vs_TEXCOORD2.w;
    u_xlat16_12.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_94 = texture(_AnisotropicMap, u_xlat16_12.xy).x;
    u_xlat94 = u_xlat16_94 * 2.0 + -1.0;
    u_xlat16_93 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_96 = u_xlat16_93 + -1.0;
    u_xlat16_97 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_98 = u_xlat16_97 + -1.0;
    u_xlat95 = u_xlat94 * _SunShift + _SunShiftOffset;
    u_xlat95 = u_xlat95 + vs_TEXCOORD5;
    u_xlat99 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat99) + u_xlat4.xyz;
    u_xlat99 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat99 = inversesqrt(u_xlat99);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat99);
    u_xlat13.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat13.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat90) * u_xlat13.xyz;
    u_xlat16_101 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_101 = inversesqrt(u_xlat16_101);
    u_xlat16_12.xyz = vec3(u_xlat16_101) * vs_TEXCOORD1.yzx;
    u_xlat90 = u_xlat94 * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat90 = u_xlat90 + vs_TEXCOORD5;
    u_xlat16_14.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_14.xyz = u_xlat16_3.xxx * u_xlat16_14.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_15.xyz = vec3(_OcclusionScale) * u_xlat16_15.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_15.xyz, u_xlat16_15.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_101 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_17.xyz = u_xlat16_1.xyz * vec3(u_xlat16_101);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_18.xyz = u_xlat16_33.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_63 = max(u_xlat16_63, 0.0078125);
    u_xlat16_101 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_101 = max(u_xlat16_101, 0.0078125);
    u_xlat16_102 = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_104 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_104 = (-u_xlat16_102) + u_xlat16_104;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_104 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_102;
    u_xlat16_102 = u_xlat16_3.x * u_xlat16_102;
    u_xlat19.xyz = u_xlat10.xyz * vec3(u_xlat16_91) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat32 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat32 = inversesqrt(u_xlat32);
    u_xlat19.xyz = vec3(u_xlat32) * u_xlat19.xyz;
    u_xlat32 = dot(u_xlat5.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat32 = min(max(u_xlat32, 0.0), 1.0);
#else
    u_xlat32 = clamp(u_xlat32, 0.0, 1.0);
#endif
    u_xlat16_104 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_104 = min(max(u_xlat16_104, 0.0), 1.0);
#else
    u_xlat16_104 = clamp(u_xlat16_104, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat5.xyz, u_xlat16_11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat95) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat94 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat94 = inversesqrt(u_xlat94);
    u_xlat23.xyz = vec3(u_xlat94) * u_xlat22.xyz;
    u_xlat94 = u_xlat16_93 * u_xlat16_63;
    u_xlat94 = max(u_xlat94, 0.00100000005);
    u_xlat99 = (-u_xlat16_96) + 1.0;
    u_xlat99 = u_xlat16_63 * u_xlat99;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xyz);
    u_xlat100 = dot(u_xlat4.zxy, u_xlat16_11.xyz);
    u_xlat16_105 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat103 = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat109 = dot(u_xlat23.xyz, u_xlat16_11.xyz);
    u_xlat110 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat24.xyz = vec3(u_xlat90) * u_xlat5.xyz + u_xlat13.zxy;
    u_xlat90 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat24.xyz = vec3(u_xlat90) * u_xlat24.xyz;
    u_xlat90 = u_xlat16_97 * u_xlat16_63;
    u_xlat90 = max(u_xlat90, 0.00100000005);
    u_xlat111 = (-u_xlat16_98) + 1.0;
    u_xlat111 = u_xlat16_63 * u_xlat111;
    u_xlat111 = max(u_xlat111, 0.00100000005);
    u_xlat19.x = dot(u_xlat24.xyz, u_xlat19.xyz);
    u_xlat49 = dot(u_xlat24.xyz, u_xlat16_11.xyz);
    u_xlat79 = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat113 = u_xlat90 * u_xlat111;
    u_xlat24.x = u_xlat16_93 * u_xlat111;
    u_xlat24.y = u_xlat90 * u_xlat19.x;
    u_xlat24.z = u_xlat32 * u_xlat113;
    u_xlat19.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat24.x = u_xlat113 * 0.318309873;
    u_xlat19.x = u_xlat113 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat24.x * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat90;
    u_xlat21.z = u_xlat49 * u_xlat111;
    u_xlat49 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat49 = sqrt(u_xlat49);
    u_xlat49 = u_xlat49 + u_xlat21.x;
    u_xlat49 = u_xlat49 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_105 * u_xlat90;
    u_xlat20.z = u_xlat79 * u_xlat111;
    u_xlat90 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat90 + u_xlat20.x;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat90 = u_xlat49 * u_xlat90 + 6.10351563e-05;
    u_xlat90 = float(1.0) / u_xlat90;
    u_xlat49 = u_xlat94 * u_xlat99;
    u_xlat24.x = u_xlat16_93 * u_xlat99;
    u_xlat24.y = u_xlat94 * u_xlat103;
    u_xlat24.z = u_xlat32 * u_xlat49;
    u_xlat32 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat32 = max(u_xlat32, 6.10351563e-05);
    u_xlat103 = u_xlat49 * 0.318309873;
    u_xlat32 = u_xlat49 / u_xlat32;
    u_xlat32 = u_xlat32 * u_xlat32;
    u_xlat32 = u_xlat103 * u_xlat32;
    u_xlat32 = min(u_xlat32, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat100;
    u_xlat21.z = u_xlat99 * u_xlat109;
    u_xlat100 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat21.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat20.y = u_xlat94 * u_xlat16_105;
    u_xlat20.z = u_xlat99 * u_xlat110;
    u_xlat79 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat79 = sqrt(u_xlat79);
    u_xlat79 = u_xlat79 + u_xlat20.x;
    u_xlat79 = u_xlat79 + 6.10351563e-05;
    u_xlat79 = u_xlat100 * u_xlat79 + 6.10351563e-05;
    u_xlat79 = float(1.0) / u_xlat79;
    u_xlat109 = (-u_xlat16_104) + 1.0;
    u_xlat16_93 = u_xlat109 * u_xlat109;
    u_xlat16_93 = u_xlat109 * u_xlat16_93;
    u_xlat16_93 = u_xlat109 * u_xlat16_93;
    u_xlat16_97 = u_xlat109 * u_xlat16_93;
    u_xlat50 = u_xlat16_18.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat50 = min(max(u_xlat50, 0.0), 1.0);
#else
    u_xlat50 = clamp(u_xlat50, 0.0, 1.0);
#endif
    u_xlat109 = (-u_xlat16_93) * u_xlat109 + 1.0;
    u_xlat24.xyz = u_xlat16_18.xyz * vec3(u_xlat109);
    u_xlat24.xyz = vec3(u_xlat50) * vec3(u_xlat16_97) + u_xlat24.xyz;
    u_xlat16_25.xyz = u_xlat16_17.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat32 = u_xlat32 * u_xlat79;
    u_xlat26.xyz = u_xlat24.xyz * vec3(u_xlat32);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.xyz = min(max(u_xlat26.xyz, 0.0), 1.0);
#else
    u_xlat26.xyz = clamp(u_xlat26.xyz, 0.0, 1.0);
#endif
    u_xlat26.xyz = u_xlat16_8.xyz * u_xlat26.xyz;
    u_xlat26.xyz = u_xlat20.xxx * u_xlat26.xyz;
    u_xlat90 = u_xlat19.x * u_xlat90;
    u_xlat19.xzw = u_xlat24.xyz * vec3(u_xlat90);
    u_xlat19.xzw = u_xlat16_14.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat20.xxx * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat19.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xzw = u_xlat26.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat19.xzw;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb90 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat24.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_93 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_97 = inversesqrt(u_xlat16_93);
    u_xlat16_14.xyz = vec3(u_xlat16_97) * u_xlat24.xyz;
    u_xlat16_27.xy = (bool(u_xlatb90)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_27.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_27.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb90 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_97 = (u_xlatb90) ? 1.0 : 0.0;
    u_xlat16_98 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat16_98 = u_xlat16_98 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_98 = u_xlat16_98 * u_xlat16_98;
    u_xlat16_97 = max(u_xlat16_97, u_xlat16_98);
    u_xlat16_98 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_98;
    u_xlat16_93 = max(u_xlat16_27.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_97 * u_xlat16_93;
    u_xlat16_27.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat2.xw = u_xlat16_2.xw;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.xw = min(max(u_xlat2.xw, 0.0), 1.0);
#else
    u_xlat2.xw = clamp(u_xlat2.xw, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat10.xyz * vec3(u_xlat16_91) + u_xlat16_14.xyz;
    u_xlat90 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat24.xyz = vec3(u_xlat90) * u_xlat24.xyz;
    u_xlat90 = dot(u_xlat5.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat16_14.xyz, u_xlat24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat5.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_97 = dot(u_xlat4.zxy, u_xlat24.xyz);
    u_xlat16_98 = dot(u_xlat4.zxy, u_xlat16_14.xyz);
    u_xlat32 = dot(u_xlat23.xyz, u_xlat24.xyz);
    u_xlat80 = dot(u_xlat23.xyz, u_xlat16_14.xyz);
    u_xlat24.x = u_xlat16_97 * u_xlat99;
    u_xlat24.y = u_xlat32 * u_xlat94;
    u_xlat24.z = u_xlat90 * u_xlat49;
    u_xlat90 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat90 = max(u_xlat90, 6.10351563e-05);
    u_xlat90 = u_xlat49 / u_xlat90;
    u_xlat90 = u_xlat90 * u_xlat90;
    u_xlat90 = u_xlat103 * u_xlat90;
    u_xlat90 = min(u_xlat90, 16.0);
    u_xlat26.y = u_xlat94 * u_xlat16_98;
    u_xlat26.z = u_xlat99 * u_xlat80;
    u_xlat32 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat32 = sqrt(u_xlat32);
    u_xlat32 = u_xlat32 + u_xlat26.x;
    u_xlat32 = u_xlat32 + 6.10351563e-05;
    u_xlat32 = u_xlat100 * u_xlat32 + 6.10351563e-05;
    u_xlat32 = float(1.0) / u_xlat32;
    u_xlat80 = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat80 * u_xlat80;
    u_xlat16_93 = u_xlat80 * u_xlat16_93;
    u_xlat16_93 = u_xlat80 * u_xlat16_93;
    u_xlat16_97 = u_xlat80 * u_xlat16_93;
    u_xlat80 = (-u_xlat16_93) * u_xlat80 + 1.0;
    u_xlat24.xyz = u_xlat16_18.xyz * vec3(u_xlat80);
    u_xlat24.xyz = vec3(u_xlat50) * vec3(u_xlat16_97) + u_xlat24.xyz;
    u_xlat16_14.xyz = u_xlat16_17.xyz * u_xlat16_27.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = u_xlat2.xxx * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat26.xxx * u_xlat16_14.xyz;
    u_xlat90 = u_xlat90 * u_xlat32;
    u_xlat24.xyz = u_xlat24.xyz * vec3(u_xlat90);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = u_xlat16_8.xyz * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat26.xxx * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat16_27.xyz * u_xlat24.xyz;
    u_xlat16_27.xyz = u_xlat24.xyz * u_xlat2.xxx + u_xlat19.xzw;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_14.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb90 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat19.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_93 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_97 = inversesqrt(u_xlat16_93);
    u_xlat16_25.xyz = vec3(u_xlat16_97) * u_xlat19.xzw;
    u_xlat16_28.xy = (bool(u_xlatb90)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_29.xyz = u_xlat16_28.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_28.yyy + u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb90 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_97 = (u_xlatb90) ? 1.0 : 0.0;
    u_xlat16_98 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_98 = u_xlat16_98 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_98 = min(max(u_xlat16_98, 0.0), 1.0);
#else
    u_xlat16_98 = clamp(u_xlat16_98, 0.0, 1.0);
#endif
    u_xlat16_98 = u_xlat16_98 * u_xlat16_98;
    u_xlat16_97 = max(u_xlat16_97, u_xlat16_98);
    u_xlat16_98 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_98;
    u_xlat16_93 = max(u_xlat16_28.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_97 * u_xlat16_93;
    u_xlat16_28.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xzw = u_xlat10.xyz * vec3(u_xlat16_91) + u_xlat16_25.xyz;
    u_xlat90 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat19.xzw = vec3(u_xlat90) * u_xlat19.xzw;
    u_xlat90 = dot(u_xlat5.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat16_25.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_97 = dot(u_xlat4.zxy, u_xlat19.xzw);
    u_xlat16_98 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat2.x = dot(u_xlat23.xyz, u_xlat19.xzw);
    u_xlat32 = dot(u_xlat23.xyz, u_xlat16_25.xyz);
    u_xlat23.x = u_xlat16_97 * u_xlat99;
    u_xlat23.y = u_xlat2.x * u_xlat94;
    u_xlat23.z = u_xlat90 * u_xlat49;
    u_xlat90 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat90 = max(u_xlat90, 6.10351563e-05);
    u_xlat90 = u_xlat49 / u_xlat90;
    u_xlat90 = u_xlat90 * u_xlat90;
    u_xlat90 = u_xlat103 * u_xlat90;
    u_xlat90 = min(u_xlat90, 16.0);
    u_xlat24.y = u_xlat94 * u_xlat16_98;
    u_xlat24.z = u_xlat32 * u_xlat99;
    u_xlat2.x = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat2.x = sqrt(u_xlat2.x);
    u_xlat2.x = u_xlat2.x + u_xlat24.x;
    u_xlat2.x = u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = u_xlat100 * u_xlat2.x + 6.10351563e-05;
    u_xlat2.x = float(1.0) / u_xlat2.x;
    u_xlat32 = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat32 * u_xlat32;
    u_xlat16_93 = u_xlat32 * u_xlat16_93;
    u_xlat16_93 = u_xlat32 * u_xlat16_93;
    u_xlat16_97 = u_xlat32 * u_xlat16_93;
    u_xlat32 = (-u_xlat16_93) * u_xlat32 + 1.0;
    u_xlat19.xyz = u_xlat16_18.xyz * vec3(u_xlat32);
    u_xlat19.xyz = vec3(u_xlat50) * vec3(u_xlat16_97) + u_xlat19.xyz;
    u_xlat16_25.xyz = u_xlat16_17.xyz * u_xlat16_28.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat2.www * u_xlat16_25.xyz;
    u_xlat90 = u_xlat90 * u_xlat2.x;
    u_xlat19.xyz = u_xlat19.xyz * vec3(u_xlat90);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.xyz = min(max(u_xlat19.xyz, 0.0), 1.0);
#else
    u_xlat19.xyz = clamp(u_xlat19.xyz, 0.0, 1.0);
#endif
    u_xlat19.xyz = u_xlat16_8.xyz * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat24.xxx * u_xlat19.xyz;
    u_xlat19.xyz = u_xlat16_28.xyz * u_xlat19.xyz;
    u_xlat16_8.xyz = u_xlat19.xyz * u_xlat2.www + u_xlat16_27.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * u_xlat24.xxx + u_xlat16_14.xyz;
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_15.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_15.xz);
    u_xlat16_25.y = u_xlat16_15.y;
    u_xlati2.xyw = ivec3(uvec3(lessThan(u_xlat16_25.xyxz, vec4(0.0, 0.0, 0.0, 0.0)).xyw) * 0xFFFFFFFFu);
    u_xlati90 = int(uint(uint(u_xlati2.x) & 1u));
    u_xlat2.x = min(u_xlat16_102, 1.0);
    u_xlat94 = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = vec3(u_xlat94) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat94) * u_xlat16_27.xyz;
    u_xlat16_28.xyz = u_xlat16_17.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = vec3(u_xlat94) * u_xlat16_28.xyz;
    u_xlat16_28.xyz = vec3(u_xlat94) * u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * vec3(u_xlat94) + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_17.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_28.xyz * vec3(u_xlat94) + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_3.xxx * u_xlat16_25.xyz;
    u_xlati32 = int(int_bitfieldInsert(2,u_xlati2.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati32].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati90].xyz + u_xlat16_28.xyz;
    u_xlati90 = (u_xlati2.w != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati90].xyz + u_xlat16_25.xyw;
    u_xlat16_28.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_28.xyz;
    u_xlat13.xyz = vec3(u_xlat95) * u_xlat16_12.xyz + u_xlat13.xyz;
    u_xlat90 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat13.xyz = vec3(u_xlat90) * u_xlat13.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb90 = !!(u_xlat16_96>=0.0);
#else
    u_xlatb90 = u_xlat16_96>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb90)) ? u_xlat13.xyz : u_xlat4.xyz;
    u_xlat13.xyz = u_xlat16_11.xyz * u_xlat4.xyz;
    u_xlat13.xyz = u_xlat4.zxy * u_xlat16_11.yzx + (-u_xlat13.xyz);
    u_xlat19.xyz = u_xlat4.xyz * u_xlat13.xyz;
    u_xlat4.xyz = u_xlat13.zxy * u_xlat4.yzx + (-u_xlat19.xyz);
    u_xlat16_63 = u_xlat16_63 * 8.0;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_63 = u_xlat16_63 * abs(u_xlat16_96);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_63) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat90 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat4.xyz = vec3(u_xlat90) * u_xlat4.xyz;
    u_xlat16_63 = dot((-u_xlat16_11.xyz), u_xlat4.xyz);
    u_xlat16_63 = u_xlat16_63 + u_xlat16_63;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_63) + (-u_xlat16_11.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat9.xyz = vec3(u_xlat16_101) * u_xlat9.xyz + u_xlat4.xyz;
    u_xlat13.xyz = u_xlat4.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_96)) * u_xlat13.xyz + u_xlat9.xyz;
    u_xlat16_63 = -abs(u_xlat16_96) * 0.800000012 + 1.0;
    u_xlat16_63 = u_xlat16_33.x * u_xlat16_63;
    u_xlat16_63 = u_xlat16_63 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_63);
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat4.xyz);
    u_xlat16_46.x = u_xlat16_33.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_12.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_12.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_93 = floor(u_xlat16_4.w);
    u_xlat16_96 = u_xlat16_93 + 1.0;
    u_xlat16_96 = min(u_xlat16_96, 15.0);
    u_xlat16_97 = u_xlat16_12.z * 15.0 + (-u_xlat16_93);
    u_xlat16_4.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_12.x = u_xlat16_96 * 16.0 + u_xlat16_4.y;
    u_xlat16_72.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_72.xy = u_xlat16_72.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_72.xy).x;
    u_xlat16_12.y = u_xlat16_4.z;
    u_xlat16_12.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_90 = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_93 = (-u_xlat16_0.x) + u_xlat16_90;
    u_xlat16_93 = u_xlat16_97 * u_xlat16_93 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93;
    u_xlat0.x = dot(u_xlat16_15.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.x * 0.5;
    u_xlat16_93 = (-u_xlat2.x) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_93 + u_xlat16_3.x;
    u_xlat16_93 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_96 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_96 + u_xlat16_93;
    u_xlat16_3.x = u_xlat2.x * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_93 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_93;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_63);
    u_xlat16_12.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_63 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_15.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb0)) ? u_xlat16_15.xyz : u_xlat16_12.xyz;
    u_xlat21.y = u_xlat16_33.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_33.xyz = u_xlat16_18.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_33.xyz = u_xlat16_12.xyz * u_xlat16_33.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xxx * u_xlat16_33.xyz;
    u_xlat16_12.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_14.xyz;
    u_xlat16_8.xyz = u_xlat16_17.xyz * u_xlat16_27.xyz + u_xlat16_8.xyz;
    u_xlat16_3.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + u_xlat16_8.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_3.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat10.xy * vec2(u_xlat16_91) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_11.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_93 = (-u_xlat0.x) + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.00100000005);
    u_xlat16_93 = log2(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _FresnelPower;
    u_xlat16_93 = exp2(u_xlat16_93);
    u_xlat16_6.x = max(_FresnelIntensity, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_6.x;
    u_xlat16_6.xyz = vec3(u_xlat16_93) * _FresnelColor.xyz;
    u_xlat16_7.xyz = vec3(u_xlat16_60) * u_xlat16_6.xyz;
    u_xlat0.x = dot(u_xlat16_7.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_6.xyz * vec3(u_xlat16_60) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_3.xyz = u_xlat0.xzw + u_xlat16_3.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_11.xyz);
    u_xlat16_6.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_90 = texture(_MergeTex01, u_xlat16_6.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_93 = _GlitterScale * 0.681690156;
    u_xlat2.xy = u_xlat2.xy * vec2(u_xlat16_93);
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_93 = u_xlat16_90 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16_93 = u_xlat16_93 * _GlitterIntensity;
    u_xlat16_93 = log2(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _GlitterContrast;
    u_xlat16_93 = exp2(u_xlat16_93);
    u_xlat16_93 = min(u_xlat16_93, 1.0);
    u_xlat16_6.xyz = vec3(u_xlat16_93) * _GlitterColor.xyz;
    u_xlat16_3.xyz = u_xlat16_6.xyz * u_xlat30.xxx + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb30 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb30 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_93 = (u_xlatb30) ? 1.0 : 0.0;
    u_xlat16_6.xy = (bool(u_xlatb30)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_6.xy = u_xlat0.xz * vec2(u_xlat16_93) + u_xlat16_6.xy;
    u_xlat16_6.xy = u_xlat16_6.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_6.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_6.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_93 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_3.xyz = u_xlat16_6.xyz * vec3(u_xlat16_93) + u_xlat16_3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_93 = dot(u_xlat16_3.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_6.xyz = vec3(u_xlat16_93) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_93) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_6.xyz = u_xlat16_0.yyy * u_xlat16_7.xyz + u_xlat16_6.xyz;
        u_xlat16_7.xyz = vec3(u_xlat16_93) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_6.xyz);
        u_xlat16_3.xyz = u_xlat16_0.zzz * u_xlat16_7.xyz + u_xlat16_6.xyz;
    }
    u_xlat16_6.xyz = (-u_xlat16_3.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_6.xyz + u_xlat16_3.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec2 u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
float u_xlat31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_46;
float u_xlat48;
vec3 u_xlat49;
mediump float u_xlat16_58;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat68;
mediump vec2 u_xlat16_71;
float u_xlat77;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_88;
float u_xlat89;
mediump float u_xlat16_90;
float u_xlat91;
float u_xlat92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
float u_xlat106;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat29.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat29.xy = fract(u_xlat29.xy);
    u_xlat29.xy = u_xlat29.xy + u_xlat16_1.xy;
    u_xlat16_29 = texture(_MergeTex01, u_xlat29.xy).z;
    u_xlat29.x = u_xlat16_29 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_58 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_87 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat31 = u_xlat2.x * _UpChangColorShrink + u_xlat16_87;
    u_xlat16_1.x = u_xlat31 + u_xlat31;
    u_xlat60 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat31 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_30.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_30.x = (-u_xlat60) + 1.0;
    u_xlat16_30.xyz = u_xlat16_30.xxx * _UpChangEdgeColor.xyz;
    u_xlat87 = u_xlat2.x * _ChangColorShrink + u_xlat16_87;
    u_xlat16_3.x = u_xlat87 + u_xlat87;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat87 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_32.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_32.x = (-u_xlat2.x) + 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * _ChangEdgeColor.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xxx + u_xlat16_32.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_32.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_32.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_32.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_32.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_10.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_88 = u_xlat16_10.z * _ShadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb87 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat87 = (u_xlatb87) ? 1.0 : -1.0;
    u_xlat87 = u_xlat87 * vs_TEXCOORD2.w;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_AnisotropicMap, u_xlat16_13.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat16_93 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_94 = u_xlat16_93 + -1.0;
    u_xlat16_95 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat89 = u_xlat2.x * _SunShift + _SunShiftOffset;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat91 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat91) + u_xlat4.xyz;
    u_xlat91 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat4.xyz = vec3(u_xlat91) * u_xlat4.xyz;
    u_xlat14.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat87) * u_xlat14.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat87 = u_xlat2.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_16.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_16.xyz = u_xlat16_3.xxx * u_xlat16_16.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_100 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_1.xyz * vec3(u_xlat16_100);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_32.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_100 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_102 = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_103 = (-u_xlat16_102) + u_xlat16_103;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_103 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_102;
    u_xlat16_102 = u_xlat16_3.x * u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat5.xyz) * vec3(u_xlat31) + vs_TEXCOORD0.xyz;
    u_xlat19.xyz = (bool(u_xlatb2)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat23;
    u_xlat21 = u_xlat19.yyyy * u_xlat21;
    u_xlat20 = u_xlat20 * u_xlat19.xxxx + u_xlat21;
    u_xlat19 = u_xlat22 * u_xlat19.zzzz + u_xlat20;
    u_xlat19 = u_xlat23 + u_xlat19;
    u_xlat2.x = _ShadowBias.x / u_xlat19.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat19.z;
    u_xlat31 = max((-u_xlat19.w), u_xlat2.x);
    u_xlat31 = (-u_xlat2.x) + u_xlat31;
    u_xlat19.z = _ShadowBias.y * u_xlat31 + u_xlat2.x;
    u_xlat19.xyz = u_xlat19.xyz / u_xlat19.www;
    u_xlat19.xyz = u_xlat19.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat19.w = max(u_xlat19.z, 9.99999975e-05);
    u_xlat16_103 = (-_ShadowBias.w) + 1.0;
    u_xlat20.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat20.z = 0.0;
    u_xlat20.xyz = u_xlat19.xyw + u_xlat20.xyz;
    vec3 txVec0 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat20.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat19.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat20.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat20, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat31 = (-u_xlat16_103) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_103;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_88 + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat91 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat22.xyz = vec3(u_xlat91) * u_xlat22.xyz;
    u_xlat91 = u_xlat16_93 * u_xlat16_61;
    u_xlat91 = max(u_xlat91, 0.00100000005);
    u_xlat92 = (-u_xlat16_94) + 1.0;
    u_xlat92 = u_xlat16_61 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xyz);
    u_xlat96 = dot(u_xlat4.zxy, u_xlat16_12.xyz);
    u_xlat16_103 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat98 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat23.xyz;
    u_xlat87 = u_xlat16_95 * u_xlat16_61;
    u_xlat87 = max(u_xlat87, 0.00100000005);
    u_xlat101 = (-u_xlat16_99) + 1.0;
    u_xlat101 = u_xlat16_61 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat48 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat77 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat106 = u_xlat87 * u_xlat101;
    u_xlat23.x = u_xlat16_93 * u_xlat101;
    u_xlat23.y = u_xlat87 * u_xlat19.x;
    u_xlat23.z = u_xlat31 * u_xlat106;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat107 = u_xlat106 * 0.318309873;
    u_xlat19.x = u_xlat106 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat107 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat96 * u_xlat87;
    u_xlat21.z = u_xlat101 * u_xlat48;
    u_xlat48 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat21.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_103 * u_xlat87;
    u_xlat20.z = u_xlat101 * u_xlat77;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat20.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat48 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat101 = u_xlat91 * u_xlat92;
    u_xlat23.x = u_xlat92 * u_xlat16_93;
    u_xlat23.y = u_xlat91 * u_xlat68;
    u_xlat23.z = u_xlat31 * u_xlat101;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat68 = u_xlat101 * 0.318309873;
    u_xlat31 = u_xlat101 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat68 * u_xlat31;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat21.y = u_xlat91 * u_xlat96;
    u_xlat21.z = u_xlat92 * u_xlat97;
    u_xlat96 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat21.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat20.y = u_xlat91 * u_xlat16_103;
    u_xlat20.z = u_xlat92 * u_xlat98;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat96 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat98 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat98 * u_xlat98;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_93 = u_xlat98 * u_xlat16_88;
    u_xlat48 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_88) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat98);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_24.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_24.xyz + _ShadowColor.xyz;
    u_xlat16_25.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31 = u_xlat31 * u_xlat97;
    u_xlat23.xyz = u_xlat49.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat87 = u_xlat19.x * u_xlat87;
    u_xlat19.xzw = u_xlat49.xyz * vec3(u_xlat87);
    u_xlat19.xzw = u_xlat16_15.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat20.xxx * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat19.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xzw = u_xlat16_24.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat23.xyz * u_xlat16_24.xyz + u_xlat19.xzw;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat49.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat49.xyz;
    u_xlat16_24.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_24.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_24.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_15.xyz;
    u_xlat87 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat49.xyz = vec3(u_xlat87) * u_xlat49.xyz;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_15.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat49.xyz);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_15.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat49.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_15.xyz);
    u_xlat27.x = u_xlat92 * u_xlat16_93;
    u_xlat27.y = u_xlat31 * u_xlat91;
    u_xlat27.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat23.y = u_xlat91 * u_xlat16_95;
    u_xlat23.z = u_xlat92 * u_xlat97;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat23.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat97 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat97 * u_xlat97;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_93 = u_xlat97 * u_xlat16_88;
    u_xlat97 = (-u_xlat16_88) * u_xlat97 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat10.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat23.xxx * u_xlat16_15.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat49.xyz = min(max(u_xlat49.xyz, 0.0), 1.0);
#else
    u_xlat49.xyz = clamp(u_xlat49.xyz, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat16_8.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat23.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat16_24.xyz * u_xlat49.xyz;
    u_xlat16_24.xyz = u_xlat49.xyz * u_xlat10.xxx + u_xlat19.xzw;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat19.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_25.xyz = vec3(u_xlat16_93) * u_xlat19.xzw;
    u_xlat16_26.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_26.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_26.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xzw = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_25.xyz;
    u_xlat87 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xzw = vec3(u_xlat87) * u_xlat19.xzw;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_25.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xzw);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat19.xzw);
    u_xlat10.x = dot(u_xlat22.xyz, u_xlat16_25.xyz);
    u_xlat22.x = u_xlat92 * u_xlat16_93;
    u_xlat22.y = u_xlat31 * u_xlat91;
    u_xlat22.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat20.y = u_xlat91 * u_xlat16_95;
    u_xlat20.z = u_xlat92 * u_xlat10.x;
    u_xlat31 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat20.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat91 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat91 * u_xlat91;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_93 = u_xlat91 * u_xlat16_88;
    u_xlat91 = (-u_xlat16_88) * u_xlat91 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat91);
    u_xlat10.xzw = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat10.xzw;
    u_xlat16_25.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.yyy * u_xlat16_25.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_8.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat20.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_26.xyz * u_xlat10.xzw;
    u_xlat16_8.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat87 = u_xlat2.x + -1.0;
    u_xlat2.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat87) + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat2.xy = min(vec2(u_xlat16_102), u_xlat2.xy);
    u_xlat2.x = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_25.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat2.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat2.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlati2 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati2].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_26.xyz;
    u_xlati87 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_24.xyw;
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat16_13.xyz + u_xlat14.xyz;
    u_xlat87 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_94>=0.0);
#else
    u_xlatb87 = u_xlat16_94>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb87)) ? u_xlat10.xyz : u_xlat4.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat10.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat16_88 = u_xlat16_61 * 8.0;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_88 = u_xlat16_88 * abs(u_xlat16_94);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_88) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat4.xyz = vec3(u_xlat87) * u_xlat4.xyz;
    u_xlat16_88 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_88) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat9.xyz = vec3(u_xlat16_100) * u_xlat9.xyz + u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_94)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_88 = -abs(u_xlat16_94) * 0.800000012 + 1.0;
    u_xlat16_88 = u_xlat16_32.x * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_88);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_46.x = u_xlat16_32.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_13.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_13.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_61 = floor(u_xlat16_4.w);
    u_xlat16_93 = u_xlat16_61 + 1.0;
    u_xlat16_93 = min(u_xlat16_93, 15.0);
    u_xlat16_94 = u_xlat16_13.z * 15.0 + (-u_xlat16_61);
    u_xlat16_4.x = u_xlat16_61 * 16.0 + u_xlat16_4.y;
    u_xlat16_13.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_71.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_71.xy = u_xlat16_71.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_71.xy).x;
    u_xlat16_13.y = u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_61 = (-u_xlat16_0.x) + u_xlat16_87;
    u_xlat16_61 = u_xlat16_94 * u_xlat16_61 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_61;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.y * 0.5;
    u_xlat16_61 = (-u_xlat2.y) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_61 + u_xlat16_3.x;
    u_xlat16_61 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_93 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93 + u_xlat16_61;
    u_xlat16_3.x = u_xlat2.y * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat21.y = u_xlat16_32.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_15.xyz;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat11.xy * vec2(u_xlat16_90) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_12.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_88 = (-u_xlat0.x) + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.00100000005);
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _FresnelPower;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_3.x = max(_FresnelIntensity, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _FresnelColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_58) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw + u_xlat16_1.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_12.xyz);
    u_xlat16_3.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_87 = texture(_MergeTex01, u_xlat16_3.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_88 = _GlitterScale * 0.681690156;
    u_xlat2.xy = vec2(u_xlat16_88) * u_xlat2.xy;
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_88 = u_xlat16_87 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * _GlitterIntensity;
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _GlitterContrast;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_88 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_3.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_3.xy = u_xlat0.xz * vec2(u_xlat16_88) + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_88 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_88) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_88 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD6;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
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
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat1.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat1.xyz;
    vs_TEXCOORD6.xyz = u_xlat16_2.xyz;
    vs_TEXCOORD6.w = 0.0;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
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
    vs_TEXCOORD5 = in_TEXCOORD0.z;
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
uniform 	mediump vec4 _AlbedoColor;
uniform 	mediump vec4 _AlbedoChangColor;
uniform 	mediump vec4 _EmissiveColor;
uniform 	mediump vec4 _ChangColorDissolveMap_ST;
uniform 	mediump vec4 _ChangEdgeColor;
uniform 	float _ChangColorShrink;
uniform 	float _ChangColorRange;
uniform 	mediump vec4 _UpChangEdgeColor;
uniform 	float _UpChangColorShrink;
uniform 	float _UpChangColorRange;
uniform 	float _ChangColorAmount;
uniform 	mediump vec4 _GradientFlowDirSpeed;
uniform 	mediump vec4 _FresnelColor;
uniform 	mediump float _FresnelSaturation;
uniform 	mediump vec4 _FresnelOffset;
uniform 	mediump float _FresnelPower;
uniform 	mediump float _FresnelIntensity;
uniform 	mediump vec4 _GlitterFlowFactory;
uniform 	mediump vec4 _GlitterColor;
uniform 	mediump float _GlitterIntensity;
uniform 	mediump float _GlitterContrast;
uniform 	mediump float _GlitterScale;
uniform 	mediump vec4 _GlitterFlowTilling;
uniform 	mediump vec4 _GlitterFlowMaskFactory;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	mediump vec4 _AnisotropicMap_ST;
uniform 	mediump float _SunShift;
uniform 	mediump float _SunShiftOffset;
uniform 	mediump float _AnisotropicMultiplier;
uniform 	mediump float _SunShift2nd;
uniform 	mediump float _SunShiftOffset2nd;
uniform 	mediump float _AnisotropicMultiplier2nd;
uniform 	mediump vec4 _DirectSpecularColor;
uniform 	mediump vec4 _DirectSpecularColor2nd;
uniform 	mediump vec4 _ChangDirectSpecularColor;
uniform 	mediump vec4 _ChangDirectSpecularColor2nd;
uniform 	mediump float _OcclusionScale;
uniform 	mediump vec4 _ShadowColor;
uniform 	mediump float _ShadowStrength;
uniform 	mediump float _MetallicMultiplier;
uniform 	mediump float _RoughnessMultiplier;
uniform 	mediump float _Crystal_UseCustomColor;
uniform 	mediump vec3 _Crystal_CustomColor_R_Color;
uniform 	mediump vec3 _Crystal_CustomColor_G_Color;
uniform 	mediump vec3 _Crystal_CustomColor_B_Color;
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
UNITY_LOCATION(0) uniform mediump samplerCube _IndirectSpecularMap;
UNITY_LOCATION(1) uniform mediump sampler2D _SpecularOcclusionLut3D;
UNITY_LOCATION(2) uniform mediump sampler2D _DfgTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _ShadowMapTexture;
UNITY_LOCATION(4) uniform mediump sampler2DShadow hlslcc_zcmp_ShadowMapTexture;
UNITY_LOCATION(5) uniform mediump sampler2D _AlbedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _AlbedoChangMap;
UNITY_LOCATION(7) uniform mediump sampler2D _MaterialParamsMap;
UNITY_LOCATION(8) uniform mediump sampler2D _NormalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _EmissiveMap;
UNITY_LOCATION(10) uniform mediump sampler2D _AnisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MergeTex01;
UNITY_LOCATION(12) uniform mediump sampler2D _MergeTex02;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(14) uniform mediump sampler2D _ShadowStrengthMap;
UNITY_LOCATION(15) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD6;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec3 u_xlat10_2;
int u_xlati2;
bool u_xlatb2;
mediump vec3 u_xlat16_3;
vec3 u_xlat4;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat10_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec3 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_18;
vec4 u_xlat19;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec2 u_xlat29;
mediump float u_xlat16_29;
bool u_xlatb29;
mediump vec3 u_xlat16_30;
float u_xlat31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_46;
float u_xlat48;
vec3 u_xlat49;
mediump float u_xlat16_58;
float u_xlat60;
mediump float u_xlat16_61;
float u_xlat68;
mediump vec2 u_xlat16_71;
float u_xlat77;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_88;
float u_xlat89;
mediump float u_xlat16_90;
float u_xlat91;
float u_xlat92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
mediump float u_xlat16_99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
float u_xlat106;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_MergeTex01, vs_TEXCOORD3.zw).x;
    u_xlat16_1.xy = vs_TEXCOORD3.zw * _GlitterFlowTilling.xy + _GlitterFlowTilling.zw;
    u_xlat29.xy = _GlitterFlowMaskFactory.yz * _Time.yy;
    u_xlat29.xy = fract(u_xlat29.xy);
    u_xlat29.xy = u_xlat29.xy + u_xlat16_1.xy;
    u_xlat16_29 = texture(_MergeTex01, u_xlat29.xy).z;
    u_xlat29.x = u_xlat16_29 + _GlitterFlowMaskFactory.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat29.x = min(max(u_xlat29.x, 0.0), 1.0);
#else
    u_xlat29.x = clamp(u_xlat29.x, 0.0, 1.0);
#endif
    u_xlat16_58 = texture(_MergeTex01, vs_TEXCOORD3.xy).w;
    u_xlat16_1.xy = vs_TEXCOORD3.xy * _ChangColorDissolveMap_ST.xy + _ChangColorDissolveMap_ST.zw;
    u_xlat16_87 = texture(_MergeTex02, u_xlat16_1.xy).x;
    u_xlat2.x = vs_TEXCOORD3.w + _ChangColorAmount;
    u_xlat2.x = u_xlat2.x + u_xlat2.x;
    u_xlat31 = u_xlat2.x * _UpChangColorShrink + u_xlat16_87;
    u_xlat16_1.x = u_xlat31 + u_xlat31;
    u_xlat60 = u_xlat16_1.x * _UpChangColorRange + (-_UpChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat31 + -0.100000001;
    u_xlat16_1.x = u_xlat16_1.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_30.x = u_xlat16_1.x * -2.0 + 3.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_30.x;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_30.x = (-u_xlat60) + 1.0;
    u_xlat16_30.xyz = u_xlat16_30.xxx * _UpChangEdgeColor.xyz;
    u_xlat87 = u_xlat2.x * _ChangColorShrink + u_xlat16_87;
    u_xlat16_3.x = u_xlat87 + u_xlat87;
    u_xlat2.x = u_xlat16_3.x * _ChangColorRange + (-_ChangColorRange);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat87 + -0.100000001;
    u_xlat16_3.x = u_xlat16_3.x * 2.5;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_3.x * -2.0 + 3.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_32.x;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_32.x = (-u_xlat2.x) + 1.0;
    u_xlat16_32.xyz = u_xlat16_32.xxx * _ChangEdgeColor.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz;
    u_xlat16_1.xyz = u_xlat16_30.xyz * u_xlat16_1.xxx + u_xlat16_32.xyz;
    u_xlat10_2.xyz = texture(_AlbedoMap, vs_TEXCOORD3.xy).xyz;
    u_xlat10_4.xyz = texture(_AlbedoChangMap, vs_TEXCOORD3.xy).xyz;
    u_xlat5.xy = _GradientFlowDirSpeed.xy * _Time.yy;
    u_xlat5.xy = fract(u_xlat5.xy);
    u_xlat5.xy = u_xlat5.xy + vs_TEXCOORD3.zw;
    u_xlat16_5.xyz = texture(_MergeTex02, u_xlat5.xy).xyz;
    u_xlat16_32.xyz = u_xlat10_2.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_32.xyz = u_xlat10_2.xyz * u_xlat16_32.xyz;
    u_xlat16_6.xyz = u_xlat10_4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat10_4.xyz * u_xlat16_6.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = u_xlat16_32.xyz * _AlbedoColor.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * _AlbedoChangColor.xyz;
    u_xlat16_7.xyz = u_xlat16_5.xyz * u_xlat16_7.xyz + (-u_xlat16_6.xyz);
    u_xlat16_6.xyz = u_xlat16_0.xxx * u_xlat16_7.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = (-u_xlat16_32.xyz) * _AlbedoColor.xyz + u_xlat16_6.xyz;
    u_xlat16_32.xyz = u_xlat16_3.xxx * u_xlat16_32.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz + u_xlat16_32.xyz;
    u_xlat16_2.xyz = texture(_MaterialParamsMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_32.xy = u_xlat16_2.xy * vec2(_RoughnessMultiplier, _MetallicMultiplier);
    u_xlat16_4.xyz = texture(_NormalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_4.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat4.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat5.xyz = u_xlat4.xyz * vs_TEXCOORD1.zxy;
    u_xlat5.xyz = vs_TEXCOORD1.yzx * u_xlat4.yzx + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat5.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat4.z;
    u_xlat9.y = u_xlat5.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat4.x;
    u_xlat10.y = u_xlat5.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat5.x = u_xlat4.y;
    u_xlat5.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_EmissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _EmissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_8.xyz = (-_DirectSpecularColor.xyz) + _ChangDirectSpecularColor.xyz;
    u_xlat16_8.xyz = u_xlat16_3.xxx * u_xlat16_8.xyz + _DirectSpecularColor.xyz;
    u_xlat16_10.xyz = texture(_ShadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_88 = u_xlat16_10.z * _ShadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb87 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat87 = (u_xlatb87) ? 1.0 : -1.0;
    u_xlat87 = u_xlat87 * vs_TEXCOORD2.w;
    u_xlat16_13.xy = vs_TEXCOORD3.xy * _AnisotropicMap_ST.xy + _AnisotropicMap_ST.zw;
    u_xlat16_2.x = texture(_AnisotropicMap, u_xlat16_13.xy).x;
    u_xlat2.x = u_xlat16_2.x * 2.0 + -1.0;
    u_xlat16_93 = dot(vec2(vec2(_AnisotropicMultiplier, _AnisotropicMultiplier)), u_xlat16_2.zz);
    u_xlat16_94 = u_xlat16_93 + -1.0;
    u_xlat16_95 = dot(vec2(vec2(_AnisotropicMultiplier2nd, _AnisotropicMultiplier2nd)), u_xlat16_2.zz);
    u_xlat16_99 = u_xlat16_95 + -1.0;
    u_xlat89 = u_xlat2.x * _SunShift + _SunShiftOffset;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat91 = dot(u_xlat4.zxy, u_xlat5.xyz);
    u_xlat4.xyz = (-u_xlat5.yzx) * vec3(u_xlat91) + u_xlat4.xyz;
    u_xlat91 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat4.xyz = vec3(u_xlat91) * u_xlat4.xyz;
    u_xlat14.xyz = u_xlat4.yzx * u_xlat5.xyz;
    u_xlat14.xyz = u_xlat5.zxy * u_xlat4.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat87) * u_xlat14.xyz;
    u_xlat16_13.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_13.x = inversesqrt(u_xlat16_13.x);
    u_xlat16_13.xyz = u_xlat16_13.xxx * vs_TEXCOORD1.yzx;
    u_xlat87 = u_xlat2.x * _SunShift2nd + _SunShiftOffset2nd;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat16_15.xyz = (-_DirectSpecularColor2nd.xyz) + _ChangDirectSpecularColor2nd.xyz;
    u_xlat16_15.xyz = u_xlat16_3.xxx * u_xlat16_15.xyz + _DirectSpecularColor2nd.xyz;
    u_xlat16_16.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_16.xyz = vec3(_OcclusionScale) * u_xlat16_16.xyz + u_xlat5.xyz;
    u_xlat16_3.x = dot(u_xlat16_16.xyz, u_xlat16_16.xyz);
    u_xlat16_3.x = inversesqrt(u_xlat16_3.x);
    u_xlat16_16.xyz = u_xlat16_3.xxx * u_xlat16_16.xyz;
    u_xlat16_3.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_3.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.x = min(max(u_xlat16_3.x, 0.0), 1.0);
#else
    u_xlat16_3.x = clamp(u_xlat16_3.x, 0.0, 1.0);
#endif
    u_xlat16_3.x = u_xlat16_3.x + -1.0;
    u_xlat16_3.x = _OcclusionScale * u_xlat16_3.x + 1.0;
    u_xlat16_100 = (-u_xlat16_2.y) * _MetallicMultiplier + 1.0;
    u_xlat16_18.xyz = u_xlat16_1.xyz * vec3(u_xlat16_100);
    u_xlat16_1.xyz = u_xlat16_1.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_32.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_61 = u_xlat16_32.x * u_xlat16_32.x;
    u_xlat16_61 = max(u_xlat16_61, 0.0078125);
    u_xlat16_100 = u_xlat16_61 * u_xlat16_61;
    u_xlat16_100 = max(u_xlat16_100, 0.0078125);
    u_xlat16_102 = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_102 * 0.5 + 0.5;
    u_xlat16_103 = (-u_xlat16_102) + u_xlat16_103;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_103 + u_xlat16_102;
    u_xlat16_102 = u_xlat16_46.z * u_xlat16_102;
    u_xlat16_102 = u_xlat16_3.x * u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlatb2 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb2 = _ShadowBias.z!=0.0;
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
    u_xlat31 = (-u_xlat31) * u_xlat31 + 1.0;
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 * _ShadowBias.z;
    u_xlat19.xyz = (-u_xlat5.xyz) * vec3(u_xlat31) + vs_TEXCOORD0.xyz;
    u_xlat19.xyz = (bool(u_xlatb2)) ? u_xlat19.xyz : vs_TEXCOORD0.xyz;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat20;
    u_xlat20 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat20;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat23;
    u_xlat21 = u_xlat19.yyyy * u_xlat21;
    u_xlat20 = u_xlat20 * u_xlat19.xxxx + u_xlat21;
    u_xlat19 = u_xlat22 * u_xlat19.zzzz + u_xlat20;
    u_xlat19 = u_xlat23 + u_xlat19;
    u_xlat2.x = _ShadowBias.x / u_xlat19.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat2.x = (-u_xlat2.x) + u_xlat19.z;
    u_xlat31 = max((-u_xlat19.w), u_xlat2.x);
    u_xlat31 = (-u_xlat2.x) + u_xlat31;
    u_xlat19.z = _ShadowBias.y * u_xlat31 + u_xlat2.x;
    u_xlat19.xyz = u_xlat19.xyz / u_xlat19.www;
    u_xlat19.xyz = u_xlat19.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat19.w = max(u_xlat19.z, 9.99999975e-05);
    u_xlat16_103 = (-_ShadowBias.w) + 1.0;
    u_xlat20.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat20.z = 0.0;
    u_xlat20.xyz = u_xlat19.xyw + u_xlat20.xyz;
    vec3 txVec0 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat20.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat20.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat19.xyz = u_xlat19.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat19.xy,u_xlat19.z);
    u_xlat20.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat2.x = dot(u_xlat20, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat31 = (-u_xlat16_103) + 1.0;
    u_xlat2.x = u_xlat2.x * u_xlat31 + u_xlat16_103;
    u_xlat2.x = (-u_xlat2.x) + 1.0;
    u_xlat2.x = (-u_xlat2.x) * u_xlat16_88 + 1.0;
    u_xlat2.x = max(u_xlat2.x, 0.0);
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat19.xyz = vec3(u_xlat31) * u_xlat19.xyz;
    u_xlat31 = dot(u_xlat5.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat5.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat91 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat91 = inversesqrt(u_xlat91);
    u_xlat22.xyz = vec3(u_xlat91) * u_xlat22.xyz;
    u_xlat91 = u_xlat16_93 * u_xlat16_61;
    u_xlat91 = max(u_xlat91, 0.00100000005);
    u_xlat92 = (-u_xlat16_94) + 1.0;
    u_xlat92 = u_xlat16_61 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.00100000005);
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xyz);
    u_xlat96 = dot(u_xlat4.zxy, u_xlat16_12.xyz);
    u_xlat16_103 = dot(u_xlat4.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat68 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat98 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat5.xyz + u_xlat14.zxy;
    u_xlat87 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat23.xyz = vec3(u_xlat87) * u_xlat23.xyz;
    u_xlat87 = u_xlat16_95 * u_xlat16_61;
    u_xlat87 = max(u_xlat87, 0.00100000005);
    u_xlat101 = (-u_xlat16_99) + 1.0;
    u_xlat101 = u_xlat16_61 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat48 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat77 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat106 = u_xlat87 * u_xlat101;
    u_xlat23.x = u_xlat16_93 * u_xlat101;
    u_xlat23.y = u_xlat87 * u_xlat19.x;
    u_xlat23.z = u_xlat31 * u_xlat106;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat107 = u_xlat106 * 0.318309873;
    u_xlat19.x = u_xlat106 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat107 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat96 * u_xlat87;
    u_xlat21.z = u_xlat101 * u_xlat48;
    u_xlat48 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat48 = sqrt(u_xlat48);
    u_xlat48 = u_xlat48 + u_xlat21.x;
    u_xlat48 = u_xlat48 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_103 * u_xlat87;
    u_xlat20.z = u_xlat101 * u_xlat77;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat20.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat48 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat101 = u_xlat91 * u_xlat92;
    u_xlat23.x = u_xlat92 * u_xlat16_93;
    u_xlat23.y = u_xlat91 * u_xlat68;
    u_xlat23.z = u_xlat31 * u_xlat101;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = max(u_xlat31, 6.10351563e-05);
    u_xlat68 = u_xlat101 * 0.318309873;
    u_xlat31 = u_xlat101 / u_xlat31;
    u_xlat31 = u_xlat31 * u_xlat31;
    u_xlat31 = u_xlat68 * u_xlat31;
    u_xlat31 = min(u_xlat31, 16.0);
    u_xlat21.y = u_xlat91 * u_xlat96;
    u_xlat21.z = u_xlat92 * u_xlat97;
    u_xlat96 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat21.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat20.y = u_xlat91 * u_xlat16_103;
    u_xlat20.z = u_xlat92 * u_xlat98;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat96 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat98 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat98 * u_xlat98;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_88 = u_xlat98 * u_xlat16_88;
    u_xlat16_93 = u_xlat98 * u_xlat16_88;
    u_xlat48 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat48 = min(max(u_xlat48, 0.0), 1.0);
#else
    u_xlat48 = clamp(u_xlat48, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_88) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat98);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_24.xyz = (-_ShadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_24.xyz = u_xlat2.xxx * u_xlat16_24.xyz + _ShadowColor.xyz;
    u_xlat16_25.xyz = u_xlat16_18.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_25.xyz = u_xlat16_24.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31 = u_xlat31 * u_xlat97;
    u_xlat23.xyz = u_xlat49.xyz * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_8.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat87 = u_xlat19.x * u_xlat87;
    u_xlat19.xzw = u_xlat49.xyz * vec3(u_xlat87);
    u_xlat19.xzw = u_xlat16_15.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat20.xxx * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat19.xzw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat19.xzw = u_xlat16_24.xyz * u_xlat19.xzw;
    u_xlat19.xzw = u_xlat23.xyz * u_xlat16_24.xyz + u_xlat19.xzw;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat49.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_88 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_15.xyz = vec3(u_xlat16_93) * u_xlat49.xyz;
    u_xlat16_24.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_26.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_24.yyy + u_xlat16_26.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_24.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_24.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_15.xyz;
    u_xlat87 = dot(u_xlat49.xyz, u_xlat49.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat49.xyz = vec3(u_xlat87) * u_xlat49.xyz;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_15.xyz, u_xlat49.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat23.x = dot(u_xlat5.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat49.xyz);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_15.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat49.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_15.xyz);
    u_xlat27.x = u_xlat92 * u_xlat16_93;
    u_xlat27.y = u_xlat31 * u_xlat91;
    u_xlat27.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat23.y = u_xlat91 * u_xlat16_95;
    u_xlat23.z = u_xlat92 * u_xlat97;
    u_xlat31 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat23.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat97 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat97 * u_xlat97;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_88 = u_xlat97 * u_xlat16_88;
    u_xlat16_93 = u_xlat97 * u_xlat16_88;
    u_xlat97 = (-u_xlat16_88) * u_xlat97 + 1.0;
    u_xlat49.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat49.xyz = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat49.xyz;
    u_xlat16_15.xyz = u_xlat16_18.xyz * u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat10.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat23.xxx * u_xlat16_15.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat49.xyz = min(max(u_xlat49.xyz, 0.0), 1.0);
#else
    u_xlat49.xyz = clamp(u_xlat49.xyz, 0.0, 1.0);
#endif
    u_xlat49.xyz = u_xlat16_8.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat23.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat16_24.xyz * u_xlat49.xyz;
    u_xlat16_24.xyz = u_xlat49.xyz * u_xlat10.xxx + u_xlat19.xzw;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat16_88 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.00100000005>=abs(u_xlat16_88));
#else
    u_xlatb87 = 0.00100000005>=abs(u_xlat16_88);
#endif
    u_xlat19.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_88 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat16_88 = max(u_xlat16_88, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_88);
    u_xlat16_25.xyz = vec3(u_xlat16_93) * u_xlat19.xzw;
    u_xlat16_26.xy = (bool(u_xlatb87)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_26.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_26.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb87 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb87) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_25.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_88 = (-u_xlat16_88) * u_xlat16_88 + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * u_xlat16_95;
    u_xlat16_88 = max(u_xlat16_26.x, u_xlat16_88);
    u_xlat16_88 = u_xlat16_93 * u_xlat16_88;
    u_xlat16_26.xyz = vec3(u_xlat16_88) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat19.xzw = u_xlat11.xyz * vec3(u_xlat16_90) + u_xlat16_25.xyz;
    u_xlat87 = dot(u_xlat19.xzw, u_xlat19.xzw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat19.xzw = vec3(u_xlat87) * u_xlat19.xzw;
    u_xlat87 = dot(u_xlat5.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_25.xyz, u_xlat19.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat5.xyz, u_xlat16_25.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(u_xlat4.zxy, u_xlat19.xzw);
    u_xlat16_95 = dot(u_xlat4.zxy, u_xlat16_25.xyz);
    u_xlat31 = dot(u_xlat22.xyz, u_xlat19.xzw);
    u_xlat10.x = dot(u_xlat22.xyz, u_xlat16_25.xyz);
    u_xlat22.x = u_xlat92 * u_xlat16_93;
    u_xlat22.y = u_xlat31 * u_xlat91;
    u_xlat22.z = u_xlat87 * u_xlat101;
    u_xlat87 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat87 = u_xlat101 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat68 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat20.y = u_xlat91 * u_xlat16_95;
    u_xlat20.z = u_xlat92 * u_xlat10.x;
    u_xlat31 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat31 = sqrt(u_xlat31);
    u_xlat31 = u_xlat31 + u_xlat20.x;
    u_xlat31 = u_xlat31 + 6.10351563e-05;
    u_xlat31 = u_xlat96 * u_xlat31 + 6.10351563e-05;
    u_xlat31 = float(1.0) / u_xlat31;
    u_xlat91 = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat91 * u_xlat91;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_88 = u_xlat91 * u_xlat16_88;
    u_xlat16_93 = u_xlat91 * u_xlat16_88;
    u_xlat91 = (-u_xlat16_88) * u_xlat91 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat91);
    u_xlat10.xzw = vec3(u_xlat48) * vec3(u_xlat16_93) + u_xlat10.xzw;
    u_xlat16_25.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_25.xyz = u_xlat10.yyy * u_xlat16_25.xyz;
    u_xlat87 = u_xlat87 * u_xlat31;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_8.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat20.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_26.xyz * u_xlat10.xzw;
    u_xlat16_8.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_24.xyz;
    u_xlat16_15.xyz = u_xlat16_25.xyz * u_xlat20.xxx + u_xlat16_15.xyz;
    u_xlat87 = u_xlat2.x + -1.0;
    u_xlat2.xy = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * vec2(u_xlat87) + vec2(1.0, 1.0);
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_16.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_16.xz);
    u_xlat16_24.y = u_xlat16_16.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_24.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat2.xy = min(vec2(u_xlat16_102), u_xlat2.xy);
    u_xlat2.x = min(u_xlat2.x, u_xlat16_2.z);
    u_xlat16_25.xyz = u_xlat16_18.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat2.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat2.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat2.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_18.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat2.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_3.xxx * u_xlat16_24.xyz;
    u_xlati2 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati2].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_26.xyz;
    u_xlati87 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_24.xyw;
    u_xlat16_26.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_26.xyz;
    u_xlat10.xyz = vec3(u_xlat89) * u_xlat16_13.xyz + u_xlat14.xyz;
    u_xlat87 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat10.xyz = vec3(u_xlat87) * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_94>=0.0);
#else
    u_xlatb87 = u_xlat16_94>=0.0;
#endif
    u_xlat4.xyz = (bool(u_xlatb87)) ? u_xlat10.xyz : u_xlat4.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat4.xyz * u_xlat10.xyz;
    u_xlat4.xyz = u_xlat10.zxy * u_xlat4.yzx + (-u_xlat14.xyz);
    u_xlat16_88 = u_xlat16_61 * 8.0;
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_88 = u_xlat16_88 * abs(u_xlat16_94);
    u_xlat4.xyz = (-u_xlat9.xyz) * u_xlat0.xxx + u_xlat4.xyz;
    u_xlat4.xyz = vec3(u_xlat16_88) * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat87 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat4.xyz = vec3(u_xlat87) * u_xlat4.xyz;
    u_xlat16_88 = dot((-u_xlat16_12.xyz), u_xlat4.xyz);
    u_xlat16_88 = u_xlat16_88 + u_xlat16_88;
    u_xlat4.xyz = (-u_xlat4.xyz) * vec3(u_xlat16_88) + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * u_xlat0.xxx + (-u_xlat4.xyz);
    u_xlat9.xyz = vec3(u_xlat16_100) * u_xlat9.xyz + u_xlat4.xyz;
    u_xlat10.xyz = u_xlat4.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(u_xlat16_94)) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_88 = -abs(u_xlat16_94) * 0.800000012 + 1.0;
    u_xlat16_88 = u_xlat16_32.x * u_xlat16_88;
    u_xlat16_88 = u_xlat16_88 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_88);
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat4.xyz);
    u_xlat16_46.x = u_xlat16_32.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_13.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_13.xyz = min(max(u_xlat16_13.xyz, 0.0), 1.0);
#else
    u_xlat16_13.xyz = clamp(u_xlat16_13.xyz, 0.0, 1.0);
#endif
    u_xlat16_4.yzw = u_xlat16_13.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_61 = floor(u_xlat16_4.w);
    u_xlat16_93 = u_xlat16_61 + 1.0;
    u_xlat16_93 = min(u_xlat16_93, 15.0);
    u_xlat16_94 = u_xlat16_13.z * 15.0 + (-u_xlat16_61);
    u_xlat16_4.x = u_xlat16_61 * 16.0 + u_xlat16_4.y;
    u_xlat16_13.x = u_xlat16_93 * 16.0 + u_xlat16_4.y;
    u_xlat16_71.xy = u_xlat16_4.xz + vec2(0.5, 0.5);
    u_xlat16_71.xy = u_xlat16_71.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_71.xy).x;
    u_xlat16_13.y = u_xlat16_4.z;
    u_xlat16_13.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_13.xy = u_xlat16_13.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_13.xy).x;
    u_xlat16_61 = (-u_xlat16_0.x) + u_xlat16_87;
    u_xlat16_61 = u_xlat16_94 * u_xlat16_61 + u_xlat16_0.x;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_61;
    u_xlat0.x = dot(u_xlat16_16.xyz, u_xlat5.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat2.y * 0.5;
    u_xlat16_61 = (-u_xlat2.y) * 0.5 + 1.0;
    u_xlat16_3.x = u_xlat0.x * u_xlat16_61 + u_xlat16_3.x;
    u_xlat16_61 = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat16_93 = (-u_xlat16_3.x) * 2.0 + 1.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_93 + u_xlat16_61;
    u_xlat16_3.x = u_xlat2.y * u_xlat16_3.x;
    u_xlat16_3.x = min(u_xlat16_2.z, u_xlat16_3.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_88);
    u_xlat16_13.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat2.xyz = u_xlat16_13.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_13.xyz = u_xlat2.xyz * u_xlat2.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_16.xyz = vec3(u_xlat16_88) * u_xlat16_13.xyz;
    u_xlat16_13.xyz = (bool(u_xlatb0)) ? u_xlat16_16.xyz : u_xlat16_13.xyz;
    u_xlat21.y = u_xlat16_32.x;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_1.xyz = u_xlat16_13.xyz * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_8.xyz = u_xlat16_8.xyz + u_xlat16_15.xyz;
    u_xlat16_8.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_8.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
    u_xlat0.x = dot(vs_TEXCOORD1.xyz, vs_TEXCOORD1.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat2.xyz = u_xlat0.xxx * vs_TEXCOORD1.xyz;
    u_xlat5.xy = u_xlat11.xy * vec2(u_xlat16_90) + _FresnelOffset.xy;
    u_xlat5.z = u_xlat16_12.z;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat0.x = dot(u_xlat2.xyz, u_xlat5.xyz);
    u_xlat16_88 = (-u_xlat0.x) + 1.0;
    u_xlat16_88 = max(u_xlat16_88, 0.00100000005);
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _FresnelPower;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_3.x = max(_FresnelIntensity, 0.0);
    u_xlat16_88 = u_xlat16_88 * u_xlat16_3.x;
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _FresnelColor.xyz;
    u_xlat16_6.xyz = vec3(u_xlat16_58) * u_xlat16_3.xyz;
    u_xlat0.x = dot(u_xlat16_6.xyz, vec3(0.212599993, 0.715200007, 0.0722000003));
    u_xlat2.xyz = u_xlat16_3.xyz * vec3(u_xlat16_58) + (-u_xlat0.xxx);
    u_xlat0.xzw = vec3(_FresnelSaturation) * u_xlat2.xyz + u_xlat0.xxx;
    u_xlat16_1.xyz = u_xlat0.xzw + u_xlat16_1.xyz;
    u_xlat0.xz = _GlitterFlowFactory.xy * _Time.xx;
    u_xlat0.xz = fract(u_xlat0.xz);
    u_xlat0.xz = u_xlat0.xz + vs_TEXCOORD3.zw;
    u_xlat2.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat2.y = dot(vs_TEXCOORD6.xyz, u_xlat16_12.xyz);
    u_xlat16_3.xy = u_xlat0.xz * vec2(1.5, 1.5);
    u_xlat16_3.xy = u_xlat16_3.xy * vec2(vec2(_GlitterScale, _GlitterScale));
    u_xlat16_87 = texture(_MergeTex01, u_xlat16_3.xy).y;
    u_xlat2.xy = u_xlat2.xy * vec2(-0.0500000007, -0.0500000007) + u_xlat0.xz;
    u_xlat2.xy = u_xlat2.xy + vec2(-0.5, -0.5);
    u_xlat5.x = dot(vec2(-0.999998748, 0.00159265287), u_xlat2.xy);
    u_xlat5.y = dot(vec2(-0.00159265287, -0.999998748), u_xlat2.xy);
    u_xlat2.xy = u_xlat5.xy + vec2(0.5, 0.5);
    u_xlat16_88 = _GlitterScale * 0.681690156;
    u_xlat2.xy = vec2(u_xlat16_88) * u_xlat2.xy;
    u_xlat16_2.x = texture(_MergeTex01, u_xlat2.xy).y;
    u_xlat16_88 = u_xlat16_87 * u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat16_88 = u_xlat16_88 * _GlitterIntensity;
    u_xlat16_88 = log2(u_xlat16_88);
    u_xlat16_88 = u_xlat16_88 * _GlitterContrast;
    u_xlat16_88 = exp2(u_xlat16_88);
    u_xlat16_88 = min(u_xlat16_88, 1.0);
    u_xlat16_3.xyz = vec3(u_xlat16_88) * _GlitterColor.xyz;
    u_xlat16_1.xyz = u_xlat16_3.xyz * u_xlat29.xxx + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_88 = (u_xlatb29) ? 1.0 : 0.0;
    u_xlat16_3.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_3.xy = u_xlat0.xz * vec2(u_xlat16_88) + u_xlat16_3.xy;
    u_xlat16_3.xy = u_xlat16_3.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = _FlowLightFactory.yz * _Time.yy;
    u_xlat0.xy = fract(u_xlat0.xy);
    u_xlat0.xy = u_xlat0.xy + u_xlat16_3.xy;
    u_xlat16_0.x = texture(_FlowLightTex, u_xlat0.xy).x;
    u_xlat16_3.xyz = u_xlat16_0.xxx * _FlowLightColor.xyz;
    u_xlat16_88 = max(_FlowLightFactory.x, 0.0);
    u_xlat16_1.xyz = u_xlat16_3.xyz * vec3(u_xlat16_88) + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_88 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_6.xyz + u_xlat16_3.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_6.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 91773
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_GradientFlowHair_ColorChangGUI"
}