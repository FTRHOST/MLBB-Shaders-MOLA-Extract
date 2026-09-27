//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic MultiSpecular)_DoubleFlowLight_Glitter_DetailNormal" {
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

[Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

_anisotropicMask ("R:扰动遮罩 h:高光遮罩", 2D) = "white" { }

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

_detailNormal ("细节法线", 2D) = "bump" { }

_detailNormalStrength ("细节法线强度", Range(0, 1)) = 0.0

[Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_directSpecularColor2nd ("direct specular color1nd", Color) = (1,1,1,1)

[Toggle] _anisoUse2U ("各向异性使用2U", Float) = 0.0

_anisotropicMap ("各向异性扰动贴图", 2D) = "white" { }

_sunShift ("主要各向异性扭曲", Float) = 1.0

_sunShiftOffset ("主要各向异性偏移", Float) = 1.0

_anisotropicMultiplier ("主要各项异性强度", Range(0, 1)) = 1.0

_sunShift2nd ("次要各向异性扭曲", Float) = 1.0

_sunShiftOffset2nd ("次要各向异性偏移", Float) = 1.0

_anisotropicMultiplier2nd ("次要各项异性强度", Range(0, 1)) = 1.0

_MaskTex ("闪点流光遮罩贴图", 2D) = "white" { }

_USE_GLITTER ("闪点开关", Float) = 0.0

_GlitterColor ("闪点颜色", Color) = (0,0,0,1)

_GlitterIntensity ("闪点强度", Range(0, 10)) = 1.0

_GlitterContrast ("闪点对比度", Range(0, 50)) = 1.0

_GlitterScale ("闪点缩放值", Range(0, 100)) = 1.0

_USE_DOUBLE_FLOWLIGHT ("双层流光开关", Float) = 0.0

_UseFlowLight2U ("流光使用2U", Float) = 0.0

_FlowLightUpTex ("流光上层纹理", 2D) = "black" { }

_FlowLightUpColor ("流光上层颜色", Color) = (1,1,1,1)

_FlowLightDownTex ("流光下层纹理", 2D) = "black" { }

_FlowLightDownColor ("流光下层颜色", Color) = (1,1,1,1)

_FlowLightDownDepth ("流光下层深度", Range(0, 1)) = 1.0

_FlowLightUpFactory ("流光上层参数", Vector) = (1,1,1,1)

_FlowLightDownFactory ("流光下层参数", Vector) = (1,1,1,1)

_indirectSpecularIntensityScale ("间接光高光强度和缩放", Vector) = (1,1,1,1)

_localDiffuseGI ("本地反射GI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrengthMap ("shadowStrengthMap", 2D) = "white" { }

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

[Toggle] _Crystal_UseCustomColor ("Use Custom Color", Float) = 0.0

_Crystal_CustomColorMask ("Custom Color Mask", 2D) = "black" { }

_Crystal_CustomColor_R_Color ("R Color", Color) = (1,1,1,1)

_Crystal_CustomColor_G_Color ("G Color", Color) = (1,1,1,1)

_Crystal_CustomColor_B_Color ("B Color", Color) = (1,1,1,1)

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 Cull Off
  GpuProgramID 51602
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_46;
float u_xlat47;
vec3 u_xlat48;
vec2 u_xlat56;
mediump vec2 u_xlat16_56;
int u_xlati56;
mediump vec2 u_xlat16_60;
mediump float u_xlat16_62;
float u_xlat75;
float u_xlat85;
mediump float u_xlat16_86;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
float u_xlat93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
float u_xlat103;
float u_xlat104;
float u_xlat105;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_86 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_28.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat28.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_28.xyz = texture(_detailNormal, u_xlat28.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat28.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat1.xyz;
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat28.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat28.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat28.xyz, u_xlat9.xyz);
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat9.xyz = u_xlat28.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_56.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_62 = u_xlat16_89 + -1.0;
    u_xlat16_90 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat93 = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat93 = u_xlat93 + vs_TEXCOORD5;
    u_xlat94 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat94) + u_xlat1.xyz;
    u_xlat94 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat94 = inversesqrt(u_xlat94);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat94);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat3.x = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat28.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_92 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * u_xlat16_17.xyz;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_92 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 + -1.0;
    u_xlat16_92 = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_60.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_60.x * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_60.x) + u_xlat16_34.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_34.x + u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_92 * u_xlat16_60.x;
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat19.xyz = u_xlat0.xxx * u_xlat19.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat93) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat31 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat22.xyz = vec3(u_xlat31) * u_xlat22.xyz;
    u_xlat3.y = u_xlat16_89 * u_xlat16_4.x;
    u_xlat87 = (-u_xlat16_62) + 1.0;
    u_xlat3.w = u_xlat87 * u_xlat16_4.x;
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat19.xyz);
    u_xlat94 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat103 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat3.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat23.xyz;
    u_xlat3.x = u_xlat16_90 * u_xlat16_4.x;
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat104 = (-u_xlat16_91) + 1.0;
    u_xlat104 = u_xlat16_4.x * u_xlat104;
    u_xlat104 = max(u_xlat104, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat47 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat75 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat105 = u_xlat3.x * u_xlat104;
    u_xlat23.x = u_xlat16_89 * u_xlat104;
    u_xlat23.y = u_xlat3.x * u_xlat19.x;
    u_xlat23.z = u_xlat0.x * u_xlat105;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat106 = u_xlat105 * 0.318309873;
    u_xlat19.x = u_xlat105 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat106 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.x;
    u_xlat21.z = u_xlat47 * u_xlat104;
    u_xlat47 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat21.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.x;
    u_xlat20.z = u_xlat75 * u_xlat104;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat20.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat47 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat47 = u_xlat3.w * u_xlat3.y;
    u_xlat23.x = u_xlat16_89 * u_xlat3.w;
    u_xlat23.y = u_xlat95 * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat95 = u_xlat47 * 0.318309873;
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.y;
    u_xlat21.z = u_xlat97 * u_xlat3.w;
    u_xlat94 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat21.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.y;
    u_xlat20.z = u_xlat103 * u_xlat3.w;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat75 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_89 = u_xlat75 * u_xlat75;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_34.x = u_xlat75 * u_xlat16_89;
    u_xlat103 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat103 = min(max(u_xlat103, 0.0), 1.0);
#else
    u_xlat103 = clamp(u_xlat103, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_89) * u_xlat75 + 1.0;
    u_xlat48.xyz = u_xlat16_2.xyz * vec3(u_xlat75);
    u_xlat48.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat48.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat97;
    u_xlat23.xyz = u_xlat48.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat0.x = u_xlat19.x * u_xlat3.x;
    u_xlat48.xyz = u_xlat48.xyz * u_xlat0.xxx;
    u_xlat48.xyz = u_xlat16_16.xyz * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat20.xxx * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat48.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat48.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat48.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_89 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat16_34.xxx * u_xlat23.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_34.zzz + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_25.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat56.xy = u_xlat16_56.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat56.xy = min(max(u_xlat56.xy, 0.0), 1.0);
#else
    u_xlat56.xy = clamp(u_xlat56.xy, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_16.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat23.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat23.xyz);
    u_xlat16_90 = dot(u_xlat1.zxy, u_xlat16_16.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat23.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_16.xyz);
    u_xlat23.x = u_xlat3.w * u_xlat16_34.x;
    u_xlat23.y = u_xlat3.x * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat26.y = u_xlat3.y * u_xlat16_90;
    u_xlat26.z = u_xlat3.w * u_xlat97;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat26.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat94 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat97 = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat97 * u_xlat97;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_34.x = u_xlat97 * u_xlat16_89;
    u_xlat97 = (-u_xlat16_89) * u_xlat97 + 1.0;
    u_xlat23.xyz = u_xlat16_2.xyz * vec3(u_xlat97);
    u_xlat23.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat23.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat56.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat26.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_25.xyz * u_xlat23.xyz;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat56.xxx + u_xlat48.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_24.xyz = u_xlat16_34.xxx * u_xlat20.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_34.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_27.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat16_24.xyz);
    u_xlat56.x = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat16_24.xyz);
    u_xlat11.x = u_xlat3.w * u_xlat16_89;
    u_xlat11.y = u_xlat56.x * u_xlat3.y;
    u_xlat11.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat3.y * u_xlat16_34.x;
    u_xlat20.z = u_xlat3.x * u_xlat3.w;
    u_xlat56.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56.x = sqrt(u_xlat56.x);
    u_xlat56.x = u_xlat56.x + u_xlat20.x;
    u_xlat56.x = u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = u_xlat94 * u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = float(1.0) / u_xlat56.x;
    u_xlat3.x = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat3.x * u_xlat3.x;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_89 = u_xlat3.x * u_xlat16_88;
    u_xlat3.x = (-u_xlat16_88) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_2.xyz * u_xlat3.xxx;
    u_xlat3.xyw = vec3(u_xlat103) * vec3(u_xlat16_89) + u_xlat3.xyw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat56.yyy * u_xlat16_24.xyz;
    u_xlat0.x = u_xlat56.x * u_xlat0.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat16_15.xyz * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat20.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_27.xyz * u_xlat3.xyw;
    u_xlat16_15.xyz = u_xlat3.xyw * u_xlat56.yyy + u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_24.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat3.x = min(u_xlat16_60.x, 1.0);
    u_xlat31 = min(u_xlat3.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat31) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_27.xyz * vec3(u_xlat31) + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_92) * u_xlat16_24.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_27.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_27.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyw;
    u_xlat16_27.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat0.xzw = vec3(u_xlat93) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat31 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat16_62>=0.0);
#else
    u_xlatb31 = u_xlat16_62>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb31)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_62);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat28.xxx + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_4.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat28.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = u_xlat16_32.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_4.x = -abs(u_xlat16_62) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_0.w);
    u_xlat16_60.x = u_xlat16_32.x + 1.0;
    u_xlat16_60.x = min(u_xlat16_60.x, 15.0);
    u_xlat16_88 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_60.x * 16.0 + u_xlat16_0.y;
    u_xlat16_32.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_31) + u_xlat16_87;
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x + u_xlat16_31;
    u_xlat16_32.x = u_xlat16_92 * u_xlat16_32.x;
    u_xlat31 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat31 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat3.x * 0.5;
    u_xlat16_60.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat31 * u_xlat16_60.x + u_xlat16_32.x;
    u_xlat16_60.x = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_88 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_88 + u_xlat16_60.x;
    u_xlat16_32.x = u_xlat3.x * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_32.x);
    u_xlat16_60.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_60.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_89 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_34.xyz = u_xlat16_4.xzw * vec3(u_xlat16_89);
    u_xlat16_4.xzw = (bool(u_xlatb1)) ? u_xlat16_34.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_15.xyz;
    u_xlat16_88 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_1.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_88 : u_xlat16_86;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_60.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_60.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_86 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_86) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_86 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat85 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat85 * 0.0625 + u_xlat0.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat85);
    u_xlat29.xyz = (-u_xlat16_3.xyz) + u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat29.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_46;
float u_xlat47;
vec3 u_xlat48;
vec2 u_xlat56;
mediump vec2 u_xlat16_56;
int u_xlati56;
mediump vec2 u_xlat16_60;
mediump float u_xlat16_62;
float u_xlat75;
float u_xlat85;
mediump float u_xlat16_86;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
float u_xlat93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
float u_xlat103;
float u_xlat104;
float u_xlat105;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_86 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_28.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat28.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_28.xyz = texture(_detailNormal, u_xlat28.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat28.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat1.xyz;
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat28.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat28.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat28.xyz, u_xlat9.xyz);
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat9.xyz = u_xlat28.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_56.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_62 = u_xlat16_89 + -1.0;
    u_xlat16_90 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat93 = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat93 = u_xlat93 + vs_TEXCOORD5;
    u_xlat94 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat94) + u_xlat1.xyz;
    u_xlat94 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat94 = inversesqrt(u_xlat94);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat94);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat3.x = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat28.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_92 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * u_xlat16_17.xyz;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_92 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 + -1.0;
    u_xlat16_92 = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_60.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_60.x * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_60.x) + u_xlat16_34.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_34.x + u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_92 * u_xlat16_60.x;
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat19.xyz = u_xlat0.xxx * u_xlat19.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat93) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat31 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat22.xyz = vec3(u_xlat31) * u_xlat22.xyz;
    u_xlat3.y = u_xlat16_89 * u_xlat16_4.x;
    u_xlat87 = (-u_xlat16_62) + 1.0;
    u_xlat3.w = u_xlat87 * u_xlat16_4.x;
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat19.xyz);
    u_xlat94 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat103 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat3.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat23.xyz;
    u_xlat3.x = u_xlat16_90 * u_xlat16_4.x;
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat104 = (-u_xlat16_91) + 1.0;
    u_xlat104 = u_xlat16_4.x * u_xlat104;
    u_xlat104 = max(u_xlat104, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat47 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat75 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat105 = u_xlat3.x * u_xlat104;
    u_xlat23.x = u_xlat16_89 * u_xlat104;
    u_xlat23.y = u_xlat3.x * u_xlat19.x;
    u_xlat23.z = u_xlat0.x * u_xlat105;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat106 = u_xlat105 * 0.318309873;
    u_xlat19.x = u_xlat105 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat106 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.x;
    u_xlat21.z = u_xlat47 * u_xlat104;
    u_xlat47 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat21.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.x;
    u_xlat20.z = u_xlat75 * u_xlat104;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat20.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat47 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat47 = u_xlat3.w * u_xlat3.y;
    u_xlat23.x = u_xlat16_89 * u_xlat3.w;
    u_xlat23.y = u_xlat95 * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat95 = u_xlat47 * 0.318309873;
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.y;
    u_xlat21.z = u_xlat97 * u_xlat3.w;
    u_xlat94 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat21.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.y;
    u_xlat20.z = u_xlat103 * u_xlat3.w;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat75 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_89 = u_xlat75 * u_xlat75;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_34.x = u_xlat75 * u_xlat16_89;
    u_xlat103 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat103 = min(max(u_xlat103, 0.0), 1.0);
#else
    u_xlat103 = clamp(u_xlat103, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_89) * u_xlat75 + 1.0;
    u_xlat48.xyz = u_xlat16_2.xyz * vec3(u_xlat75);
    u_xlat48.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat48.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat97;
    u_xlat23.xyz = u_xlat48.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat0.x = u_xlat19.x * u_xlat3.x;
    u_xlat48.xyz = u_xlat48.xyz * u_xlat0.xxx;
    u_xlat48.xyz = u_xlat16_16.xyz * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat20.xxx * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat48.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat48.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat48.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_89 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat16_34.xxx * u_xlat23.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_34.zzz + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_25.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat56.xy = u_xlat16_56.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat56.xy = min(max(u_xlat56.xy, 0.0), 1.0);
#else
    u_xlat56.xy = clamp(u_xlat56.xy, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_16.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat23.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat23.xyz);
    u_xlat16_90 = dot(u_xlat1.zxy, u_xlat16_16.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat23.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_16.xyz);
    u_xlat23.x = u_xlat3.w * u_xlat16_34.x;
    u_xlat23.y = u_xlat3.x * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat26.y = u_xlat3.y * u_xlat16_90;
    u_xlat26.z = u_xlat3.w * u_xlat97;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat26.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat94 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat97 = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat97 * u_xlat97;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_34.x = u_xlat97 * u_xlat16_89;
    u_xlat97 = (-u_xlat16_89) * u_xlat97 + 1.0;
    u_xlat23.xyz = u_xlat16_2.xyz * vec3(u_xlat97);
    u_xlat23.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat23.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat56.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat26.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_25.xyz * u_xlat23.xyz;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat56.xxx + u_xlat48.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_24.xyz = u_xlat16_34.xxx * u_xlat20.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_34.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_27.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat16_24.xyz);
    u_xlat56.x = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat16_24.xyz);
    u_xlat11.x = u_xlat3.w * u_xlat16_89;
    u_xlat11.y = u_xlat56.x * u_xlat3.y;
    u_xlat11.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat3.y * u_xlat16_34.x;
    u_xlat20.z = u_xlat3.x * u_xlat3.w;
    u_xlat56.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56.x = sqrt(u_xlat56.x);
    u_xlat56.x = u_xlat56.x + u_xlat20.x;
    u_xlat56.x = u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = u_xlat94 * u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = float(1.0) / u_xlat56.x;
    u_xlat3.x = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat3.x * u_xlat3.x;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_89 = u_xlat3.x * u_xlat16_88;
    u_xlat3.x = (-u_xlat16_88) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_2.xyz * u_xlat3.xxx;
    u_xlat3.xyw = vec3(u_xlat103) * vec3(u_xlat16_89) + u_xlat3.xyw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat56.yyy * u_xlat16_24.xyz;
    u_xlat0.x = u_xlat56.x * u_xlat0.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat16_15.xyz * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat20.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_27.xyz * u_xlat3.xyw;
    u_xlat16_15.xyz = u_xlat3.xyw * u_xlat56.yyy + u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_24.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat3.x = min(u_xlat16_60.x, 1.0);
    u_xlat31 = min(u_xlat3.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat31) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_27.xyz * vec3(u_xlat31) + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_92) * u_xlat16_24.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_27.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_27.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyw;
    u_xlat16_27.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat0.xzw = vec3(u_xlat93) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat31 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat16_62>=0.0);
#else
    u_xlatb31 = u_xlat16_62>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb31)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_62);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat28.xxx + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_4.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat28.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = u_xlat16_32.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_4.x = -abs(u_xlat16_62) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_0.w);
    u_xlat16_60.x = u_xlat16_32.x + 1.0;
    u_xlat16_60.x = min(u_xlat16_60.x, 15.0);
    u_xlat16_88 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_60.x * 16.0 + u_xlat16_0.y;
    u_xlat16_32.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_31) + u_xlat16_87;
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x + u_xlat16_31;
    u_xlat16_32.x = u_xlat16_92 * u_xlat16_32.x;
    u_xlat31 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat31 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat3.x * 0.5;
    u_xlat16_60.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat31 * u_xlat16_60.x + u_xlat16_32.x;
    u_xlat16_60.x = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_88 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_88 + u_xlat16_60.x;
    u_xlat16_32.x = u_xlat3.x * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_32.x);
    u_xlat16_60.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_60.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_89 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_34.xyz = u_xlat16_4.xzw * vec3(u_xlat16_89);
    u_xlat16_4.xzw = (bool(u_xlatb1)) ? u_xlat16_34.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_15.xyz;
    u_xlat16_88 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_1.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_88 : u_xlat16_86;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_60.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_60.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_86 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_86) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_86 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat85 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat85 * 0.0625 + u_xlat0.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat85);
    u_xlat29.xyz = (-u_xlat16_3.xyz) + u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat29.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(16) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
mediump float u_xlat16_30;
vec3 u_xlat32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_48;
vec3 u_xlat49;
vec3 u_xlat50;
float u_xlat58;
bool u_xlatb58;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_64;
float u_xlat69;
float u_xlat78;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_89 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_29.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat29.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_29.xyz = texture(_detailNormal, u_xlat29.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat29.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat29.xyz = u_xlat29.xxx * u_xlat1.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_91) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat29.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat29.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat29.xyz, u_xlat9.xyz);
    u_xlat29.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 1.17549435e-38);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat9.xyz = u_xlat29.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_91 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_92 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_13.xyz = vec3(u_xlat16_92) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb58 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat58 = (u_xlatb58) ? 1.0 : -1.0;
    u_xlat58 = u_xlat58 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_93 = u_xlat16_64 + -1.0;
    u_xlat16_94 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_95 = u_xlat16_94 + -1.0;
    u_xlat3.x = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat90 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat90) + u_xlat1.xyz;
    u_xlat90 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat90);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_100 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_15.xyz = vec3(u_xlat16_100) * vs_TEXCOORD1.yzx;
    u_xlat58 = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat58 = u_xlat58 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_100 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_18.xyz = vec3(u_xlat16_100) * u_xlat16_18.xyz;
    u_xlat16_100 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_100 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_100 = min(max(u_xlat16_100, 0.0), 1.0);
#else
    u_xlat16_100 = clamp(u_xlat16_100, 0.0, 1.0);
#endif
    u_xlat16_100 = u_xlat16_100 + -1.0;
    u_xlat16_100 = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_102 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_102);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_33.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_62.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62.x = min(max(u_xlat16_62.x, 0.0), 1.0);
#else
    u_xlat16_62.x = clamp(u_xlat16_62.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_62.x * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_62.x) + u_xlat16_35.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_35.x + u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_100 * u_xlat16_62.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat87 = (-u_xlat87) * u_xlat87 + 1.0;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat87) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat87 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat87 = (-u_xlat0.x) + u_xlat87;
    u_xlat20.z = _ShadowBias.y * u_xlat87 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat87 = (-u_xlat16_35.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat87 + u_xlat16_35.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_91 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat20.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat32.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat23.xyz = u_xlat32.xxx * u_xlat23.xyz;
    u_xlat32.x = u_xlat16_64 * u_xlat16_4.x;
    u_xlat90 = (-u_xlat16_93) + 1.0;
    u_xlat32.z = u_xlat90 * u_xlat16_4.x;
    u_xlat32.xz = max(u_xlat32.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat20.xyz);
    u_xlat96 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat23.xyz, u_xlat20.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_13.xyz);
    u_xlat98 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat58 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat24.xyz;
    u_xlat58 = u_xlat16_94 * u_xlat16_4.x;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat99 = (-u_xlat16_95) + 1.0;
    u_xlat99 = u_xlat16_4.x * u_xlat99;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat101 = dot(u_xlat24.xyz, u_xlat20.xyz);
    u_xlat20.x = dot(u_xlat24.xyz, u_xlat16_13.xyz);
    u_xlat49.x = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat78 = u_xlat58 * u_xlat99;
    u_xlat24.x = u_xlat16_35.x * u_xlat99;
    u_xlat24.y = u_xlat58 * u_xlat101;
    u_xlat24.z = u_xlat87 * u_xlat78;
    u_xlat101 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat107 = u_xlat78 * 0.318309873;
    u_xlat101 = u_xlat78 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat107 * u_xlat101;
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat96 * u_xlat58;
    u_xlat22.z = u_xlat99 * u_xlat20.x;
    u_xlat20.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat22.x;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_64 * u_xlat58;
    u_xlat21.z = u_xlat99 * u_xlat49.x;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat21.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat20.x * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat99 = u_xlat32.z * u_xlat32.x;
    u_xlat20.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat20.y = u_xlat32.x * u_xlat97;
    u_xlat20.z = u_xlat87 * u_xlat99;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat97 = u_xlat99 * 0.318309873;
    u_xlat87 = u_xlat99 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat97 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat22.y = u_xlat32.x * u_xlat96;
    u_xlat22.z = u_xlat32.z * u_xlat69;
    u_xlat96 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat22.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat21.y = u_xlat32.x * u_xlat16_64;
    u_xlat21.z = u_xlat32.z * u_xlat98;
    u_xlat69 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat21.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat96 * u_xlat69 + 6.10351563e-05;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat98 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat98 * u_xlat98;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_35.x = u_xlat98 * u_xlat16_91;
    u_xlat20.x = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_91) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_2.xyz * vec3(u_xlat98);
    u_xlat49.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat49.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat87 = u_xlat87 * u_xlat69;
    u_xlat50.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat21.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat50.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat58 = u_xlat101 * u_xlat58;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat58);
    u_xlat49.xyz = u_xlat16_17.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat21.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat49.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat49.xyz = u_xlat16_25.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat50.xyz * u_xlat16_25.xyz + u_xlat49.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat50.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_35.x = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = u_xlat16_35.xxx * u_xlat50.xyz;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_91 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_25.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_17.xyz;
    u_xlat58 = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat50.xyz = vec3(u_xlat58) * u_xlat50.xyz;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat50.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, u_xlat16_17.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat50.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat27.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat27.y = u_xlat87 * u_xlat32.x;
    u_xlat27.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat24.y = u_xlat32.x * u_xlat16_64;
    u_xlat24.z = u_xlat32.z * u_xlat69;
    u_xlat87 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat0.w = u_xlat87 + u_xlat24.x;
    u_xlat0.xw = u_xlat0.xw + vec2(-1.0, 6.10351563e-05);
    u_xlat87 = u_xlat96 * u_xlat0.w + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat69 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat69 * u_xlat69;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_35.x = u_xlat69 * u_xlat16_91;
    u_xlat69 = (-u_xlat16_91) * u_xlat69 + 1.0;
    u_xlat50.xyz = u_xlat16_2.xyz * vec3(u_xlat69);
    u_xlat50.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat50.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat50.xyz = u_xlat50.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat24.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat16_25.xyz * u_xlat50.xyz;
    u_xlat16_25.xyz = u_xlat50.xyz * u_xlat11.xxx + u_xlat49.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_91);
    u_xlat16_26.xyz = u_xlat16_35.xxx * u_xlat11.xzw;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_35.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_26.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_28.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xzw = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_26.xyz;
    u_xlat58 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xzw = vec3(u_xlat58) * u_xlat11.xzw;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_26.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat1.zxy, u_xlat11.xzw);
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat16_26.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat11.xzw);
    u_xlat11.x = dot(u_xlat23.xyz, u_xlat16_26.xyz);
    u_xlat21.x = u_xlat32.z * u_xlat16_92;
    u_xlat21.y = u_xlat87 * u_xlat32.x;
    u_xlat21.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat12.y = u_xlat32.x * u_xlat16_35.x;
    u_xlat12.z = u_xlat32.z * u_xlat11.x;
    u_xlat87 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat12.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat96 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat32.x = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat32.x * u_xlat32.x;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_92 = u_xlat32.x * u_xlat16_91;
    u_xlat32.x = (-u_xlat16_91) * u_xlat32.x + 1.0;
    u_xlat11.xzw = u_xlat16_2.xyz * u_xlat32.xxx;
    u_xlat11.xzw = u_xlat20.xxx * vec3(u_xlat16_92) + u_xlat11.xzw;
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_26.xyz = u_xlat11.yyy * u_xlat16_26.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat11.xzw = u_xlat11.xzw * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xzw = min(max(u_xlat11.xzw, 0.0), 1.0);
#else
    u_xlat11.xzw = clamp(u_xlat11.xzw, 0.0, 1.0);
#endif
    u_xlat11.xzw = u_xlat16_16.xyz * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat12.xxx * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat16_28.xyz * u_xlat11.xzw;
    u_xlat16_16.xyz = u_xlat11.xzw * u_xlat11.yyy + u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_25.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_62.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_28.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_100) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_28.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyw;
    u_xlat16_28.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb0 = u_xlat16_93>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_93);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat29.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_33.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_93)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_48.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_48.y = u_xlat1.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_62.x = u_xlat16_33.x + 1.0;
    u_xlat16_62.x = min(u_xlat16_62.x, 15.0);
    u_xlat16_91 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_62.x * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_1.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_91 * u_xlat16_33.x + u_xlat16_1.x;
    u_xlat16_33.x = u_xlat16_100 * u_xlat16_33.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat0.z * 0.5;
    u_xlat16_62.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat1.x * u_xlat16_62.x + u_xlat16_33.x;
    u_xlat16_62.x = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_91 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_91 + u_xlat16_62.x;
    u_xlat16_33.x = u_xlat0.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_3.z, u_xlat16_33.x);
    u_xlat16_62.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_62.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_92 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_4.xzw * vec3(u_xlat16_92);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_4.xzw;
    u_xlat22.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_33.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_16.xyz;
    u_xlat16_91 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_91 = u_xlat16_1.w * _albedoColor.w + u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_91 : u_xlat16_89;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_62.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_62.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_89 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_89) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_89 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
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
    u_xlat87 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat87 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_3.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(16) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
mediump float u_xlat16_30;
vec3 u_xlat32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_48;
vec3 u_xlat49;
vec3 u_xlat50;
float u_xlat58;
bool u_xlatb58;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_64;
float u_xlat69;
float u_xlat78;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_89 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_29.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat29.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_29.xyz = texture(_detailNormal, u_xlat29.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat29.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat29.xyz = u_xlat29.xxx * u_xlat1.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_91) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat29.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat29.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat29.xyz, u_xlat9.xyz);
    u_xlat29.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 1.17549435e-38);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat9.xyz = u_xlat29.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_91 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_92 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_13.xyz = vec3(u_xlat16_92) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb58 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat58 = (u_xlatb58) ? 1.0 : -1.0;
    u_xlat58 = u_xlat58 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_93 = u_xlat16_64 + -1.0;
    u_xlat16_94 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_95 = u_xlat16_94 + -1.0;
    u_xlat3.x = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat90 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat90) + u_xlat1.xyz;
    u_xlat90 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat90);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_100 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_15.xyz = vec3(u_xlat16_100) * vs_TEXCOORD1.yzx;
    u_xlat58 = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat58 = u_xlat58 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_100 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_18.xyz = vec3(u_xlat16_100) * u_xlat16_18.xyz;
    u_xlat16_100 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_100 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_100 = min(max(u_xlat16_100, 0.0), 1.0);
#else
    u_xlat16_100 = clamp(u_xlat16_100, 0.0, 1.0);
#endif
    u_xlat16_100 = u_xlat16_100 + -1.0;
    u_xlat16_100 = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_102 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_102);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_33.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_62.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62.x = min(max(u_xlat16_62.x, 0.0), 1.0);
#else
    u_xlat16_62.x = clamp(u_xlat16_62.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_62.x * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_62.x) + u_xlat16_35.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_35.x + u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_100 * u_xlat16_62.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat87 = (-u_xlat87) * u_xlat87 + 1.0;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat87) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat87 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat87 = (-u_xlat0.x) + u_xlat87;
    u_xlat20.z = _ShadowBias.y * u_xlat87 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat87 = (-u_xlat16_35.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat87 + u_xlat16_35.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_91 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat20.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat32.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat23.xyz = u_xlat32.xxx * u_xlat23.xyz;
    u_xlat32.x = u_xlat16_64 * u_xlat16_4.x;
    u_xlat90 = (-u_xlat16_93) + 1.0;
    u_xlat32.z = u_xlat90 * u_xlat16_4.x;
    u_xlat32.xz = max(u_xlat32.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat20.xyz);
    u_xlat96 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat23.xyz, u_xlat20.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_13.xyz);
    u_xlat98 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat58 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat24.xyz;
    u_xlat58 = u_xlat16_94 * u_xlat16_4.x;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat99 = (-u_xlat16_95) + 1.0;
    u_xlat99 = u_xlat16_4.x * u_xlat99;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat101 = dot(u_xlat24.xyz, u_xlat20.xyz);
    u_xlat20.x = dot(u_xlat24.xyz, u_xlat16_13.xyz);
    u_xlat49.x = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat78 = u_xlat58 * u_xlat99;
    u_xlat24.x = u_xlat16_35.x * u_xlat99;
    u_xlat24.y = u_xlat58 * u_xlat101;
    u_xlat24.z = u_xlat87 * u_xlat78;
    u_xlat101 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat107 = u_xlat78 * 0.318309873;
    u_xlat101 = u_xlat78 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat107 * u_xlat101;
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat96 * u_xlat58;
    u_xlat22.z = u_xlat99 * u_xlat20.x;
    u_xlat20.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat22.x;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_64 * u_xlat58;
    u_xlat21.z = u_xlat99 * u_xlat49.x;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat21.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat20.x * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat99 = u_xlat32.z * u_xlat32.x;
    u_xlat20.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat20.y = u_xlat32.x * u_xlat97;
    u_xlat20.z = u_xlat87 * u_xlat99;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat97 = u_xlat99 * 0.318309873;
    u_xlat87 = u_xlat99 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat97 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat22.y = u_xlat32.x * u_xlat96;
    u_xlat22.z = u_xlat32.z * u_xlat69;
    u_xlat96 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat22.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat21.y = u_xlat32.x * u_xlat16_64;
    u_xlat21.z = u_xlat32.z * u_xlat98;
    u_xlat69 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat21.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat96 * u_xlat69 + 6.10351563e-05;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat98 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat98 * u_xlat98;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_35.x = u_xlat98 * u_xlat16_91;
    u_xlat20.x = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_91) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_2.xyz * vec3(u_xlat98);
    u_xlat49.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat49.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat87 = u_xlat87 * u_xlat69;
    u_xlat50.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat21.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat50.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat58 = u_xlat101 * u_xlat58;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat58);
    u_xlat49.xyz = u_xlat16_17.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat21.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat49.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat49.xyz = u_xlat16_25.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat50.xyz * u_xlat16_25.xyz + u_xlat49.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat50.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_35.x = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = u_xlat16_35.xxx * u_xlat50.xyz;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_91 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_25.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_17.xyz;
    u_xlat58 = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat50.xyz = vec3(u_xlat58) * u_xlat50.xyz;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat50.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, u_xlat16_17.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat50.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat27.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat27.y = u_xlat87 * u_xlat32.x;
    u_xlat27.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat24.y = u_xlat32.x * u_xlat16_64;
    u_xlat24.z = u_xlat32.z * u_xlat69;
    u_xlat87 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat0.w = u_xlat87 + u_xlat24.x;
    u_xlat0.xw = u_xlat0.xw + vec2(-1.0, 6.10351563e-05);
    u_xlat87 = u_xlat96 * u_xlat0.w + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat69 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat69 * u_xlat69;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_35.x = u_xlat69 * u_xlat16_91;
    u_xlat69 = (-u_xlat16_91) * u_xlat69 + 1.0;
    u_xlat50.xyz = u_xlat16_2.xyz * vec3(u_xlat69);
    u_xlat50.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat50.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat50.xyz = u_xlat50.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat24.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat16_25.xyz * u_xlat50.xyz;
    u_xlat16_25.xyz = u_xlat50.xyz * u_xlat11.xxx + u_xlat49.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_91);
    u_xlat16_26.xyz = u_xlat16_35.xxx * u_xlat11.xzw;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_35.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_26.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_28.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xzw = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_26.xyz;
    u_xlat58 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xzw = vec3(u_xlat58) * u_xlat11.xzw;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_26.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat1.zxy, u_xlat11.xzw);
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat16_26.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat11.xzw);
    u_xlat11.x = dot(u_xlat23.xyz, u_xlat16_26.xyz);
    u_xlat21.x = u_xlat32.z * u_xlat16_92;
    u_xlat21.y = u_xlat87 * u_xlat32.x;
    u_xlat21.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat12.y = u_xlat32.x * u_xlat16_35.x;
    u_xlat12.z = u_xlat32.z * u_xlat11.x;
    u_xlat87 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat12.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat96 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat32.x = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat32.x * u_xlat32.x;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_92 = u_xlat32.x * u_xlat16_91;
    u_xlat32.x = (-u_xlat16_91) * u_xlat32.x + 1.0;
    u_xlat11.xzw = u_xlat16_2.xyz * u_xlat32.xxx;
    u_xlat11.xzw = u_xlat20.xxx * vec3(u_xlat16_92) + u_xlat11.xzw;
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_26.xyz = u_xlat11.yyy * u_xlat16_26.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat11.xzw = u_xlat11.xzw * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xzw = min(max(u_xlat11.xzw, 0.0), 1.0);
#else
    u_xlat11.xzw = clamp(u_xlat11.xzw, 0.0, 1.0);
#endif
    u_xlat11.xzw = u_xlat16_16.xyz * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat12.xxx * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat16_28.xyz * u_xlat11.xzw;
    u_xlat16_16.xyz = u_xlat11.xzw * u_xlat11.yyy + u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_25.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_62.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_28.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_100) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_28.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyw;
    u_xlat16_28.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb0 = u_xlat16_93>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_93);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat29.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_33.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_93)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_48.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_48.y = u_xlat1.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_62.x = u_xlat16_33.x + 1.0;
    u_xlat16_62.x = min(u_xlat16_62.x, 15.0);
    u_xlat16_91 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_62.x * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_1.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_91 * u_xlat16_33.x + u_xlat16_1.x;
    u_xlat16_33.x = u_xlat16_100 * u_xlat16_33.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat0.z * 0.5;
    u_xlat16_62.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat1.x * u_xlat16_62.x + u_xlat16_33.x;
    u_xlat16_62.x = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_91 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_91 + u_xlat16_62.x;
    u_xlat16_33.x = u_xlat0.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_3.z, u_xlat16_33.x);
    u_xlat16_62.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_62.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_92 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_4.xzw * vec3(u_xlat16_92);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_4.xzw;
    u_xlat22.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_33.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_16.xyz;
    u_xlat16_91 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_91 = u_xlat16_1.w * _albedoColor.w + u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_91 : u_xlat16_89;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_62.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_62.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_89 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_89) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_89 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
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
    u_xlat87 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat87 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat29.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_3.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
vec2 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_46;
float u_xlat47;
vec3 u_xlat48;
vec2 u_xlat56;
mediump vec2 u_xlat16_56;
int u_xlati56;
mediump vec2 u_xlat16_60;
mediump float u_xlat16_62;
float u_xlat75;
mediump float u_xlat16_86;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
float u_xlat93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
float u_xlat103;
float u_xlat104;
float u_xlat105;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_86 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_28.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat28.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_28.xyz = texture(_detailNormal, u_xlat28.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat28.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat1.xyz;
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat28.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat28.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat28.xyz, u_xlat9.xyz);
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat9.xyz = u_xlat28.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_56.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_62 = u_xlat16_89 + -1.0;
    u_xlat16_90 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat93 = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat93 = u_xlat93 + vs_TEXCOORD5;
    u_xlat94 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat94) + u_xlat1.xyz;
    u_xlat94 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat94 = inversesqrt(u_xlat94);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat94);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat3.x = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat28.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_92 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * u_xlat16_17.xyz;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_92 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 + -1.0;
    u_xlat16_92 = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_60.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_60.x * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_60.x) + u_xlat16_34.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_34.x + u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_92 * u_xlat16_60.x;
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat19.xyz = u_xlat0.xxx * u_xlat19.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat93) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat31 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat22.xyz = vec3(u_xlat31) * u_xlat22.xyz;
    u_xlat3.y = u_xlat16_89 * u_xlat16_4.x;
    u_xlat87 = (-u_xlat16_62) + 1.0;
    u_xlat3.w = u_xlat87 * u_xlat16_4.x;
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat19.xyz);
    u_xlat94 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat103 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat3.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat23.xyz;
    u_xlat3.x = u_xlat16_90 * u_xlat16_4.x;
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat104 = (-u_xlat16_91) + 1.0;
    u_xlat104 = u_xlat16_4.x * u_xlat104;
    u_xlat104 = max(u_xlat104, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat47 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat75 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat105 = u_xlat3.x * u_xlat104;
    u_xlat23.x = u_xlat16_89 * u_xlat104;
    u_xlat23.y = u_xlat3.x * u_xlat19.x;
    u_xlat23.z = u_xlat0.x * u_xlat105;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat106 = u_xlat105 * 0.318309873;
    u_xlat19.x = u_xlat105 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat106 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.x;
    u_xlat21.z = u_xlat47 * u_xlat104;
    u_xlat47 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat21.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.x;
    u_xlat20.z = u_xlat75 * u_xlat104;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat20.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat47 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat47 = u_xlat3.w * u_xlat3.y;
    u_xlat23.x = u_xlat16_89 * u_xlat3.w;
    u_xlat23.y = u_xlat95 * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat95 = u_xlat47 * 0.318309873;
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.y;
    u_xlat21.z = u_xlat97 * u_xlat3.w;
    u_xlat94 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat21.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.y;
    u_xlat20.z = u_xlat103 * u_xlat3.w;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat75 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_89 = u_xlat75 * u_xlat75;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_34.x = u_xlat75 * u_xlat16_89;
    u_xlat103 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat103 = min(max(u_xlat103, 0.0), 1.0);
#else
    u_xlat103 = clamp(u_xlat103, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_89) * u_xlat75 + 1.0;
    u_xlat48.xyz = u_xlat16_2.xyz * vec3(u_xlat75);
    u_xlat48.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat48.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat97;
    u_xlat23.xyz = u_xlat48.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat0.x = u_xlat19.x * u_xlat3.x;
    u_xlat48.xyz = u_xlat48.xyz * u_xlat0.xxx;
    u_xlat48.xyz = u_xlat16_16.xyz * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat20.xxx * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat48.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat48.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat48.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_89 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat16_34.xxx * u_xlat23.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_34.zzz + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_25.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat56.xy = u_xlat16_56.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat56.xy = min(max(u_xlat56.xy, 0.0), 1.0);
#else
    u_xlat56.xy = clamp(u_xlat56.xy, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_16.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat23.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat23.xyz);
    u_xlat16_90 = dot(u_xlat1.zxy, u_xlat16_16.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat23.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_16.xyz);
    u_xlat23.x = u_xlat3.w * u_xlat16_34.x;
    u_xlat23.y = u_xlat3.x * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat26.y = u_xlat3.y * u_xlat16_90;
    u_xlat26.z = u_xlat3.w * u_xlat97;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat26.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat94 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat97 = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat97 * u_xlat97;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_34.x = u_xlat97 * u_xlat16_89;
    u_xlat97 = (-u_xlat16_89) * u_xlat97 + 1.0;
    u_xlat23.xyz = u_xlat16_2.xyz * vec3(u_xlat97);
    u_xlat23.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat23.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat56.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat26.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_25.xyz * u_xlat23.xyz;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat56.xxx + u_xlat48.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_24.xyz = u_xlat16_34.xxx * u_xlat20.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_34.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_27.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat16_24.xyz);
    u_xlat56.x = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat16_24.xyz);
    u_xlat11.x = u_xlat3.w * u_xlat16_89;
    u_xlat11.y = u_xlat56.x * u_xlat3.y;
    u_xlat11.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat3.y * u_xlat16_34.x;
    u_xlat20.z = u_xlat3.x * u_xlat3.w;
    u_xlat56.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56.x = sqrt(u_xlat56.x);
    u_xlat56.x = u_xlat56.x + u_xlat20.x;
    u_xlat56.x = u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = u_xlat94 * u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = float(1.0) / u_xlat56.x;
    u_xlat3.x = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat3.x * u_xlat3.x;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_89 = u_xlat3.x * u_xlat16_88;
    u_xlat3.x = (-u_xlat16_88) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_2.xyz * u_xlat3.xxx;
    u_xlat3.xyw = vec3(u_xlat103) * vec3(u_xlat16_89) + u_xlat3.xyw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat56.yyy * u_xlat16_24.xyz;
    u_xlat0.x = u_xlat56.x * u_xlat0.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat16_15.xyz * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat20.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_27.xyz * u_xlat3.xyw;
    u_xlat16_15.xyz = u_xlat3.xyw * u_xlat56.yyy + u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_24.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat3.x = min(u_xlat16_60.x, 1.0);
    u_xlat31 = min(u_xlat3.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat31) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_27.xyz * vec3(u_xlat31) + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_92) * u_xlat16_24.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_27.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_27.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyw;
    u_xlat16_27.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat0.xzw = vec3(u_xlat93) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat31 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat16_62>=0.0);
#else
    u_xlatb31 = u_xlat16_62>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb31)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_62);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat28.xxx + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_4.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat28.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = u_xlat16_32.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_4.x = -abs(u_xlat16_62) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_0.w);
    u_xlat16_60.x = u_xlat16_32.x + 1.0;
    u_xlat16_60.x = min(u_xlat16_60.x, 15.0);
    u_xlat16_88 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_60.x * 16.0 + u_xlat16_0.y;
    u_xlat16_32.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_31) + u_xlat16_87;
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x + u_xlat16_31;
    u_xlat16_32.x = u_xlat16_92 * u_xlat16_32.x;
    u_xlat31 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat31 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat3.x * 0.5;
    u_xlat16_60.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat31 * u_xlat16_60.x + u_xlat16_32.x;
    u_xlat16_60.x = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_88 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_88 + u_xlat16_60.x;
    u_xlat16_32.x = u_xlat3.x * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_32.x);
    u_xlat16_60.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_60.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_89 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_34.xyz = u_xlat16_4.xzw * vec3(u_xlat16_89);
    u_xlat16_4.xzw = (bool(u_xlatb1)) ? u_xlat16_34.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_15.xyz;
    u_xlat16_88 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_1.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_88 : u_xlat16_86;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_60.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_60.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_86 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_86) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_86 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
mediump vec4 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_27;
vec3 u_xlat28;
mediump vec3 u_xlat16_28;
vec2 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
float u_xlat31;
mediump float u_xlat16_31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_46;
float u_xlat47;
vec3 u_xlat48;
vec2 u_xlat56;
mediump vec2 u_xlat16_56;
int u_xlati56;
mediump vec2 u_xlat16_60;
mediump float u_xlat16_62;
float u_xlat75;
mediump float u_xlat16_86;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
float u_xlat93;
float u_xlat94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat97;
float u_xlat103;
float u_xlat104;
float u_xlat105;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_86 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_28.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat28.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_28.xyz = texture(_detailNormal, u_xlat28.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_28.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat28.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat28.xyz = u_xlat28.xxx * u_xlat1.xyz;
    u_xlat16_88 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_88) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat28.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat28.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat28.xyz, u_xlat9.xyz);
    u_xlat28.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat28.x = max(u_xlat28.x, 1.17549435e-38);
    u_xlat28.x = inversesqrt(u_xlat28.x);
    u_xlat9.xyz = u_xlat28.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_56.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_88 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_88 = inversesqrt(u_xlat16_88);
    u_xlat16_12.xyz = vec3(u_xlat16_88) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_89 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_62 = u_xlat16_89 + -1.0;
    u_xlat16_90 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_91 = u_xlat16_90 + -1.0;
    u_xlat93 = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat93 = u_xlat93 + vs_TEXCOORD5;
    u_xlat94 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat94) + u_xlat1.xyz;
    u_xlat94 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat94 = inversesqrt(u_xlat94);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat94);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz;
    u_xlat16_92 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_14.xyz = vec3(u_xlat16_92) * vs_TEXCOORD1.yzx;
    u_xlat3.x = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat28.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_92 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_17.xyz = vec3(u_xlat16_92) * u_xlat16_17.xyz;
    u_xlat16_92 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_92 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_92 = min(max(u_xlat16_92, 0.0), 1.0);
#else
    u_xlat16_92 = clamp(u_xlat16_92, 0.0, 1.0);
#endif
    u_xlat16_92 = u_xlat16_92 + -1.0;
    u_xlat16_92 = _occlusionScale * u_xlat16_92 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_32.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_32.x = max(u_xlat16_32.x, 0.0078125);
    u_xlat16_60.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60.x = min(max(u_xlat16_60.x, 0.0), 1.0);
#else
    u_xlat16_60.x = clamp(u_xlat16_60.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_60.x * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_60.x) + u_xlat16_34.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_34.x + u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_46.z * u_xlat16_60.x;
    u_xlat16_60.x = u_xlat16_92 * u_xlat16_60.x;
    u_xlat19.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat19.xyz = u_xlat0.xxx * u_xlat19.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat19.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_34.x = min(max(u_xlat16_34.x, 0.0), 1.0);
#else
    u_xlat16_34.x = clamp(u_xlat16_34.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat93) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat31 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat22.xyz = vec3(u_xlat31) * u_xlat22.xyz;
    u_xlat3.y = u_xlat16_89 * u_xlat16_4.x;
    u_xlat87 = (-u_xlat16_62) + 1.0;
    u_xlat3.w = u_xlat87 * u_xlat16_4.x;
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat19.xyz);
    u_xlat94 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_96 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat19.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat103 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat3.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat23.xyz = u_xlat3.xxx * u_xlat23.xyz;
    u_xlat3.x = u_xlat16_90 * u_xlat16_4.x;
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat104 = (-u_xlat16_91) + 1.0;
    u_xlat104 = u_xlat16_4.x * u_xlat104;
    u_xlat104 = max(u_xlat104, 0.00100000005);
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat19.xyz);
    u_xlat47 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat75 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat105 = u_xlat3.x * u_xlat104;
    u_xlat23.x = u_xlat16_89 * u_xlat104;
    u_xlat23.y = u_xlat3.x * u_xlat19.x;
    u_xlat23.z = u_xlat0.x * u_xlat105;
    u_xlat19.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat19.x = max(u_xlat19.x, 6.10351563e-05);
    u_xlat106 = u_xlat105 * 0.318309873;
    u_xlat19.x = u_xlat105 / u_xlat19.x;
    u_xlat19.x = u_xlat19.x * u_xlat19.x;
    u_xlat19.x = u_xlat106 * u_xlat19.x;
    u_xlat19.x = min(u_xlat19.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.x;
    u_xlat21.z = u_xlat47 * u_xlat104;
    u_xlat47 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat47 = sqrt(u_xlat47);
    u_xlat47 = u_xlat47 + u_xlat21.x;
    u_xlat47 = u_xlat47 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.x;
    u_xlat20.z = u_xlat75 * u_xlat104;
    u_xlat3.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat20.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat47 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat47 = u_xlat3.w * u_xlat3.y;
    u_xlat23.x = u_xlat16_89 * u_xlat3.w;
    u_xlat23.y = u_xlat95 * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat95 = u_xlat47 * 0.318309873;
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat21.y = u_xlat94 * u_xlat3.y;
    u_xlat21.z = u_xlat97 * u_xlat3.w;
    u_xlat94 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat94 = sqrt(u_xlat94);
    u_xlat94 = u_xlat94 + u_xlat21.x;
    u_xlat94 = u_xlat94 + 6.10351563e-05;
    u_xlat20.y = u_xlat16_96 * u_xlat3.y;
    u_xlat20.z = u_xlat103 * u_xlat3.w;
    u_xlat97 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat97 = u_xlat97 + u_xlat20.x;
    u_xlat97 = u_xlat97 + 6.10351563e-05;
    u_xlat97 = u_xlat94 * u_xlat97 + 6.10351563e-05;
    u_xlat97 = float(1.0) / u_xlat97;
    u_xlat75 = (-u_xlat16_34.x) + 1.0;
    u_xlat16_89 = u_xlat75 * u_xlat75;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_89 = u_xlat75 * u_xlat16_89;
    u_xlat16_34.x = u_xlat75 * u_xlat16_89;
    u_xlat103 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat103 = min(max(u_xlat103, 0.0), 1.0);
#else
    u_xlat103 = clamp(u_xlat103, 0.0, 1.0);
#endif
    u_xlat75 = (-u_xlat16_89) * u_xlat75 + 1.0;
    u_xlat48.xyz = u_xlat16_2.xyz * vec3(u_xlat75);
    u_xlat48.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat48.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat97;
    u_xlat23.xyz = u_xlat48.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat20.xxx * u_xlat23.xyz;
    u_xlat0.x = u_xlat19.x * u_xlat3.x;
    u_xlat48.xyz = u_xlat48.xyz * u_xlat0.xxx;
    u_xlat48.xyz = u_xlat16_16.xyz * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat20.xxx * u_xlat48.xyz;
    u_xlat48.xyz = u_xlat48.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat48.xyz = u_xlat23.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat48.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_89 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_16.xyz = u_xlat16_34.xxx * u_xlat23.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_34.zzz + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_25.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat56.xy = u_xlat16_56.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat56.xy = min(max(u_xlat56.xy, 0.0), 1.0);
#else
    u_xlat56.xy = clamp(u_xlat56.xy, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_16.xyz;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat23.xyz = u_xlat0.xxx * u_xlat23.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat16_16.xyz, u_xlat23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_89 = min(max(u_xlat16_89, 0.0), 1.0);
#else
    u_xlat16_89 = clamp(u_xlat16_89, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat23.xyz);
    u_xlat16_90 = dot(u_xlat1.zxy, u_xlat16_16.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat23.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat16_16.xyz);
    u_xlat23.x = u_xlat3.w * u_xlat16_34.x;
    u_xlat23.y = u_xlat3.x * u_xlat3.y;
    u_xlat23.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat26.y = u_xlat3.y * u_xlat16_90;
    u_xlat26.z = u_xlat3.w * u_xlat97;
    u_xlat3.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat26.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat94 * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat97 = (-u_xlat16_89) + 1.0;
    u_xlat16_89 = u_xlat97 * u_xlat97;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_89 = u_xlat97 * u_xlat16_89;
    u_xlat16_34.x = u_xlat97 * u_xlat16_89;
    u_xlat97 = (-u_xlat16_89) * u_xlat97 + 1.0;
    u_xlat23.xyz = u_xlat16_2.xyz * vec3(u_xlat97);
    u_xlat23.xyz = vec3(u_xlat103) * u_xlat16_34.xxx + u_xlat23.xyz;
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat56.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat26.xxx * u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x * u_xlat3.x;
    u_xlat23.xyz = u_xlat23.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat23.xyz = min(max(u_xlat23.xyz, 0.0), 1.0);
#else
    u_xlat23.xyz = clamp(u_xlat23.xyz, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat16_15.xyz * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat26.xxx * u_xlat23.xyz;
    u_xlat23.xyz = u_xlat16_25.xyz * u_xlat23.xyz;
    u_xlat16_25.xyz = u_xlat23.xyz * u_xlat56.xxx + u_xlat48.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_89 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_89));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_89);
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_89 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat16_89 = max(u_xlat16_89, 6.10351563e-05);
    u_xlat16_34.x = inversesqrt(u_xlat16_89);
    u_xlat16_24.xyz = u_xlat16_34.xxx * u_xlat20.xyz;
    u_xlat16_34.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_34.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_34.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_90 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_91 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_24.xyz);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_90 = max(u_xlat16_90, u_xlat16_91);
    u_xlat16_91 = float(1.0) / float(u_xlat16_89);
    u_xlat16_89 = u_xlat16_89 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_89 = (-u_xlat16_89) * u_xlat16_89 + 1.0;
    u_xlat16_89 = max(u_xlat16_89, 0.0);
    u_xlat16_89 = u_xlat16_89 * u_xlat16_89;
    u_xlat16_89 = u_xlat16_89 * u_xlat16_91;
    u_xlat16_89 = max(u_xlat16_34.x, u_xlat16_89);
    u_xlat16_89 = u_xlat16_90 * u_xlat16_89;
    u_xlat16_27.xyz = vec3(u_xlat16_89) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_88) + u_xlat16_24.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_88 = dot(u_xlat16_24.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_24.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat16_89 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat16_34.x = dot(u_xlat1.zxy, u_xlat16_24.xyz);
    u_xlat56.x = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat3.x = dot(u_xlat22.xyz, u_xlat16_24.xyz);
    u_xlat11.x = u_xlat3.w * u_xlat16_89;
    u_xlat11.y = u_xlat56.x * u_xlat3.y;
    u_xlat11.z = u_xlat0.x * u_xlat47;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat0.x = u_xlat47 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat95 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat3.y * u_xlat16_34.x;
    u_xlat20.z = u_xlat3.x * u_xlat3.w;
    u_xlat56.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat56.x = sqrt(u_xlat56.x);
    u_xlat56.x = u_xlat56.x + u_xlat20.x;
    u_xlat56.x = u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = u_xlat94 * u_xlat56.x + 6.10351563e-05;
    u_xlat56.x = float(1.0) / u_xlat56.x;
    u_xlat3.x = (-u_xlat16_88) + 1.0;
    u_xlat16_88 = u_xlat3.x * u_xlat3.x;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_88 = u_xlat3.x * u_xlat16_88;
    u_xlat16_89 = u_xlat3.x * u_xlat16_88;
    u_xlat3.x = (-u_xlat16_88) * u_xlat3.x + 1.0;
    u_xlat3.xyw = u_xlat16_2.xyz * u_xlat3.xxx;
    u_xlat3.xyw = vec3(u_xlat103) * vec3(u_xlat16_89) + u_xlat3.xyw;
    u_xlat16_24.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_24.xyz = u_xlat56.yyy * u_xlat16_24.xyz;
    u_xlat0.x = u_xlat56.x * u_xlat0.x;
    u_xlat3.xyw = u_xlat3.xyw * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyw = min(max(u_xlat3.xyw, 0.0), 1.0);
#else
    u_xlat3.xyw = clamp(u_xlat3.xyw, 0.0, 1.0);
#endif
    u_xlat3.xyw = u_xlat16_15.xyz * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat20.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat16_27.xyz * u_xlat3.xyw;
    u_xlat16_15.xyz = u_xlat3.xyw * u_xlat56.yyy + u_xlat16_25.xyz;
    u_xlat16_16.xyz = u_xlat16_24.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_24.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_24.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_24.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_24.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat3.x = min(u_xlat16_60.x, 1.0);
    u_xlat31 = min(u_xlat3.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat31) * u_xlat16_25.xyz;
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat31) * u_xlat16_27.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat31) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_27.xyz * vec3(u_xlat31) + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat16_92) * u_xlat16_24.xyz;
    u_xlati56 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_27.xyz = u_xlat16_24.yyy * _IrradianceACCoeffs[u_xlati56].xyz;
    u_xlat16_24.xyw = u_xlat16_24.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_27.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_24.xyz = u_xlat16_24.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyw;
    u_xlat16_27.xyz = u_xlat16_24.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_27.xyz;
    u_xlat0.xzw = vec3(u_xlat93) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat31 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat31 = inversesqrt(u_xlat31);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat31);
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(u_xlat16_62>=0.0);
#else
    u_xlatb31 = u_xlat16_62>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb31)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_62);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat28.xxx + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_4.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat28.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = u_xlat16_32.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_62)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_4.x = -abs(u_xlat16_62) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_0.w);
    u_xlat16_60.x = u_xlat16_32.x + 1.0;
    u_xlat16_60.x = min(u_xlat16_60.x, 15.0);
    u_xlat16_88 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_60.x * 16.0 + u_xlat16_0.y;
    u_xlat16_32.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_31 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_31) + u_xlat16_87;
    u_xlat16_32.x = u_xlat16_88 * u_xlat16_32.x + u_xlat16_31;
    u_xlat16_32.x = u_xlat16_92 * u_xlat16_32.x;
    u_xlat31 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31 = min(max(u_xlat31, 0.0), 1.0);
#else
    u_xlat31 = clamp(u_xlat31, 0.0, 1.0);
#endif
    u_xlat31 = u_xlat31 * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat3.x * 0.5;
    u_xlat16_60.x = (-u_xlat3.x) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat31 * u_xlat16_60.x + u_xlat16_32.x;
    u_xlat16_60.x = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_88 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_88 + u_xlat16_60.x;
    u_xlat16_32.x = u_xlat3.x * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_32.x);
    u_xlat16_60.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_60.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_89 = dot(u_xlat16_24.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_34.xyz = u_xlat16_4.xzw * vec3(u_xlat16_89);
    u_xlat16_4.xzw = (bool(u_xlatb1)) ? u_xlat16_34.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_15.xyz;
    u_xlat16_88 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_88 = u_xlat16_1.w * _albedoColor.w + u_xlat16_88;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_88 = min(max(u_xlat16_88, 0.0), 1.0);
#else
    u_xlat16_88 = clamp(u_xlat16_88, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_88 : u_xlat16_86;
    u_xlat16_6.xyz = u_xlat16_15.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_60.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_60.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_86 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_86) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_86 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_86) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(15) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
mediump float u_xlat16_30;
vec3 u_xlat32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_48;
vec3 u_xlat49;
vec3 u_xlat50;
float u_xlat58;
bool u_xlatb58;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_64;
float u_xlat69;
float u_xlat78;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_89 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_29.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat29.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_29.xyz = texture(_detailNormal, u_xlat29.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat29.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat29.xyz = u_xlat29.xxx * u_xlat1.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_91) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat29.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat29.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat29.xyz, u_xlat9.xyz);
    u_xlat29.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 1.17549435e-38);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat9.xyz = u_xlat29.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_91 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_92 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_13.xyz = vec3(u_xlat16_92) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb58 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat58 = (u_xlatb58) ? 1.0 : -1.0;
    u_xlat58 = u_xlat58 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_93 = u_xlat16_64 + -1.0;
    u_xlat16_94 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_95 = u_xlat16_94 + -1.0;
    u_xlat3.x = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat90 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat90) + u_xlat1.xyz;
    u_xlat90 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat90);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_100 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_15.xyz = vec3(u_xlat16_100) * vs_TEXCOORD1.yzx;
    u_xlat58 = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat58 = u_xlat58 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_100 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_18.xyz = vec3(u_xlat16_100) * u_xlat16_18.xyz;
    u_xlat16_100 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_100 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_100 = min(max(u_xlat16_100, 0.0), 1.0);
#else
    u_xlat16_100 = clamp(u_xlat16_100, 0.0, 1.0);
#endif
    u_xlat16_100 = u_xlat16_100 + -1.0;
    u_xlat16_100 = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_102 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_102);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_33.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_62.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62.x = min(max(u_xlat16_62.x, 0.0), 1.0);
#else
    u_xlat16_62.x = clamp(u_xlat16_62.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_62.x * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_62.x) + u_xlat16_35.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_35.x + u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_100 * u_xlat16_62.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat87 = (-u_xlat87) * u_xlat87 + 1.0;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat87) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat87 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat87 = (-u_xlat0.x) + u_xlat87;
    u_xlat20.z = _ShadowBias.y * u_xlat87 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat87 = (-u_xlat16_35.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat87 + u_xlat16_35.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_91 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat20.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat32.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat23.xyz = u_xlat32.xxx * u_xlat23.xyz;
    u_xlat32.x = u_xlat16_64 * u_xlat16_4.x;
    u_xlat90 = (-u_xlat16_93) + 1.0;
    u_xlat32.z = u_xlat90 * u_xlat16_4.x;
    u_xlat32.xz = max(u_xlat32.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat20.xyz);
    u_xlat96 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat23.xyz, u_xlat20.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_13.xyz);
    u_xlat98 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat58 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat24.xyz;
    u_xlat58 = u_xlat16_94 * u_xlat16_4.x;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat99 = (-u_xlat16_95) + 1.0;
    u_xlat99 = u_xlat16_4.x * u_xlat99;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat101 = dot(u_xlat24.xyz, u_xlat20.xyz);
    u_xlat20.x = dot(u_xlat24.xyz, u_xlat16_13.xyz);
    u_xlat49.x = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat78 = u_xlat58 * u_xlat99;
    u_xlat24.x = u_xlat16_35.x * u_xlat99;
    u_xlat24.y = u_xlat58 * u_xlat101;
    u_xlat24.z = u_xlat87 * u_xlat78;
    u_xlat101 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat107 = u_xlat78 * 0.318309873;
    u_xlat101 = u_xlat78 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat107 * u_xlat101;
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat96 * u_xlat58;
    u_xlat22.z = u_xlat99 * u_xlat20.x;
    u_xlat20.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat22.x;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_64 * u_xlat58;
    u_xlat21.z = u_xlat99 * u_xlat49.x;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat21.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat20.x * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat99 = u_xlat32.z * u_xlat32.x;
    u_xlat20.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat20.y = u_xlat32.x * u_xlat97;
    u_xlat20.z = u_xlat87 * u_xlat99;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat97 = u_xlat99 * 0.318309873;
    u_xlat87 = u_xlat99 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat97 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat22.y = u_xlat32.x * u_xlat96;
    u_xlat22.z = u_xlat32.z * u_xlat69;
    u_xlat96 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat22.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat21.y = u_xlat32.x * u_xlat16_64;
    u_xlat21.z = u_xlat32.z * u_xlat98;
    u_xlat69 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat21.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat96 * u_xlat69 + 6.10351563e-05;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat98 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat98 * u_xlat98;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_35.x = u_xlat98 * u_xlat16_91;
    u_xlat20.x = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_91) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_2.xyz * vec3(u_xlat98);
    u_xlat49.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat49.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat87 = u_xlat87 * u_xlat69;
    u_xlat50.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat21.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat50.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat58 = u_xlat101 * u_xlat58;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat58);
    u_xlat49.xyz = u_xlat16_17.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat21.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat49.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat49.xyz = u_xlat16_25.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat50.xyz * u_xlat16_25.xyz + u_xlat49.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat50.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_35.x = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = u_xlat16_35.xxx * u_xlat50.xyz;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_91 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_25.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_17.xyz;
    u_xlat58 = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat50.xyz = vec3(u_xlat58) * u_xlat50.xyz;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat50.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, u_xlat16_17.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat50.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat27.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat27.y = u_xlat87 * u_xlat32.x;
    u_xlat27.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat24.y = u_xlat32.x * u_xlat16_64;
    u_xlat24.z = u_xlat32.z * u_xlat69;
    u_xlat87 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat0.w = u_xlat87 + u_xlat24.x;
    u_xlat0.xw = u_xlat0.xw + vec2(-1.0, 6.10351563e-05);
    u_xlat87 = u_xlat96 * u_xlat0.w + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat69 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat69 * u_xlat69;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_35.x = u_xlat69 * u_xlat16_91;
    u_xlat69 = (-u_xlat16_91) * u_xlat69 + 1.0;
    u_xlat50.xyz = u_xlat16_2.xyz * vec3(u_xlat69);
    u_xlat50.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat50.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat50.xyz = u_xlat50.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat24.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat16_25.xyz * u_xlat50.xyz;
    u_xlat16_25.xyz = u_xlat50.xyz * u_xlat11.xxx + u_xlat49.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_91);
    u_xlat16_26.xyz = u_xlat16_35.xxx * u_xlat11.xzw;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_35.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_26.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_28.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xzw = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_26.xyz;
    u_xlat58 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xzw = vec3(u_xlat58) * u_xlat11.xzw;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_26.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat1.zxy, u_xlat11.xzw);
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat16_26.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat11.xzw);
    u_xlat11.x = dot(u_xlat23.xyz, u_xlat16_26.xyz);
    u_xlat21.x = u_xlat32.z * u_xlat16_92;
    u_xlat21.y = u_xlat87 * u_xlat32.x;
    u_xlat21.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat12.y = u_xlat32.x * u_xlat16_35.x;
    u_xlat12.z = u_xlat32.z * u_xlat11.x;
    u_xlat87 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat12.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat96 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat32.x = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat32.x * u_xlat32.x;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_92 = u_xlat32.x * u_xlat16_91;
    u_xlat32.x = (-u_xlat16_91) * u_xlat32.x + 1.0;
    u_xlat11.xzw = u_xlat16_2.xyz * u_xlat32.xxx;
    u_xlat11.xzw = u_xlat20.xxx * vec3(u_xlat16_92) + u_xlat11.xzw;
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_26.xyz = u_xlat11.yyy * u_xlat16_26.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat11.xzw = u_xlat11.xzw * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xzw = min(max(u_xlat11.xzw, 0.0), 1.0);
#else
    u_xlat11.xzw = clamp(u_xlat11.xzw, 0.0, 1.0);
#endif
    u_xlat11.xzw = u_xlat16_16.xyz * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat12.xxx * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat16_28.xyz * u_xlat11.xzw;
    u_xlat16_16.xyz = u_xlat11.xzw * u_xlat11.yyy + u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_25.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_62.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_28.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_100) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_28.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyw;
    u_xlat16_28.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb0 = u_xlat16_93>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_93);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat29.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_33.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_93)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_48.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_48.y = u_xlat1.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_62.x = u_xlat16_33.x + 1.0;
    u_xlat16_62.x = min(u_xlat16_62.x, 15.0);
    u_xlat16_91 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_62.x * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_1.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_91 * u_xlat16_33.x + u_xlat16_1.x;
    u_xlat16_33.x = u_xlat16_100 * u_xlat16_33.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat0.z * 0.5;
    u_xlat16_62.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat1.x * u_xlat16_62.x + u_xlat16_33.x;
    u_xlat16_62.x = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_91 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_91 + u_xlat16_62.x;
    u_xlat16_33.x = u_xlat0.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_3.z, u_xlat16_33.x);
    u_xlat16_62.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_62.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_92 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_4.xzw * vec3(u_xlat16_92);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_4.xzw;
    u_xlat22.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_33.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_16.xyz;
    u_xlat16_91 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_91 = u_xlat16_1.w * _albedoColor.w + u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_91 : u_xlat16_89;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_62.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_62.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_89 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_89) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_89 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(15) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec4 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_28;
vec3 u_xlat29;
mediump vec3 u_xlat16_29;
bool u_xlatb29;
mediump float u_xlat16_30;
vec3 u_xlat32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
mediump vec3 u_xlat16_48;
vec3 u_xlat49;
vec3 u_xlat50;
float u_xlat58;
bool u_xlatb58;
mediump vec2 u_xlat16_62;
mediump float u_xlat16_64;
float u_xlat69;
float u_xlat78;
float u_xlat87;
mediump float u_xlat16_87;
int u_xlati87;
bool u_xlatb87;
mediump float u_xlat16_89;
float u_xlat90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
float u_xlat96;
float u_xlat97;
float u_xlat98;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
mediump float u_xlat16_102;
float u_xlat107;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_89 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_29.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat29.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_29.xyz = texture(_detailNormal, u_xlat29.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_29.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat29.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat29.xyz = u_xlat29.xxx * u_xlat1.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_91) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat29.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat29.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat29.xyz, u_xlat9.xyz);
    u_xlat29.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat29.x = max(u_xlat29.x, 1.17549435e-38);
    u_xlat29.x = inversesqrt(u_xlat29.x);
    u_xlat9.xyz = u_xlat29.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_91 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_92 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_92 = inversesqrt(u_xlat16_92);
    u_xlat16_13.xyz = vec3(u_xlat16_92) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb58 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat58 = (u_xlatb58) ? 1.0 : -1.0;
    u_xlat58 = u_xlat58 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(0.5<_anisoUse2U);
#else
    u_xlatb87 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb87)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_87 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat87 = u_xlat16_87 * 2.0 + -1.0;
    u_xlat16_64 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_93 = u_xlat16_64 + -1.0;
    u_xlat16_94 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_95 = u_xlat16_94 + -1.0;
    u_xlat3.x = u_xlat87 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat90 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat90) + u_xlat1.xyz;
    u_xlat90 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat90 = inversesqrt(u_xlat90);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat90);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat58) * u_xlat14.xyz;
    u_xlat16_100 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_15.xyz = vec3(u_xlat16_100) * vs_TEXCOORD1.yzx;
    u_xlat58 = u_xlat87 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat58 = u_xlat58 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_100 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_100 = inversesqrt(u_xlat16_100);
    u_xlat16_18.xyz = vec3(u_xlat16_100) * u_xlat16_18.xyz;
    u_xlat16_100 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_48.z = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_100 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_100 = min(max(u_xlat16_100, 0.0), 1.0);
#else
    u_xlat16_100 = clamp(u_xlat16_100, 0.0, 1.0);
#endif
    u_xlat16_100 = u_xlat16_100 + -1.0;
    u_xlat16_100 = _occlusionScale * u_xlat16_100 + 1.0;
    u_xlat16_102 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_102);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_33.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_62.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_62.x = min(max(u_xlat16_62.x, 0.0), 1.0);
#else
    u_xlat16_62.x = clamp(u_xlat16_62.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_62.x * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_62.x) + u_xlat16_35.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_35.x + u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_48.z * u_xlat16_62.x;
    u_xlat16_62.x = u_xlat16_100 * u_xlat16_62.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat87 = (-u_xlat87) * u_xlat87 + 1.0;
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat87) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat87 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat87 = (-u_xlat0.x) + u_xlat87;
    u_xlat20.z = _ShadowBias.y * u_xlat87 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat87 = (-u_xlat16_35.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat87 + u_xlat16_35.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_91 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat20.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat20.xyz = vec3(u_xlat87) * u_xlat20.xyz;
    u_xlat87 = dot(u_xlat9.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat87 = min(max(u_xlat87, 0.0), 1.0);
#else
    u_xlat87 = clamp(u_xlat87, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat20.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat32.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat23.xyz = u_xlat32.xxx * u_xlat23.xyz;
    u_xlat32.x = u_xlat16_64 * u_xlat16_4.x;
    u_xlat90 = (-u_xlat16_93) + 1.0;
    u_xlat32.z = u_xlat90 * u_xlat16_4.x;
    u_xlat32.xz = max(u_xlat32.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat20.xyz);
    u_xlat96 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat23.xyz, u_xlat20.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_13.xyz);
    u_xlat98 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat58 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat24.xyz = vec3(u_xlat58) * u_xlat24.xyz;
    u_xlat58 = u_xlat16_94 * u_xlat16_4.x;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat99 = (-u_xlat16_95) + 1.0;
    u_xlat99 = u_xlat16_4.x * u_xlat99;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat101 = dot(u_xlat24.xyz, u_xlat20.xyz);
    u_xlat20.x = dot(u_xlat24.xyz, u_xlat16_13.xyz);
    u_xlat49.x = dot(u_xlat24.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat78 = u_xlat58 * u_xlat99;
    u_xlat24.x = u_xlat16_35.x * u_xlat99;
    u_xlat24.y = u_xlat58 * u_xlat101;
    u_xlat24.z = u_xlat87 * u_xlat78;
    u_xlat101 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat107 = u_xlat78 * 0.318309873;
    u_xlat101 = u_xlat78 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat107 * u_xlat101;
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat96 * u_xlat58;
    u_xlat22.z = u_xlat99 * u_xlat20.x;
    u_xlat20.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat20.x = sqrt(u_xlat20.x);
    u_xlat20.x = u_xlat20.x + u_xlat22.x;
    u_xlat20.x = u_xlat20.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_64 * u_xlat58;
    u_xlat21.z = u_xlat99 * u_xlat49.x;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat21.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat58 = u_xlat20.x * u_xlat58 + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat99 = u_xlat32.z * u_xlat32.x;
    u_xlat20.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat20.y = u_xlat32.x * u_xlat97;
    u_xlat20.z = u_xlat87 * u_xlat99;
    u_xlat87 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat87 = max(u_xlat87, 6.10351563e-05);
    u_xlat97 = u_xlat99 * 0.318309873;
    u_xlat87 = u_xlat99 / u_xlat87;
    u_xlat87 = u_xlat87 * u_xlat87;
    u_xlat87 = u_xlat97 * u_xlat87;
    u_xlat87 = min(u_xlat87, 16.0);
    u_xlat22.y = u_xlat32.x * u_xlat96;
    u_xlat22.z = u_xlat32.z * u_xlat69;
    u_xlat96 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat96 = sqrt(u_xlat96);
    u_xlat96 = u_xlat96 + u_xlat22.x;
    u_xlat96 = u_xlat96 + 6.10351563e-05;
    u_xlat21.y = u_xlat32.x * u_xlat16_64;
    u_xlat21.z = u_xlat32.z * u_xlat98;
    u_xlat69 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat21.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat96 * u_xlat69 + 6.10351563e-05;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat98 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat98 * u_xlat98;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_91 = u_xlat98 * u_xlat16_91;
    u_xlat16_35.x = u_xlat98 * u_xlat16_91;
    u_xlat20.x = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat98 = (-u_xlat16_91) * u_xlat98 + 1.0;
    u_xlat49.xyz = u_xlat16_2.xyz * vec3(u_xlat98);
    u_xlat49.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat49.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat87 = u_xlat87 * u_xlat69;
    u_xlat50.xyz = u_xlat49.xyz * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat21.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat50.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat58 = u_xlat101 * u_xlat58;
    u_xlat49.xyz = u_xlat49.xyz * vec3(u_xlat58);
    u_xlat49.xyz = u_xlat16_17.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat21.xxx * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat49.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat49.xyz = u_xlat16_25.xyz * u_xlat49.xyz;
    u_xlat49.xyz = u_xlat50.xyz * u_xlat16_25.xyz + u_xlat49.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat50.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_35.x = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = u_xlat16_35.xxx * u_xlat50.xyz;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_91 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_25.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_17.xyz;
    u_xlat58 = dot(u_xlat50.xyz, u_xlat50.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat50.xyz = vec3(u_xlat58) * u_xlat50.xyz;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, u_xlat50.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat24.x = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat24.x = min(max(u_xlat24.x, 0.0), 1.0);
#else
    u_xlat24.x = clamp(u_xlat24.x, 0.0, 1.0);
#endif
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat50.xyz);
    u_xlat16_64 = dot(u_xlat1.zxy, u_xlat16_17.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat50.xyz);
    u_xlat69 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat27.x = u_xlat32.z * u_xlat16_35.x;
    u_xlat27.y = u_xlat87 * u_xlat32.x;
    u_xlat27.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat24.y = u_xlat32.x * u_xlat16_64;
    u_xlat24.z = u_xlat32.z * u_xlat69;
    u_xlat87 = dot(u_xlat24.xyz, u_xlat24.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat0.w = u_xlat87 + u_xlat24.x;
    u_xlat0.xw = u_xlat0.xw + vec2(-1.0, 6.10351563e-05);
    u_xlat87 = u_xlat96 * u_xlat0.w + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat69 = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat69 * u_xlat69;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_91 = u_xlat69 * u_xlat16_91;
    u_xlat16_35.x = u_xlat69 * u_xlat16_91;
    u_xlat69 = (-u_xlat16_91) * u_xlat69 + 1.0;
    u_xlat50.xyz = u_xlat16_2.xyz * vec3(u_xlat69);
    u_xlat50.xyz = u_xlat20.xxx * u_xlat16_35.xxx + u_xlat50.xyz;
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat24.xxx * u_xlat16_17.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat50.xyz = u_xlat50.xyz * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xyz = min(max(u_xlat50.xyz, 0.0), 1.0);
#else
    u_xlat50.xyz = clamp(u_xlat50.xyz, 0.0, 1.0);
#endif
    u_xlat50.xyz = u_xlat16_16.xyz * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat24.xxx * u_xlat50.xyz;
    u_xlat50.xyz = u_xlat16_25.xyz * u_xlat50.xyz;
    u_xlat16_25.xyz = u_xlat50.xyz * u_xlat11.xxx + u_xlat49.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_91 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_91));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_91);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_91 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_91 = max(u_xlat16_91, 6.10351563e-05);
    u_xlat16_35.x = inversesqrt(u_xlat16_91);
    u_xlat16_26.xyz = u_xlat16_35.xxx * u_xlat11.xzw;
    u_xlat16_35.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_28.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat16_35.yyy + u_xlat16_28.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_64 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_26.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_64 = max(u_xlat16_64, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_91);
    u_xlat16_91 = u_xlat16_91 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_91 = (-u_xlat16_91) * u_xlat16_91 + 1.0;
    u_xlat16_91 = max(u_xlat16_91, 0.0);
    u_xlat16_91 = u_xlat16_91 * u_xlat16_91;
    u_xlat16_91 = u_xlat16_91 * u_xlat16_94;
    u_xlat16_91 = max(u_xlat16_35.x, u_xlat16_91);
    u_xlat16_91 = u_xlat16_64 * u_xlat16_91;
    u_xlat16_28.xyz = vec3(u_xlat16_91) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xzw = u_xlat12.xyz * vec3(u_xlat16_92) + u_xlat16_26.xyz;
    u_xlat58 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat11.xzw = vec3(u_xlat58) * u_xlat11.xzw;
    u_xlat58 = dot(u_xlat9.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_91 = dot(u_xlat16_26.xyz, u_xlat11.xzw);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat12.x = dot(u_xlat9.xyz, u_xlat16_26.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat16_92 = dot(u_xlat1.zxy, u_xlat11.xzw);
    u_xlat16_35.x = dot(u_xlat1.zxy, u_xlat16_26.xyz);
    u_xlat87 = dot(u_xlat23.xyz, u_xlat11.xzw);
    u_xlat11.x = dot(u_xlat23.xyz, u_xlat16_26.xyz);
    u_xlat21.x = u_xlat32.z * u_xlat16_92;
    u_xlat21.y = u_xlat87 * u_xlat32.x;
    u_xlat21.z = u_xlat58 * u_xlat99;
    u_xlat58 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat58 = max(u_xlat58, 6.10351563e-05);
    u_xlat58 = u_xlat99 / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat58;
    u_xlat58 = u_xlat97 * u_xlat58;
    u_xlat58 = min(u_xlat58, 16.0);
    u_xlat12.y = u_xlat32.x * u_xlat16_35.x;
    u_xlat12.z = u_xlat32.z * u_xlat11.x;
    u_xlat87 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat87 = sqrt(u_xlat87);
    u_xlat87 = u_xlat87 + u_xlat12.x;
    u_xlat87 = u_xlat87 + 6.10351563e-05;
    u_xlat87 = u_xlat96 * u_xlat87 + 6.10351563e-05;
    u_xlat87 = float(1.0) / u_xlat87;
    u_xlat32.x = (-u_xlat16_91) + 1.0;
    u_xlat16_91 = u_xlat32.x * u_xlat32.x;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_91 = u_xlat32.x * u_xlat16_91;
    u_xlat16_92 = u_xlat32.x * u_xlat16_91;
    u_xlat32.x = (-u_xlat16_91) * u_xlat32.x + 1.0;
    u_xlat11.xzw = u_xlat16_2.xyz * u_xlat32.xxx;
    u_xlat11.xzw = u_xlat20.xxx * vec3(u_xlat16_92) + u_xlat11.xzw;
    u_xlat16_26.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_26.xyz = u_xlat11.yyy * u_xlat16_26.xyz;
    u_xlat58 = u_xlat87 * u_xlat58;
    u_xlat11.xzw = u_xlat11.xzw * vec3(u_xlat58);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xzw = min(max(u_xlat11.xzw, 0.0), 1.0);
#else
    u_xlat11.xzw = clamp(u_xlat11.xzw, 0.0, 1.0);
#endif
    u_xlat11.xzw = u_xlat16_16.xyz * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat12.xxx * u_xlat11.xzw;
    u_xlat11.xzw = u_xlat16_28.xyz * u_xlat11.xzw;
    u_xlat16_16.xyz = u_xlat11.xzw * u_xlat11.yyy + u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_26.xyz * u_xlat12.xxx + u_xlat16_17.xyz;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_25.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_25.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_25.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_25.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati87 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_62.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat0.xxx * u_xlat16_28.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * u_xlat0.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_26.xyz = u_xlat16_28.xyz * u_xlat0.xxx + u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * _localDiffuseGI.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat16_100) * u_xlat16_25.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_25.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_25.xyw = u_xlat16_25.xxx * _IrradianceACCoeffs[u_xlati87].xyz + u_xlat16_28.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_25.xyz = u_xlat16_25.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_25.xyw;
    u_xlat16_28.xyz = u_xlat16_25.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_28.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_93>=0.0);
#else
    u_xlatb0 = u_xlat16_93>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_93);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat29.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat29.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_33.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_93)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_93) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_48.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_48.y = u_xlat1.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_48.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_62.x = u_xlat16_33.x + 1.0;
    u_xlat16_62.x = min(u_xlat16_62.x, 15.0);
    u_xlat16_91 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_62.x * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_1.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_91 * u_xlat16_33.x + u_xlat16_1.x;
    u_xlat16_33.x = u_xlat16_100 * u_xlat16_33.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat0.z * 0.5;
    u_xlat16_62.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat1.x * u_xlat16_62.x + u_xlat16_33.x;
    u_xlat16_62.x = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_91 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_91 + u_xlat16_62.x;
    u_xlat16_33.x = u_xlat0.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_3.z, u_xlat16_33.x);
    u_xlat16_62.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_62.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_92 = dot(u_xlat16_25.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_4.xzw * vec3(u_xlat16_92);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_4.xzw;
    u_xlat22.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_33.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_16.xyz;
    u_xlat16_91 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_91 = u_xlat16_1.w * _albedoColor.w + u_xlat16_91;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_91 : u_xlat16_89;
    u_xlat16_6.xyz = u_xlat16_16.xyz + u_xlat16_17.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb29 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb29 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb29)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_62.xy = (bool(u_xlatb29)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_62.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat29.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_29.xyz = texture(_FlowLightUpTex, u_xlat29.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_29.xyz * _FlowLightUpColor.xyz;
    u_xlat16_89 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_89) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_89 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_89) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
bool u_xlatb26;
float u_xlat28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_31;
vec3 u_xlat36;
mediump vec3 u_xlat16_43;
vec3 u_xlat44;
float u_xlat46;
vec2 u_xlat50;
mediump vec2 u_xlat16_50;
int u_xlati50;
mediump vec2 u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat61;
float u_xlat76;
mediump float u_xlat16_77;
float u_xlat78;
mediump float u_xlat16_78;
bool u_xlatb78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_84;
bool u_xlatb84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
float u_xlat94;
float u_xlat95;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_77 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_25.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_25.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat25.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_25.xyz = texture(_detailNormal, u_xlat25.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_25.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat25.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat1.xyz;
    u_xlat16_79 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_79) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat25.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat25.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat25.xyz, u_xlat9.xyz);
    u_xlat25.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat25.x = max(u_xlat25.x, 1.17549435e-38);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat9.xyz = u_xlat25.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_50.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.5<_anisoUse2U);
#else
    u_xlatb78 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb78)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_78 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat78 = u_xlat16_78 * 2.0 + -1.0;
    u_xlat16_80 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_56 = u_xlat16_80 + -1.0;
    u_xlat16_81 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_82 = u_xlat16_81 + -1.0;
    u_xlat84 = u_xlat78 * _sunShift + _sunShiftOffset;
    u_xlat84 = u_xlat84 + vs_TEXCOORD5;
    u_xlat85 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat85) + u_xlat1.xyz;
    u_xlat85 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat85);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz;
    u_xlat16_83 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_14.xyz = vec3(u_xlat16_83) * vs_TEXCOORD1.yzx;
    u_xlat3.x = u_xlat78 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat25.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_83 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_17.xyz = vec3(u_xlat16_83) * u_xlat16_17.xyz;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_87 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_87);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_54.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54.x = min(max(u_xlat16_54.x, 0.0), 1.0);
#else
    u_xlat16_54.x = clamp(u_xlat16_54.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_54.x * 0.5 + 0.5;
    u_xlat16_31.x = (-u_xlat16_54.x) + u_xlat16_31.x;
    u_xlat16_54.x = u_xlat16_43.z * u_xlat16_31.x + u_xlat16_54.x;
    u_xlat16_54.x = u_xlat16_43.z * u_xlat16_54.x;
    u_xlat16_54.x = u_xlat16_83 * u_xlat16_54.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat84) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat21.xyz = vec3(u_xlat28) * u_xlat21.xyz;
    u_xlat3.y = u_xlat16_80 * u_xlat16_4.x;
    u_xlat78 = (-u_xlat16_56) + 1.0;
    u_xlat3.w = u_xlat78 * u_xlat16_4.x;
    u_xlat16_80 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat85 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_31.x = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat86 = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat94 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat21.xyz;
    u_xlat3.x = u_xlat16_81 * u_xlat16_4.x;
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat95 = (-u_xlat16_82) + 1.0;
    u_xlat95 = u_xlat16_4.x * u_xlat95;
    u_xlat95 = max(u_xlat95, 0.00100000005);
    u_xlat11.x = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat36.x = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat61 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.x = u_xlat3.x * u_xlat95;
    u_xlat22.x = u_xlat16_80 * u_xlat95;
    u_xlat22.y = u_xlat3.x * u_xlat11.x;
    u_xlat22.z = u_xlat0.x * u_xlat21.x;
    u_xlat11.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat11.x = max(u_xlat11.x, 6.10351563e-05);
    u_xlat46 = u_xlat21.x * 0.318309873;
    u_xlat11.x = u_xlat21.x / u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat46 * u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat20.y = u_xlat85 * u_xlat3.x;
    u_xlat20.z = u_xlat36.x * u_xlat95;
    u_xlat36.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat36.x = sqrt(u_xlat36.x);
    u_xlat36.x = u_xlat36.x + u_xlat20.x;
    u_xlat36.x = u_xlat36.x + 6.10351563e-05;
    u_xlat19.y = u_xlat16_31.x * u_xlat3.x;
    u_xlat19.z = u_xlat61 * u_xlat95;
    u_xlat3.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat19.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat36.x * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat36.x = u_xlat3.w * u_xlat3.y;
    u_xlat21.x = u_xlat16_80 * u_xlat3.w;
    u_xlat21.y = u_xlat86 * u_xlat3.y;
    u_xlat21.z = u_xlat0.x * u_xlat36.x;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat61 = u_xlat36.x * 0.318309873;
    u_xlat0.x = u_xlat36.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat61 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat85 * u_xlat3.y;
    u_xlat20.z = u_xlat88 * u_xlat3.w;
    u_xlat85 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat20.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat19.y = u_xlat16_31.x * u_xlat3.y;
    u_xlat19.z = u_xlat94 * u_xlat3.w;
    u_xlat28 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat19.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat28 = u_xlat85 * u_xlat28 + 6.10351563e-05;
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat78 = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat78 * u_xlat78;
    u_xlat16_79 = u_xlat78 * u_xlat16_79;
    u_xlat16_79 = u_xlat78 * u_xlat16_79;
    u_xlat16_80 = u_xlat78 * u_xlat16_79;
    u_xlat85 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_79) * u_xlat78 + 1.0;
    u_xlat36.xyz = u_xlat16_2.xyz * vec3(u_xlat78);
    u_xlat36.xyz = vec3(u_xlat85) * vec3(u_xlat16_80) + u_xlat36.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat28;
    u_xlat44.xyz = u_xlat36.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xyz = min(max(u_xlat44.xyz, 0.0), 1.0);
#else
    u_xlat44.xyz = clamp(u_xlat44.xyz, 0.0, 1.0);
#endif
    u_xlat44.xyz = u_xlat16_15.xyz * u_xlat44.xyz;
    u_xlat44.xyz = u_xlat19.xxx * u_xlat44.xyz;
    u_xlat0.x = u_xlat11.x * u_xlat3.x;
    u_xlat3.xyw = u_xlat36.xyz * u_xlat0.xxx;
    u_xlat3.xyw = u_xlat16_16.xyz * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat19.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat3.xyw = u_xlat44.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat3.xyw;
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_29.z = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_29.xz = max(u_xlat16_29.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_80 = inversesqrt(u_xlat16_29.z);
    u_xlat16_15.xyz = vec3(u_xlat16_80) * u_xlat11.xyz;
    u_xlat16_31.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_31.zzz + u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_81);
    u_xlat16_81 = float(1.0) / float(u_xlat16_29.z);
    u_xlat16_79 = u_xlat16_29.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_81;
    u_xlat16_79 = max(u_xlat16_31.x, u_xlat16_79);
    u_xlat16_79 = u_xlat16_80 * u_xlat16_79;
    u_xlat16_16.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat50.xy = u_xlat16_50.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xy = min(max(u_xlat50.xy, 0.0), 1.0);
#else
    u_xlat50.xy = clamp(u_xlat50.xy, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat50.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_23.xyz * u_xlat19.xxx + u_xlat16_15.xyz;
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_80 = inversesqrt(u_xlat16_79);
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat11.xyz;
    u_xlat16_31.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_31.zzz + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_81);
    u_xlat16_81 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_81;
    u_xlat16_79 = max(u_xlat16_31.x, u_xlat16_79);
    u_xlat16_79 = u_xlat16_80 * u_xlat16_79;
    u_xlat16_23.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat50.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat85 = min(u_xlat16_54.x, 1.0);
    u_xlat11.x = min(u_xlat16_3.z, u_xlat85);
    u_xlat16_23.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat11.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat11.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat11.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat11.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat11.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat11.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_83) * u_xlat16_16.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyw;
    u_xlat16_24.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat0.xzw = vec3(u_xlat84) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat84 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb84 = !!(u_xlat16_56>=0.0);
#else
    u_xlatb84 = u_xlat16_56>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb84)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_56);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat25.xxx + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_4.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat25.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = u_xlat16_29.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_56)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_4.x = -abs(u_xlat16_56) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_43.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_29.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_0.w);
    u_xlat16_54.x = u_xlat16_29.x + 1.0;
    u_xlat16_54.x = min(u_xlat16_54.x, 15.0);
    u_xlat16_79 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_0.x = u_xlat16_29.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_54.x * 16.0 + u_xlat16_0.y;
    u_xlat16_29.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_84 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_29.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_84) + u_xlat16_10;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x + u_xlat16_84;
    u_xlat16_29.x = u_xlat16_83 * u_xlat16_29.x;
    u_xlat9.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat16_29.x * u_xlat9.x;
    u_xlat16_29.x = u_xlat85 * 0.5;
    u_xlat16_54.x = (-u_xlat85) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat9.x * u_xlat16_54.x + u_xlat16_29.x;
    u_xlat16_54.x = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_79 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_79 + u_xlat16_54.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat85;
    u_xlat16_29.x = min(u_xlat16_3.z, u_xlat16_29.x);
    u_xlat16_54.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_54.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_80 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_31.xyz = u_xlat16_4.xzw * vec3(u_xlat16_80);
    u_xlat16_4.xzw = (bool(u_xlatb1)) ? u_xlat16_31.xyz : u_xlat16_4.xzw;
    u_xlat20.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_29.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat3.xyw;
    u_xlat16_79 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_79 = u_xlat16_1.w * _albedoColor.w + u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_79 : u_xlat16_77;
    u_xlat16_6.xyz = u_xlat3.xyw + u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb26 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb26)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_54.xy = (bool(u_xlatb26)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_54.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat26.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_26.xyz = texture(_FlowLightUpTex, u_xlat26.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_26.xyz * _FlowLightUpColor.xyz;
    u_xlat16_77 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_77) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_77 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_77) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_77) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_77) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat76 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat76 * 0.0625 + u_xlat0.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat26.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat26.xy, 0.0).xyz;
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat76);
    u_xlat26.xyz = (-u_xlat16_3.xyz) + u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat26.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(11) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(12) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(13) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
mediump vec3 u_xlat16_9;
vec3 u_xlat10;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
vec3 u_xlat22;
mediump vec3 u_xlat16_23;
mediump vec3 u_xlat16_24;
vec3 u_xlat25;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
bool u_xlatb26;
float u_xlat28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_31;
vec3 u_xlat36;
mediump vec3 u_xlat16_43;
vec3 u_xlat44;
float u_xlat46;
vec2 u_xlat50;
mediump vec2 u_xlat16_50;
int u_xlati50;
mediump vec2 u_xlat16_54;
mediump float u_xlat16_56;
float u_xlat61;
float u_xlat76;
mediump float u_xlat16_77;
float u_xlat78;
mediump float u_xlat16_78;
bool u_xlatb78;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_84;
bool u_xlatb84;
float u_xlat85;
float u_xlat86;
mediump float u_xlat16_87;
float u_xlat88;
float u_xlat94;
float u_xlat95;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_77 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_25.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_25.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat25.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_25.xyz = texture(_detailNormal, u_xlat25.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_25.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat25.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat25.xyz = u_xlat25.xxx * u_xlat1.xyz;
    u_xlat16_79 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_79) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat25.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat25.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat25.xyz, u_xlat9.xyz);
    u_xlat25.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat25.x = max(u_xlat25.x, 1.17549435e-38);
    u_xlat25.x = inversesqrt(u_xlat25.x);
    u_xlat9.xyz = u_xlat25.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_50.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = inversesqrt(u_xlat16_79);
    u_xlat16_12.xyz = vec3(u_xlat16_79) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3.x = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3.x = u_xlat3.x * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb78 = !!(0.5<_anisoUse2U);
#else
    u_xlatb78 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb78)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_78 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat78 = u_xlat16_78 * 2.0 + -1.0;
    u_xlat16_80 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_56 = u_xlat16_80 + -1.0;
    u_xlat16_81 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_82 = u_xlat16_81 + -1.0;
    u_xlat84 = u_xlat78 * _sunShift + _sunShiftOffset;
    u_xlat84 = u_xlat84 + vs_TEXCOORD5;
    u_xlat85 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat85) + u_xlat1.xyz;
    u_xlat85 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat85 = inversesqrt(u_xlat85);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat85);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = u_xlat3.xxx * u_xlat13.xyz;
    u_xlat16_83 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_14.xyz = vec3(u_xlat16_83) * vs_TEXCOORD1.yzx;
    u_xlat3.x = u_xlat78 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat25.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_83 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_83 = inversesqrt(u_xlat16_83);
    u_xlat16_17.xyz = vec3(u_xlat16_83) * u_xlat16_17.xyz;
    u_xlat16_83 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_83 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    u_xlat16_83 = u_xlat16_83 + -1.0;
    u_xlat16_83 = _occlusionScale * u_xlat16_83 + 1.0;
    u_xlat16_87 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_87);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_29.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_54.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_54.x = min(max(u_xlat16_54.x, 0.0), 1.0);
#else
    u_xlat16_54.x = clamp(u_xlat16_54.x, 0.0, 1.0);
#endif
    u_xlat16_31.x = u_xlat16_54.x * 0.5 + 0.5;
    u_xlat16_31.x = (-u_xlat16_54.x) + u_xlat16_31.x;
    u_xlat16_54.x = u_xlat16_43.z * u_xlat16_31.x + u_xlat16_54.x;
    u_xlat16_54.x = u_xlat16_43.z * u_xlat16_54.x;
    u_xlat16_54.x = u_xlat16_83 * u_xlat16_54.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_79) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat84) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat28 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat28 = inversesqrt(u_xlat28);
    u_xlat21.xyz = vec3(u_xlat28) * u_xlat21.xyz;
    u_xlat3.y = u_xlat16_80 * u_xlat16_4.x;
    u_xlat78 = (-u_xlat16_56) + 1.0;
    u_xlat3.w = u_xlat78 * u_xlat16_4.x;
    u_xlat16_80 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat85 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_31.x = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat86 = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat88 = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat94 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat3.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat21.xyz = u_xlat3.xxx * u_xlat21.xyz;
    u_xlat3.x = u_xlat16_81 * u_xlat16_4.x;
    u_xlat3.xyw = max(u_xlat3.xyw, vec3(0.00100000005, 0.00100000005, 0.00100000005));
    u_xlat95 = (-u_xlat16_82) + 1.0;
    u_xlat95 = u_xlat16_4.x * u_xlat95;
    u_xlat95 = max(u_xlat95, 0.00100000005);
    u_xlat11.x = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat36.x = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat61 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.x = u_xlat3.x * u_xlat95;
    u_xlat22.x = u_xlat16_80 * u_xlat95;
    u_xlat22.y = u_xlat3.x * u_xlat11.x;
    u_xlat22.z = u_xlat0.x * u_xlat21.x;
    u_xlat11.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat11.x = max(u_xlat11.x, 6.10351563e-05);
    u_xlat46 = u_xlat21.x * 0.318309873;
    u_xlat11.x = u_xlat21.x / u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat46 * u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat20.y = u_xlat85 * u_xlat3.x;
    u_xlat20.z = u_xlat36.x * u_xlat95;
    u_xlat36.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat36.x = sqrt(u_xlat36.x);
    u_xlat36.x = u_xlat36.x + u_xlat20.x;
    u_xlat36.x = u_xlat36.x + 6.10351563e-05;
    u_xlat19.y = u_xlat16_31.x * u_xlat3.x;
    u_xlat19.z = u_xlat61 * u_xlat95;
    u_xlat3.x = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat3.x = sqrt(u_xlat3.x);
    u_xlat3.x = u_xlat3.x + u_xlat19.x;
    u_xlat3.x = u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = u_xlat36.x * u_xlat3.x + 6.10351563e-05;
    u_xlat3.x = float(1.0) / u_xlat3.x;
    u_xlat36.x = u_xlat3.w * u_xlat3.y;
    u_xlat21.x = u_xlat16_80 * u_xlat3.w;
    u_xlat21.y = u_xlat86 * u_xlat3.y;
    u_xlat21.z = u_xlat0.x * u_xlat36.x;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat61 = u_xlat36.x * 0.318309873;
    u_xlat0.x = u_xlat36.x / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat61 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat85 * u_xlat3.y;
    u_xlat20.z = u_xlat88 * u_xlat3.w;
    u_xlat85 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat85 = sqrt(u_xlat85);
    u_xlat85 = u_xlat85 + u_xlat20.x;
    u_xlat85 = u_xlat85 + 6.10351563e-05;
    u_xlat19.y = u_xlat16_31.x * u_xlat3.y;
    u_xlat19.z = u_xlat94 * u_xlat3.w;
    u_xlat28 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat28 = sqrt(u_xlat28);
    u_xlat28 = u_xlat28 + u_xlat19.x;
    u_xlat28 = u_xlat28 + 6.10351563e-05;
    u_xlat28 = u_xlat85 * u_xlat28 + 6.10351563e-05;
    u_xlat28 = float(1.0) / u_xlat28;
    u_xlat78 = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat78 * u_xlat78;
    u_xlat16_79 = u_xlat78 * u_xlat16_79;
    u_xlat16_79 = u_xlat78 * u_xlat16_79;
    u_xlat16_80 = u_xlat78 * u_xlat16_79;
    u_xlat85 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat85 = min(max(u_xlat85, 0.0), 1.0);
#else
    u_xlat85 = clamp(u_xlat85, 0.0, 1.0);
#endif
    u_xlat78 = (-u_xlat16_79) * u_xlat78 + 1.0;
    u_xlat36.xyz = u_xlat16_2.xyz * vec3(u_xlat78);
    u_xlat36.xyz = vec3(u_xlat85) * vec3(u_xlat16_80) + u_xlat36.xyz;
    u_xlat16_23.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat28;
    u_xlat44.xyz = u_xlat36.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat44.xyz = min(max(u_xlat44.xyz, 0.0), 1.0);
#else
    u_xlat44.xyz = clamp(u_xlat44.xyz, 0.0, 1.0);
#endif
    u_xlat44.xyz = u_xlat16_15.xyz * u_xlat44.xyz;
    u_xlat44.xyz = u_xlat19.xxx * u_xlat44.xyz;
    u_xlat0.x = u_xlat11.x * u_xlat3.x;
    u_xlat3.xyw = u_xlat36.xyz * u_xlat0.xxx;
    u_xlat3.xyw = u_xlat16_16.xyz * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat19.xxx * u_xlat3.xyw;
    u_xlat3.xyw = u_xlat3.xyw * _MainLightIntensityAndAngleScale.xyz;
    u_xlat3.xyw = u_xlat44.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat3.xyw;
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_29.z = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_29.xz = max(u_xlat16_29.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_80 = inversesqrt(u_xlat16_29.z);
    u_xlat16_15.xyz = vec3(u_xlat16_80) * u_xlat11.xyz;
    u_xlat16_31.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_31.zzz + u_xlat16_16.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_81);
    u_xlat16_81 = float(1.0) / float(u_xlat16_29.z);
    u_xlat16_79 = u_xlat16_29.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_81;
    u_xlat16_79 = max(u_xlat16_31.x, u_xlat16_79);
    u_xlat16_79 = u_xlat16_80 * u_xlat16_79;
    u_xlat16_16.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat50.xy = u_xlat16_50.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat50.xy = min(max(u_xlat50.xy, 0.0), 1.0);
#else
    u_xlat50.xy = clamp(u_xlat50.xy, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat50.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_23.xyz * u_xlat19.xxx + u_xlat16_15.xyz;
    u_xlat16_79 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_79));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_79);
#endif
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_79 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_79 = max(u_xlat16_79, 6.10351563e-05);
    u_xlat16_80 = inversesqrt(u_xlat16_79);
    u_xlat16_16.xyz = vec3(u_xlat16_80) * u_xlat11.xyz;
    u_xlat16_31.xz = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_23.xyz = u_xlat16_31.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_31.zzz + u_xlat16_23.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_80 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_81 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_81 = u_xlat16_81 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_81 = min(max(u_xlat16_81, 0.0), 1.0);
#else
    u_xlat16_81 = clamp(u_xlat16_81, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_80 = max(u_xlat16_80, u_xlat16_81);
    u_xlat16_81 = float(1.0) / float(u_xlat16_79);
    u_xlat16_79 = u_xlat16_79 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_79 = (-u_xlat16_79) * u_xlat16_79 + 1.0;
    u_xlat16_79 = max(u_xlat16_79, 0.0);
    u_xlat16_79 = u_xlat16_79 * u_xlat16_79;
    u_xlat16_79 = u_xlat16_79 * u_xlat16_81;
    u_xlat16_79 = max(u_xlat16_31.x, u_xlat16_79);
    u_xlat16_79 = u_xlat16_80 * u_xlat16_79;
    u_xlat16_23.xyz = vec3(u_xlat16_79) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat50.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat85 = min(u_xlat16_54.x, 1.0);
    u_xlat11.x = min(u_xlat16_3.z, u_xlat85);
    u_xlat16_23.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_23.xyz = u_xlat11.xxx * u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat11.xxx * u_xlat16_23.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_24.xyz = u_xlat11.xxx * u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat11.xxx * u_xlat16_24.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * u_xlat11.xxx + (-u_xlat16_24.xyz);
    u_xlat16_24.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_23.xyz = u_xlat16_24.xyz * u_xlat11.xxx + u_xlat16_23.xyz;
    u_xlat16_23.xyz = u_xlat16_23.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_83) * u_xlat16_16.xyz;
    u_xlati50 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_24.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati50].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_24.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyw;
    u_xlat16_24.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat0.xzw = vec3(u_xlat84) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat84 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat84);
#ifdef UNITY_ADRENO_ES3
    u_xlatb84 = !!(u_xlat16_56>=0.0);
#else
    u_xlatb84 = u_xlat16_56>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb84)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat11.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_56);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat25.xxx + u_xlat0.xzw;
    u_xlat0.xzw = u_xlat16_4.xxx * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_4.x = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat0.xzw = (-u_xlat0.xzw) * u_xlat16_4.xxx + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat25.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = u_xlat16_29.xxx * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_56)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_4.x = -abs(u_xlat16_56) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_43.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_29.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_29.xyz = min(max(u_xlat16_29.xyz, 0.0), 1.0);
#else
    u_xlat16_29.xyz = clamp(u_xlat16_29.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_29.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_29.x = floor(u_xlat16_0.w);
    u_xlat16_54.x = u_xlat16_29.x + 1.0;
    u_xlat16_54.x = min(u_xlat16_54.x, 15.0);
    u_xlat16_79 = u_xlat16_29.z * 15.0 + (-u_xlat16_29.x);
    u_xlat16_0.x = u_xlat16_29.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_54.x * 16.0 + u_xlat16_0.y;
    u_xlat16_29.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_84 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_29.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_29.xy = u_xlat16_29.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_29.xy).x;
    u_xlat16_29.x = (-u_xlat16_84) + u_xlat16_10;
    u_xlat16_29.x = u_xlat16_79 * u_xlat16_29.x + u_xlat16_84;
    u_xlat16_29.x = u_xlat16_83 * u_xlat16_29.x;
    u_xlat9.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat16_29.x * u_xlat9.x;
    u_xlat16_29.x = u_xlat85 * 0.5;
    u_xlat16_54.x = (-u_xlat85) * 0.5 + 1.0;
    u_xlat16_29.x = u_xlat9.x * u_xlat16_54.x + u_xlat16_29.x;
    u_xlat16_54.x = u_xlat16_29.x + u_xlat16_29.x;
    u_xlat16_79 = (-u_xlat16_29.x) * 2.0 + 1.0;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat16_79 + u_xlat16_54.x;
    u_xlat16_29.x = u_xlat16_29.x * u_xlat85;
    u_xlat16_29.x = min(u_xlat16_3.z, u_xlat16_29.x);
    u_xlat16_54.x = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_54.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_80 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_31.xyz = u_xlat16_4.xzw * vec3(u_xlat16_80);
    u_xlat16_4.xzw = (bool(u_xlatb1)) ? u_xlat16_31.xyz : u_xlat16_4.xzw;
    u_xlat20.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_29.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat3.xyw;
    u_xlat16_79 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_79 = u_xlat16_1.w * _albedoColor.w + u_xlat16_79;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_79 : u_xlat16_77;
    u_xlat16_6.xyz = u_xlat3.xyw + u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_23.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb26 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb26 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb26)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_54.xy = (bool(u_xlatb26)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_54.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat26.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_26.xyz = texture(_FlowLightUpTex, u_xlat26.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_26.xyz * _FlowLightUpColor.xyz;
    u_xlat16_77 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_77) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_77 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_77) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_1.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_77) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_1.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_77) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
    u_xlat1.xyz = u_xlat16_2.xyz * vec3(5.55555582, 5.55555582, 5.55555582) + vec3(0.0479959995, 0.0479959995, 0.0479959995);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.0734997839, 0.0734997839, 0.0734997839) + vec3(0.386036009, 0.386036009, 0.386036009);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat0.xw = u_xlat1.xz * vec2(15.0, 0.9375);
    u_xlat76 = floor(u_xlat0.x);
    u_xlat0.yz = u_xlat1.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat0.x = u_xlat76 * 0.0625 + u_xlat0.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat0.xz, 0.0).xyz;
    u_xlat26.xy = u_xlat0.xw + vec2(0.0625, 0.03125);
    u_xlat16_9.xyz = textureLod(_ACESLutTex, u_xlat26.xy, 0.0).xyz;
    u_xlat1.x = u_xlat1.x * 15.0 + (-u_xlat76);
    u_xlat26.xyz = (-u_xlat16_3.xyz) + u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat26.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat1.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(16) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
vec3 u_xlat30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
vec3 u_xlat39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
float u_xlat54;
bool u_xlatb54;
mediump vec2 u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat65;
float u_xlat66;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
float u_xlat90;
float u_xlat91;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_83 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormal, u_xlat27.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat27.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat1.xyz;
    u_xlat16_85 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_85) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat27.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat27.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat27.xyz, u_xlat9.xyz);
    u_xlat27.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat9.xyz = u_xlat27.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_85 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_13.xyz = vec3(u_xlat16_86) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb54 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat54 = (u_xlatb54) ? 1.0 : -1.0;
    u_xlat54 = u_xlat54 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.5<_anisoUse2U);
#else
    u_xlatb81 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb81)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_81 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat81 = u_xlat16_81 * 2.0 + -1.0;
    u_xlat16_60 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_87 = u_xlat16_60 + -1.0;
    u_xlat16_88 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_89 = u_xlat16_88 + -1.0;
    u_xlat3.x = u_xlat81 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat84 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat84) + u_xlat1.xyz;
    u_xlat84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat84);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat54) * u_xlat14.xyz;
    u_xlat16_94 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_15.xyz = vec3(u_xlat16_94) * vs_TEXCOORD1.yzx;
    u_xlat54 = u_xlat81 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat54 = u_xlat54 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_94 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat16_18.xyz;
    u_xlat16_94 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_94 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 + -1.0;
    u_xlat16_94 = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_58.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58.x = min(max(u_xlat16_58.x, 0.0), 1.0);
#else
    u_xlat16_58.x = clamp(u_xlat16_58.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_58.x * 0.5 + 0.5;
    u_xlat16_33.x = (-u_xlat16_58.x) + u_xlat16_33.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_33.x + u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_94 * u_xlat16_58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat81 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat81 = (-u_xlat81) * u_xlat81 + 1.0;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat81) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat81 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat81 = (-u_xlat0.x) + u_xlat81;
    u_xlat20.z = _ShadowBias.y * u_xlat81 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat81 = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat81 + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_85 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat16_86) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat12.xyz = vec3(u_xlat81) * u_xlat12.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat30.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat22.xyz = u_xlat30.xxx * u_xlat22.xyz;
    u_xlat30.x = u_xlat16_60 * u_xlat16_4.x;
    u_xlat84 = (-u_xlat16_87) + 1.0;
    u_xlat30.z = u_xlat84 * u_xlat16_4.x;
    u_xlat30.xz = max(u_xlat30.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_86 = dot(u_xlat1.zxy, u_xlat12.xyz);
    u_xlat90 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_33.x = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat91 = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat65 = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat92 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat54 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat22.xyz;
    u_xlat54 = u_xlat16_88 * u_xlat16_4.x;
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat93 = (-u_xlat16_89) + 1.0;
    u_xlat93 = u_xlat16_4.x * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat39.x = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = u_xlat54 * u_xlat93;
    u_xlat22.x = u_xlat16_86 * u_xlat93;
    u_xlat22.y = u_xlat54 * u_xlat12.x;
    u_xlat22.z = u_xlat81 * u_xlat95;
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat12.x = max(u_xlat12.x, 6.10351563e-05);
    u_xlat101 = u_xlat95 * 0.318309873;
    u_xlat12.x = u_xlat95 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat101 * u_xlat12.x;
    u_xlat12.x = min(u_xlat12.x, 16.0);
    u_xlat21.y = u_xlat90 * u_xlat54;
    u_xlat21.z = u_xlat39.x * u_xlat93;
    u_xlat39.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat39.x = sqrt(u_xlat39.x);
    u_xlat39.x = u_xlat39.x + u_xlat21.x;
    u_xlat39.x = u_xlat39.x + 6.10351563e-05;
    u_xlat20.y = u_xlat16_33.x * u_xlat54;
    u_xlat20.z = u_xlat66 * u_xlat93;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat20.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat39.x * u_xlat54 + 6.10351563e-05;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat39.x = u_xlat30.z * u_xlat30.x;
    u_xlat22.x = u_xlat30.z * u_xlat16_86;
    u_xlat22.y = u_xlat30.x * u_xlat91;
    u_xlat22.z = u_xlat81 * u_xlat39.x;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat91 = u_xlat39.x * 0.318309873;
    u_xlat81 = u_xlat39.x / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat91 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat21.y = u_xlat30.x * u_xlat90;
    u_xlat21.z = u_xlat30.z * u_xlat65;
    u_xlat90 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat90 + u_xlat21.x;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat20.y = u_xlat30.x * u_xlat16_33.x;
    u_xlat20.z = u_xlat30.z * u_xlat92;
    u_xlat30.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat20.x;
    u_xlat30.x = u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = u_xlat90 * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat84 = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat84 * u_xlat84;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_86 = u_xlat84 * u_xlat16_85;
    u_xlat90 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_85) * u_xlat84 + 1.0;
    u_xlat39.xyz = u_xlat16_2.xyz * vec3(u_xlat84);
    u_xlat39.xyz = vec3(u_xlat90) * vec3(u_xlat16_86) + u_xlat39.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat30.x;
    u_xlat47.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat16_16.xyz * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat20.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54 = u_xlat12.x * u_xlat54;
    u_xlat12.xyz = u_xlat39.xyz * vec3(u_xlat54);
    u_xlat12.xyz = u_xlat16_17.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat20.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_25.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat47.xyz * u_xlat16_25.xyz + u_xlat12.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat47.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_31.z = dot(u_xlat47.xyz, u_xlat47.xyz);
    u_xlat16_31.xz = max(u_xlat16_31.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_86 = inversesqrt(u_xlat16_31.z);
    u_xlat16_16.xyz = vec3(u_xlat16_86) * u_xlat47.xyz;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_33.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_31.z);
    u_xlat16_85 = u_xlat16_31.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat11.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat54) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_26.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat11.xzw;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_33.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.yyy * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat54) + u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati81 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_58.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat0.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat0.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat16_17.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati81].xyz + u_xlat16_26.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_17.xyw;
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb0 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_87);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat27.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_31.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_87)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat1.x * 0.5;
    u_xlat16_31.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_31.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_31.x = floor(u_xlat16_10.w);
    u_xlat16_58.x = u_xlat16_31.x + 1.0;
    u_xlat16_58.x = min(u_xlat16_58.x, 15.0);
    u_xlat16_85 = u_xlat16_31.z * 15.0 + (-u_xlat16_31.x);
    u_xlat16_10.x = u_xlat16_31.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_58.x * 16.0 + u_xlat16_10.y;
    u_xlat16_31.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_31.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_31.x = (-u_xlat16_1.x) + u_xlat16_28;
    u_xlat16_31.x = u_xlat16_85 * u_xlat16_31.x + u_xlat16_1.x;
    u_xlat16_31.x = u_xlat16_94 * u_xlat16_31.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat0.z * 0.5;
    u_xlat16_58.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_31.x = u_xlat1.x * u_xlat16_58.x + u_xlat16_31.x;
    u_xlat16_58.x = u_xlat16_31.x + u_xlat16_31.x;
    u_xlat16_85 = (-u_xlat16_31.x) * 2.0 + 1.0;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_85 + u_xlat16_58.x;
    u_xlat16_31.x = u_xlat0.z * u_xlat16_31.x;
    u_xlat16_31.x = min(u_xlat16_3.z, u_xlat16_31.x);
    u_xlat16_58.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_58.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_86 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_33.xyz = u_xlat16_4.xzw * vec3(u_xlat16_86);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat12.xyz;
    u_xlat16_85 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_85 = u_xlat16_1.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_83;
    u_xlat16_6.xyz = u_xlat12.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb27 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb27)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_58.xy = (bool(u_xlatb27)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_58.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat27.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_27.xyz = texture(_FlowLightUpTex, u_xlat27.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_27.xyz * _FlowLightUpColor.xyz;
    u_xlat16_83 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_83) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_83 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_3.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(13) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(14) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(15) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(16) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
vec3 u_xlat30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
vec3 u_xlat39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
float u_xlat54;
bool u_xlatb54;
mediump vec2 u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat65;
float u_xlat66;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
float u_xlat90;
float u_xlat91;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_83 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormal, u_xlat27.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat27.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat1.xyz;
    u_xlat16_85 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_85) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat27.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat27.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat27.xyz, u_xlat9.xyz);
    u_xlat27.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat9.xyz = u_xlat27.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_85 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_13.xyz = vec3(u_xlat16_86) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb54 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat54 = (u_xlatb54) ? 1.0 : -1.0;
    u_xlat54 = u_xlat54 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.5<_anisoUse2U);
#else
    u_xlatb81 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb81)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_81 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat81 = u_xlat16_81 * 2.0 + -1.0;
    u_xlat16_60 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_87 = u_xlat16_60 + -1.0;
    u_xlat16_88 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_89 = u_xlat16_88 + -1.0;
    u_xlat3.x = u_xlat81 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat84 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat84) + u_xlat1.xyz;
    u_xlat84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat84);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat54) * u_xlat14.xyz;
    u_xlat16_94 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_15.xyz = vec3(u_xlat16_94) * vs_TEXCOORD1.yzx;
    u_xlat54 = u_xlat81 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat54 = u_xlat54 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_94 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat16_18.xyz;
    u_xlat16_94 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_94 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 + -1.0;
    u_xlat16_94 = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_58.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58.x = min(max(u_xlat16_58.x, 0.0), 1.0);
#else
    u_xlat16_58.x = clamp(u_xlat16_58.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_58.x * 0.5 + 0.5;
    u_xlat16_33.x = (-u_xlat16_58.x) + u_xlat16_33.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_33.x + u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_94 * u_xlat16_58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat81 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat81 = (-u_xlat81) * u_xlat81 + 1.0;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat81) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat81 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat81 = (-u_xlat0.x) + u_xlat81;
    u_xlat20.z = _ShadowBias.y * u_xlat81 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat81 = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat81 + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_85 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat16_86) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat12.xyz = vec3(u_xlat81) * u_xlat12.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat30.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat22.xyz = u_xlat30.xxx * u_xlat22.xyz;
    u_xlat30.x = u_xlat16_60 * u_xlat16_4.x;
    u_xlat84 = (-u_xlat16_87) + 1.0;
    u_xlat30.z = u_xlat84 * u_xlat16_4.x;
    u_xlat30.xz = max(u_xlat30.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_86 = dot(u_xlat1.zxy, u_xlat12.xyz);
    u_xlat90 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_33.x = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat91 = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat65 = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat92 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat54 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat22.xyz;
    u_xlat54 = u_xlat16_88 * u_xlat16_4.x;
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat93 = (-u_xlat16_89) + 1.0;
    u_xlat93 = u_xlat16_4.x * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat39.x = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = u_xlat54 * u_xlat93;
    u_xlat22.x = u_xlat16_86 * u_xlat93;
    u_xlat22.y = u_xlat54 * u_xlat12.x;
    u_xlat22.z = u_xlat81 * u_xlat95;
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat12.x = max(u_xlat12.x, 6.10351563e-05);
    u_xlat101 = u_xlat95 * 0.318309873;
    u_xlat12.x = u_xlat95 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat101 * u_xlat12.x;
    u_xlat12.x = min(u_xlat12.x, 16.0);
    u_xlat21.y = u_xlat90 * u_xlat54;
    u_xlat21.z = u_xlat39.x * u_xlat93;
    u_xlat39.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat39.x = sqrt(u_xlat39.x);
    u_xlat39.x = u_xlat39.x + u_xlat21.x;
    u_xlat39.x = u_xlat39.x + 6.10351563e-05;
    u_xlat20.y = u_xlat16_33.x * u_xlat54;
    u_xlat20.z = u_xlat66 * u_xlat93;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat20.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat39.x * u_xlat54 + 6.10351563e-05;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat39.x = u_xlat30.z * u_xlat30.x;
    u_xlat22.x = u_xlat30.z * u_xlat16_86;
    u_xlat22.y = u_xlat30.x * u_xlat91;
    u_xlat22.z = u_xlat81 * u_xlat39.x;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat91 = u_xlat39.x * 0.318309873;
    u_xlat81 = u_xlat39.x / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat91 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat21.y = u_xlat30.x * u_xlat90;
    u_xlat21.z = u_xlat30.z * u_xlat65;
    u_xlat90 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat90 + u_xlat21.x;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat20.y = u_xlat30.x * u_xlat16_33.x;
    u_xlat20.z = u_xlat30.z * u_xlat92;
    u_xlat30.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat20.x;
    u_xlat30.x = u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = u_xlat90 * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat84 = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat84 * u_xlat84;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_86 = u_xlat84 * u_xlat16_85;
    u_xlat90 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_85) * u_xlat84 + 1.0;
    u_xlat39.xyz = u_xlat16_2.xyz * vec3(u_xlat84);
    u_xlat39.xyz = vec3(u_xlat90) * vec3(u_xlat16_86) + u_xlat39.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat30.x;
    u_xlat47.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat16_16.xyz * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat20.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54 = u_xlat12.x * u_xlat54;
    u_xlat12.xyz = u_xlat39.xyz * vec3(u_xlat54);
    u_xlat12.xyz = u_xlat16_17.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat20.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_25.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat47.xyz * u_xlat16_25.xyz + u_xlat12.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat47.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_31.z = dot(u_xlat47.xyz, u_xlat47.xyz);
    u_xlat16_31.xz = max(u_xlat16_31.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_86 = inversesqrt(u_xlat16_31.z);
    u_xlat16_16.xyz = vec3(u_xlat16_86) * u_xlat47.xyz;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_33.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_31.z);
    u_xlat16_85 = u_xlat16_31.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat11.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat54) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_26.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat11.xzw;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_33.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.yyy * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat54) + u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati81 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_58.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat0.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat0.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat16_17.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati81].xyz + u_xlat16_26.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_17.xyw;
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb0 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_87);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat27.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_31.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_87)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat1.x * 0.5;
    u_xlat16_31.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_31.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_31.x = floor(u_xlat16_10.w);
    u_xlat16_58.x = u_xlat16_31.x + 1.0;
    u_xlat16_58.x = min(u_xlat16_58.x, 15.0);
    u_xlat16_85 = u_xlat16_31.z * 15.0 + (-u_xlat16_31.x);
    u_xlat16_10.x = u_xlat16_31.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_58.x * 16.0 + u_xlat16_10.y;
    u_xlat16_31.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_31.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_31.x = (-u_xlat16_1.x) + u_xlat16_28;
    u_xlat16_31.x = u_xlat16_85 * u_xlat16_31.x + u_xlat16_1.x;
    u_xlat16_31.x = u_xlat16_94 * u_xlat16_31.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat0.z * 0.5;
    u_xlat16_58.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_31.x = u_xlat1.x * u_xlat16_58.x + u_xlat16_31.x;
    u_xlat16_58.x = u_xlat16_31.x + u_xlat16_31.x;
    u_xlat16_85 = (-u_xlat16_31.x) * 2.0 + 1.0;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_85 + u_xlat16_58.x;
    u_xlat16_31.x = u_xlat0.z * u_xlat16_31.x;
    u_xlat16_31.x = min(u_xlat16_3.z, u_xlat16_31.x);
    u_xlat16_58.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_58.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_86 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_33.xyz = u_xlat16_4.xzw * vec3(u_xlat16_86);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat12.xyz;
    u_xlat16_85 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_85 = u_xlat16_1.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_83;
    u_xlat16_6.xyz = u_xlat12.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb27 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb27)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_58.xy = (bool(u_xlatb27)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_58.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat27.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_27.xyz = texture(_FlowLightUpTex, u_xlat27.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_27.xyz * _FlowLightUpColor.xyz;
    u_xlat16_83 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_83) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_83 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.zxy) + _FogCol.zxy;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.zxy;
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
    u_xlat81 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat81 * 0.0625 + u_xlat1.y;
    u_xlat16_3.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat27.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_1.xyz = textureLod(_ACESLutTex, u_xlat27.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat81);
    u_xlat27.xyz = (-u_xlat16_3.xyz) + u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat27.xyz + u_xlat16_3.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
float u_xlat22;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
vec2 u_xlat27;
mediump vec3 u_xlat16_27;
bool u_xlatb27;
float u_xlat29;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_32;
vec2 u_xlat37;
mediump vec3 u_xlat16_44;
vec3 u_xlat45;
float u_xlat47;
vec2 u_xlat52;
mediump vec2 u_xlat16_52;
int u_xlati52;
mediump float u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat63;
mediump float u_xlat16_80;
float u_xlat81;
mediump float u_xlat16_81;
bool u_xlatb81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
float u_xlat88;
float u_xlat89;
mediump float u_xlat16_90;
float u_xlat91;
mediump float u_xlat16_92;
float u_xlat97;
float u_xlat98;
float u_xlat99;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_80 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_26.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_26.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat26.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_26.xyz = texture(_detailNormal, u_xlat26.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat26.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * u_xlat1.xyz;
    u_xlat16_82 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_82) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat26.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat26.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat26.xyz, u_xlat9.xyz);
    u_xlat26.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat9.xyz = u_xlat26.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_52.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_82 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_82 = inversesqrt(u_xlat16_82);
    u_xlat16_12.xyz = vec3(u_xlat16_82) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3 = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3 = u_xlat3 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.5<_anisoUse2U);
#else
    u_xlatb81 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb81)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_81 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat81 = u_xlat16_81 * 2.0 + -1.0;
    u_xlat16_83 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_58 = u_xlat16_83 + -1.0;
    u_xlat16_84 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_85 = u_xlat16_84 + -1.0;
    u_xlat87 = u_xlat81 * _sunShift + _sunShiftOffset;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat88 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat88) + u_xlat1.xyz;
    u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat88);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat3) * u_xlat13.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_14.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat3 = u_xlat81 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3 = u_xlat3 + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat26.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_86 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat16_17.xyz;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_86 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 + -1.0;
    u_xlat16_86 = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_90 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_90);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_30 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_30 = max(u_xlat16_30, 0.0078125);
    u_xlat16_56 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_32.x = (-u_xlat16_56) + u_xlat16_32.x;
    u_xlat16_56 = u_xlat16_44.z * u_xlat16_32.x + u_xlat16_56;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_56;
    u_xlat16_32.x = u_xlat16_86 * u_xlat16_32.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_82) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat87) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat29 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat21.xyz = vec3(u_xlat29) * u_xlat21.xyz;
    u_xlat29 = u_xlat16_83 * u_xlat16_4.x;
    u_xlat29 = max(u_xlat29, 0.00100000005);
    u_xlat81 = (-u_xlat16_58) + 1.0;
    u_xlat88 = u_xlat81 * u_xlat16_4.x;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat16_83 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat89 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_92 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat91 = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat97 = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat98 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.xyz = vec3(u_xlat3) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat99 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat99 = inversesqrt(u_xlat99);
    u_xlat21.xyz = vec3(u_xlat99) * u_xlat21.xyz;
    u_xlat99 = u_xlat16_84 * u_xlat16_4.x;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat22 = (-u_xlat16_85) + 1.0;
    u_xlat22 = u_xlat16_4.x * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat11.x = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat37.x = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat63 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.x = u_xlat99 * u_xlat22;
    u_xlat23.x = u_xlat16_83 * u_xlat22;
    u_xlat23.y = u_xlat11.x * u_xlat99;
    u_xlat23.z = u_xlat0.x * u_xlat21.x;
    u_xlat11.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat11.x = max(u_xlat11.x, 6.10351563e-05);
    u_xlat47 = u_xlat21.x * 0.318309873;
    u_xlat11.x = u_xlat21.x / u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat47 * u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat20.y = u_xlat89 * u_xlat99;
    u_xlat20.z = u_xlat37.x * u_xlat22;
    u_xlat37.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat37.x = sqrt(u_xlat37.x);
    u_xlat37.x = u_xlat37.x + u_xlat20.x;
    u_xlat19.y = u_xlat16_92 * u_xlat99;
    u_xlat19.z = u_xlat63 * u_xlat22;
    u_xlat63 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat37.y = u_xlat63 + u_xlat19.x;
    u_xlat37.xy = u_xlat37.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat37.x = u_xlat37.x * u_xlat37.y + 6.10351563e-05;
    u_xlat37.x = float(1.0) / u_xlat37.x;
    u_xlat63 = u_xlat29 * u_xlat88;
    u_xlat21.x = u_xlat16_83 * u_xlat88;
    u_xlat21.y = u_xlat29 * u_xlat91;
    u_xlat21.z = u_xlat0.x * u_xlat63;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat91 = u_xlat63 * 0.318309873;
    u_xlat0.x = u_xlat63 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat91 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat29 * u_xlat89;
    u_xlat20.z = u_xlat88 * u_xlat97;
    u_xlat63 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat20.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat19.y = u_xlat29 * u_xlat16_92;
    u_xlat19.z = u_xlat88 * u_xlat98;
    u_xlat88 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat19.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat88 = u_xlat63 * u_xlat88 + 6.10351563e-05;
    u_xlat88 = float(1.0) / u_xlat88;
    u_xlat63 = (-u_xlat16_90) + 1.0;
    u_xlat16_83 = u_xlat63 * u_xlat63;
    u_xlat16_83 = u_xlat63 * u_xlat16_83;
    u_xlat16_83 = u_xlat63 * u_xlat16_83;
    u_xlat16_84 = u_xlat63 * u_xlat16_83;
    u_xlat89 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_83) * u_xlat63 + 1.0;
    u_xlat45.xyz = u_xlat16_2.xyz * vec3(u_xlat63);
    u_xlat45.xyz = vec3(u_xlat89) * vec3(u_xlat16_84) + u_xlat45.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat88;
    u_xlat21.xyz = u_xlat45.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat16_15.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat19.xxx * u_xlat21.xyz;
    u_xlat0.x = u_xlat11.x * u_xlat37.x;
    u_xlat11.xyz = u_xlat45.xyz * u_xlat0.xxx;
    u_xlat11.xyz = u_xlat16_16.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat19.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat45.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_83 = dot(u_xlat45.xyz, u_xlat45.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_83);
    u_xlat16_15.xyz = vec3(u_xlat16_84) * u_xlat45.xyz;
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_84 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_85);
    u_xlat16_85 = float(1.0) / float(u_xlat16_83);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_85;
    u_xlat16_83 = max(u_xlat16_16.x, u_xlat16_83);
    u_xlat16_83 = u_xlat16_84 * u_xlat16_83;
    u_xlat16_16.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat52.xy = u_xlat16_52.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.xy = min(max(u_xlat52.xy, 0.0), 1.0);
#else
    u_xlat52.xy = clamp(u_xlat52.xy, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat52.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_24.xyz * u_xlat19.xxx + u_xlat16_15.xyz;
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_83 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_83);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat19.xyz;
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_85);
    u_xlat16_85 = float(1.0) / float(u_xlat16_83);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_85;
    u_xlat16_83 = max(u_xlat16_24.x, u_xlat16_83);
    u_xlat16_83 = u_xlat16_84 * u_xlat16_83;
    u_xlat16_24.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat52.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat88 = min(u_xlat16_32.x, 1.0);
    u_xlat89 = min(u_xlat16_3.z, u_xlat88);
    u_xlat16_24.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_24.xyz = vec3(u_xlat89) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat89) * u_xlat16_24.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat89) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat89) * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(u_xlat89) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_24.xyz = u_xlat16_25.xyz * vec3(u_xlat89) + u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_86) * u_xlat16_16.xyz;
    u_xlati52 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_25.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati52].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_25.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyw;
    u_xlat16_25.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat0.xzw = vec3(u_xlat87) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat87 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_58>=0.0);
#else
    u_xlatb87 = u_xlat16_58>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb87)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat13.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat13.xyz);
    u_xlat16_83 = u_xlat16_4.x * 8.0;
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_83 = u_xlat16_83 * abs(u_xlat16_58);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat26.xxx + u_xlat0.xzw;
    u_xlat0.xzw = vec3(u_xlat16_83) * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_83 = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_83) + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat26.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_30) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_58)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_83 = -abs(u_xlat16_58) * 0.800000012 + 1.0;
    u_xlat16_83 = u_xlat16_6.x * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_83);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_44.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_0.w);
    u_xlat16_58 = u_xlat16_32.x + 1.0;
    u_xlat16_58 = min(u_xlat16_58, 15.0);
    u_xlat16_84 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_58 * 16.0 + u_xlat16_0.y;
    u_xlat16_32.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_87) + u_xlat16_10;
    u_xlat16_32.x = u_xlat16_84 * u_xlat16_32.x + u_xlat16_87;
    u_xlat16_32.x = u_xlat16_86 * u_xlat16_32.x;
    u_xlat9.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat16_32.x * u_xlat9.x;
    u_xlat16_32.x = u_xlat88 * 0.5;
    u_xlat16_58 = (-u_xlat88) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat9.x * u_xlat16_58 + u_xlat16_32.x;
    u_xlat16_58 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_84 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_84 + u_xlat16_58;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat88;
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_32.x);
    u_xlat16_58 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_58;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_83);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_83 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_83) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb1)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat20.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat11.xyz;
    u_xlat16_83 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_83 = u_xlat16_1.w * _albedoColor.w + u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_83 : u_xlat16_80;
    u_xlat16_12.xyz = u_xlat11.xyz + u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz + u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb27 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_5.xy = (bool(u_xlatb27)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_57.xy = (bool(u_xlatb27)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_5.xy = u_xlat16_57.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat27.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_5.xy;
    u_xlat16_27.xyz = texture(_FlowLightUpTex, u_xlat27.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_27.xyz * _FlowLightUpColor.xyz;
    u_xlat16_80 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_80) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_80 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_5.xyz = vec3(u_xlat16_80) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + u_xlat16_2.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_80) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_80) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    }
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_2.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(3) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(4) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(5) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(6) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(7) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(12) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
ivec4 u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
float u_xlat3;
mediump vec4 u_xlat16_3;
bool u_xlatb3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump float u_xlat16_10;
vec3 u_xlat11;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat19;
vec3 u_xlat20;
vec3 u_xlat21;
float u_xlat22;
vec3 u_xlat23;
mediump vec3 u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_26;
vec2 u_xlat27;
mediump vec3 u_xlat16_27;
bool u_xlatb27;
float u_xlat29;
mediump float u_xlat16_30;
mediump vec3 u_xlat16_32;
vec2 u_xlat37;
mediump vec3 u_xlat16_44;
vec3 u_xlat45;
float u_xlat47;
vec2 u_xlat52;
mediump vec2 u_xlat16_52;
int u_xlati52;
mediump float u_xlat16_56;
mediump vec2 u_xlat16_57;
mediump float u_xlat16_58;
float u_xlat63;
mediump float u_xlat16_80;
float u_xlat81;
mediump float u_xlat16_81;
bool u_xlatb81;
mediump float u_xlat16_82;
mediump float u_xlat16_83;
mediump float u_xlat16_84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
float u_xlat87;
mediump float u_xlat16_87;
bool u_xlatb87;
float u_xlat88;
float u_xlat89;
mediump float u_xlat16_90;
float u_xlat91;
mediump float u_xlat16_92;
float u_xlat97;
float u_xlat98;
float u_xlat99;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_80 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_26.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_26.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat26.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_26.xyz = texture(_detailNormal, u_xlat26.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_26.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat26.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat26.xyz = u_xlat26.xxx * u_xlat1.xyz;
    u_xlat16_82 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_82) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat26.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat26.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat26.xyz, u_xlat9.xyz);
    u_xlat26.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat26.x = max(u_xlat26.x, 1.17549435e-38);
    u_xlat26.x = inversesqrt(u_xlat26.x);
    u_xlat9.xyz = u_xlat26.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_52.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_82 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_82 = inversesqrt(u_xlat16_82);
    u_xlat16_12.xyz = vec3(u_xlat16_82) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb3 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb3 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat3 = (u_xlatb3) ? 1.0 : -1.0;
    u_xlat3 = u_xlat3 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.5<_anisoUse2U);
#else
    u_xlatb81 = 0.5<_anisoUse2U;
#endif
    u_xlat13.xy = (bool(u_xlatb81)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat13.xy = u_xlat13.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_81 = texture(_anisotropicMap, u_xlat13.xy).x;
    u_xlat81 = u_xlat16_81 * 2.0 + -1.0;
    u_xlat16_83 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_58 = u_xlat16_83 + -1.0;
    u_xlat16_84 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_85 = u_xlat16_84 + -1.0;
    u_xlat87 = u_xlat81 * _sunShift + _sunShiftOffset;
    u_xlat87 = u_xlat87 + vs_TEXCOORD5;
    u_xlat88 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat88) + u_xlat1.xyz;
    u_xlat88 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat88 = inversesqrt(u_xlat88);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat88);
    u_xlat13.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat13.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat13.xyz);
    u_xlat13.xyz = vec3(u_xlat3) * u_xlat13.xyz;
    u_xlat16_86 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_14.xyz = vec3(u_xlat16_86) * vs_TEXCOORD1.yzx;
    u_xlat3 = u_xlat81 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat3 = u_xlat3 + vs_TEXCOORD5;
    u_xlat16_15.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_17.xyz = (-u_xlat10.xyz) * u_xlat26.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_17.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_17.xyz + u_xlat9.xyz;
    u_xlat16_86 = dot(u_xlat16_17.xyz, u_xlat16_17.xyz);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat16_17.xyz;
    u_xlat16_86 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_44.z = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_86 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_86 = min(max(u_xlat16_86, 0.0), 1.0);
#else
    u_xlat16_86 = clamp(u_xlat16_86, 0.0, 1.0);
#endif
    u_xlat16_86 = u_xlat16_86 + -1.0;
    u_xlat16_86 = _occlusionScale * u_xlat16_86 + 1.0;
    u_xlat16_90 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_90);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_30 = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_30 = max(u_xlat16_30, 0.0078125);
    u_xlat16_56 = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_32.x = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_32.x = (-u_xlat16_56) + u_xlat16_32.x;
    u_xlat16_56 = u_xlat16_44.z * u_xlat16_32.x + u_xlat16_56;
    u_xlat16_32.x = u_xlat16_44.z * u_xlat16_56;
    u_xlat16_32.x = u_xlat16_86 * u_xlat16_32.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_82) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat0.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat11.xyz = u_xlat0.xxx * u_xlat11.xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat19.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat19.x = min(max(u_xlat19.x, 0.0), 1.0);
#else
    u_xlat19.x = clamp(u_xlat19.x, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = vec3(u_xlat87) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat29 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat29 = inversesqrt(u_xlat29);
    u_xlat21.xyz = vec3(u_xlat29) * u_xlat21.xyz;
    u_xlat29 = u_xlat16_83 * u_xlat16_4.x;
    u_xlat29 = max(u_xlat29, 0.00100000005);
    u_xlat81 = (-u_xlat16_58) + 1.0;
    u_xlat88 = u_xlat81 * u_xlat16_4.x;
    u_xlat88 = max(u_xlat88, 0.00100000005);
    u_xlat16_83 = dot(u_xlat1.zxy, u_xlat11.xyz);
    u_xlat89 = dot(u_xlat1.zxy, u_xlat16_12.xyz);
    u_xlat16_92 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat91 = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat97 = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat98 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.xyz = vec3(u_xlat3) * u_xlat9.xyz + u_xlat13.zxy;
    u_xlat99 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat99 = inversesqrt(u_xlat99);
    u_xlat21.xyz = vec3(u_xlat99) * u_xlat21.xyz;
    u_xlat99 = u_xlat16_84 * u_xlat16_4.x;
    u_xlat99 = max(u_xlat99, 0.00100000005);
    u_xlat22 = (-u_xlat16_85) + 1.0;
    u_xlat22 = u_xlat16_4.x * u_xlat22;
    u_xlat22 = max(u_xlat22, 0.00100000005);
    u_xlat11.x = dot(u_xlat21.xyz, u_xlat11.xyz);
    u_xlat37.x = dot(u_xlat21.xyz, u_xlat16_12.xyz);
    u_xlat63 = dot(u_xlat21.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat21.x = u_xlat99 * u_xlat22;
    u_xlat23.x = u_xlat16_83 * u_xlat22;
    u_xlat23.y = u_xlat11.x * u_xlat99;
    u_xlat23.z = u_xlat0.x * u_xlat21.x;
    u_xlat11.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat11.x = max(u_xlat11.x, 6.10351563e-05);
    u_xlat47 = u_xlat21.x * 0.318309873;
    u_xlat11.x = u_xlat21.x / u_xlat11.x;
    u_xlat11.x = u_xlat11.x * u_xlat11.x;
    u_xlat11.x = u_xlat47 * u_xlat11.x;
    u_xlat11.x = min(u_xlat11.x, 16.0);
    u_xlat20.y = u_xlat89 * u_xlat99;
    u_xlat20.z = u_xlat37.x * u_xlat22;
    u_xlat37.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat37.x = sqrt(u_xlat37.x);
    u_xlat37.x = u_xlat37.x + u_xlat20.x;
    u_xlat19.y = u_xlat16_92 * u_xlat99;
    u_xlat19.z = u_xlat63 * u_xlat22;
    u_xlat63 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat37.y = u_xlat63 + u_xlat19.x;
    u_xlat37.xy = u_xlat37.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat37.x = u_xlat37.x * u_xlat37.y + 6.10351563e-05;
    u_xlat37.x = float(1.0) / u_xlat37.x;
    u_xlat63 = u_xlat29 * u_xlat88;
    u_xlat21.x = u_xlat16_83 * u_xlat88;
    u_xlat21.y = u_xlat29 * u_xlat91;
    u_xlat21.z = u_xlat0.x * u_xlat63;
    u_xlat0.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat0.x = max(u_xlat0.x, 6.10351563e-05);
    u_xlat91 = u_xlat63 * 0.318309873;
    u_xlat0.x = u_xlat63 / u_xlat0.x;
    u_xlat0.x = u_xlat0.x * u_xlat0.x;
    u_xlat0.x = u_xlat91 * u_xlat0.x;
    u_xlat0.x = min(u_xlat0.x, 16.0);
    u_xlat20.y = u_xlat29 * u_xlat89;
    u_xlat20.z = u_xlat88 * u_xlat97;
    u_xlat63 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat63 = sqrt(u_xlat63);
    u_xlat63 = u_xlat63 + u_xlat20.x;
    u_xlat63 = u_xlat63 + 6.10351563e-05;
    u_xlat19.y = u_xlat29 * u_xlat16_92;
    u_xlat19.z = u_xlat88 * u_xlat98;
    u_xlat88 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat88 = sqrt(u_xlat88);
    u_xlat88 = u_xlat88 + u_xlat19.x;
    u_xlat88 = u_xlat88 + 6.10351563e-05;
    u_xlat88 = u_xlat63 * u_xlat88 + 6.10351563e-05;
    u_xlat88 = float(1.0) / u_xlat88;
    u_xlat63 = (-u_xlat16_90) + 1.0;
    u_xlat16_83 = u_xlat63 * u_xlat63;
    u_xlat16_83 = u_xlat63 * u_xlat16_83;
    u_xlat16_83 = u_xlat63 * u_xlat16_83;
    u_xlat16_84 = u_xlat63 * u_xlat16_83;
    u_xlat89 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat89 = min(max(u_xlat89, 0.0), 1.0);
#else
    u_xlat89 = clamp(u_xlat89, 0.0, 1.0);
#endif
    u_xlat63 = (-u_xlat16_83) * u_xlat63 + 1.0;
    u_xlat45.xyz = u_xlat16_2.xyz * vec3(u_xlat63);
    u_xlat45.xyz = vec3(u_xlat89) * vec3(u_xlat16_84) + u_xlat45.xyz;
    u_xlat16_24.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat0.x = u_xlat0.x * u_xlat88;
    u_xlat21.xyz = u_xlat45.xyz * u_xlat0.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat21.xyz = min(max(u_xlat21.xyz, 0.0), 1.0);
#else
    u_xlat21.xyz = clamp(u_xlat21.xyz, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat16_15.xyz * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat19.xxx * u_xlat21.xyz;
    u_xlat0.x = u_xlat11.x * u_xlat37.x;
    u_xlat11.xyz = u_xlat45.xyz * u_xlat0.xxx;
    u_xlat11.xyz = u_xlat16_16.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat19.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat45.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_83 = dot(u_xlat45.xyz, u_xlat45.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_83);
    u_xlat16_15.xyz = vec3(u_xlat16_84) * u_xlat45.xyz;
    u_xlat16_16.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_16.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * u_xlat16_16.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_84 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_15.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_85);
    u_xlat16_85 = float(1.0) / float(u_xlat16_83);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_85;
    u_xlat16_83 = max(u_xlat16_16.x, u_xlat16_83);
    u_xlat16_83 = u_xlat16_84 * u_xlat16_83;
    u_xlat16_16.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat52.xy = u_xlat16_52.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat52.xy = min(max(u_xlat52.xy, 0.0), 1.0);
#else
    u_xlat52.xy = clamp(u_xlat52.xy, 0.0, 1.0);
#endif
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_15.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_15.xyz = u_xlat16_5.xyz * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_15.xyz = u_xlat52.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat0.xxx * u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_24.xyz * u_xlat19.xxx + u_xlat16_15.xyz;
    u_xlat16_83 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_83));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_83);
#endif
    u_xlat19.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_83 = dot(u_xlat19.xyz, u_xlat19.xyz);
    u_xlat16_83 = max(u_xlat16_83, 6.10351563e-05);
    u_xlat16_84 = inversesqrt(u_xlat16_83);
    u_xlat16_16.xyz = vec3(u_xlat16_84) * u_xlat19.xyz;
    u_xlat16_24.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_24.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_24.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb0 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_84 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_85 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_16.xyz);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_84 = max(u_xlat16_84, u_xlat16_85);
    u_xlat16_85 = float(1.0) / float(u_xlat16_83);
    u_xlat16_83 = u_xlat16_83 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_83 = (-u_xlat16_83) * u_xlat16_83 + 1.0;
    u_xlat16_83 = max(u_xlat16_83, 0.0);
    u_xlat16_83 = u_xlat16_83 * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * u_xlat16_85;
    u_xlat16_83 = max(u_xlat16_24.x, u_xlat16_83);
    u_xlat16_83 = u_xlat16_84 * u_xlat16_83;
    u_xlat16_24.xyz = vec3(u_xlat16_83) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat0.x = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat52.yyy * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_16.xyz * u_xlat0.xxx + u_xlat16_15.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_17.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_17.xz);
    u_xlat16_16.y = u_xlat16_17.y;
    u_xlati0.xzw = ivec3(uvec3(lessThan(u_xlat16_16.xxyz, vec4(0.0, 0.0, 0.0, 0.0)).xzw) * 0xFFFFFFFFu);
    u_xlati0.x = int(uint(uint(u_xlati0.x) & 1u));
    u_xlat88 = min(u_xlat16_32.x, 1.0);
    u_xlat89 = min(u_xlat16_3.z, u_xlat88);
    u_xlat16_24.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_24.xyz = vec3(u_xlat89) * u_xlat16_24.xyz;
    u_xlat16_24.xyz = vec3(u_xlat89) * u_xlat16_24.xyz;
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = vec3(u_xlat89) * u_xlat16_25.xyz;
    u_xlat16_25.xyz = vec3(u_xlat89) * u_xlat16_25.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * vec3(u_xlat89) + (-u_xlat16_25.xyz);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_24.xyz = u_xlat16_25.xyz * vec3(u_xlat89) + u_xlat16_24.xyz;
    u_xlat16_24.xyz = u_xlat16_24.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat16_86) * u_xlat16_16.xyz;
    u_xlati52 = int(int_bitfieldInsert(2,u_xlati0.z,0,1) );
    u_xlat16_25.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati52].xyz;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_25.xyz;
    u_xlati0.x = (u_xlati0.w != 0) ? 5 : 4;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati0.x].xyz + u_xlat16_16.xyw;
    u_xlat16_25.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat0.xzw = vec3(u_xlat87) * u_xlat16_14.xyz + u_xlat13.xyz;
    u_xlat87 = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat87 = inversesqrt(u_xlat87);
    u_xlat0.xzw = u_xlat0.xzw * vec3(u_xlat87);
#ifdef UNITY_ADRENO_ES3
    u_xlatb87 = !!(u_xlat16_58>=0.0);
#else
    u_xlatb87 = u_xlat16_58>=0.0;
#endif
    u_xlat0.xzw = (bool(u_xlatb87)) ? u_xlat0.xzw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * u_xlat0.xzw;
    u_xlat1.xyz = u_xlat0.wxz * u_xlat16_12.yzx + (-u_xlat1.xyz);
    u_xlat13.xyz = u_xlat0.xzw * u_xlat1.xyz;
    u_xlat0.xzw = u_xlat1.zxy * u_xlat0.zwx + (-u_xlat13.xyz);
    u_xlat16_83 = u_xlat16_4.x * 8.0;
    u_xlat16_83 = min(u_xlat16_83, 1.0);
    u_xlat16_83 = u_xlat16_83 * abs(u_xlat16_58);
    u_xlat0.xzw = (-u_xlat10.xyz) * u_xlat26.xxx + u_xlat0.xzw;
    u_xlat0.xzw = vec3(u_xlat16_83) * u_xlat0.xzw + u_xlat9.xyz;
    u_xlat1.x = dot(u_xlat0.xzw, u_xlat0.xzw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xzw = u_xlat0.xzw * u_xlat1.xxx;
    u_xlat16_83 = dot((-u_xlat16_12.xyz), u_xlat0.xzw);
    u_xlat16_83 = u_xlat16_83 + u_xlat16_83;
    u_xlat0.xzw = (-u_xlat0.xzw) * vec3(u_xlat16_83) + (-u_xlat16_12.xyz);
    u_xlat1.xyz = u_xlat10.xyz * u_xlat26.xxx + (-u_xlat0.xzw);
    u_xlat1.xyz = vec3(u_xlat16_30) * u_xlat1.xyz + u_xlat0.xzw;
    u_xlat10.xyz = u_xlat0.xzw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_58)) * u_xlat10.xyz + u_xlat1.xyz;
    u_xlat16_83 = -abs(u_xlat16_58) * 0.800000012 + 1.0;
    u_xlat16_83 = u_xlat16_6.x * u_xlat16_83;
    u_xlat16_83 = u_xlat16_83 * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_83);
    u_xlat0.x = dot(u_xlat16_17.xyz, u_xlat0.xzw);
    u_xlat16_44.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_44.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_44.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_0.w);
    u_xlat16_58 = u_xlat16_32.x + 1.0;
    u_xlat16_58 = min(u_xlat16_58, 15.0);
    u_xlat16_84 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_0.x = u_xlat16_32.x * 16.0 + u_xlat16_0.y;
    u_xlat16_12.x = u_xlat16_58 * 16.0 + u_xlat16_0.y;
    u_xlat16_32.xy = u_xlat16_0.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_87 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_0.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_10 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_87) + u_xlat16_10;
    u_xlat16_32.x = u_xlat16_84 * u_xlat16_32.x + u_xlat16_87;
    u_xlat16_32.x = u_xlat16_86 * u_xlat16_32.x;
    u_xlat9.x = dot(u_xlat16_17.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat9.x = u_xlat16_32.x * u_xlat9.x;
    u_xlat16_32.x = u_xlat88 * 0.5;
    u_xlat16_58 = (-u_xlat88) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat9.x * u_xlat16_58 + u_xlat16_32.x;
    u_xlat16_58 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_84 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_84 + u_xlat16_58;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat88;
    u_xlat16_32.x = min(u_xlat16_3.z, u_xlat16_32.x);
    u_xlat16_58 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_58;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_83);
    u_xlat16_12.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat1.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat1.xyz * u_xlat1.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb1 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_83 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_14.xyz = vec3(u_xlat16_83) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = (bool(u_xlatb1)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat20.y = u_xlat16_6.x;
    u_xlat16_1.xy = texture(_DfgTexture, u_xlat20.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_1.xxx + u_xlat16_1.yyy;
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_32.xxx * u_xlat16_2.xyz;
    u_xlat16_6.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.xyz = min(max(u_xlat16_6.xyz, 0.0), 1.0);
#else
    u_xlat16_6.xyz = clamp(u_xlat16_6.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat11.xyz;
    u_xlat16_83 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_83 = u_xlat16_1.w * _albedoColor.w + u_xlat16_83;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_83 = min(max(u_xlat16_83, 0.0), 1.0);
#else
    u_xlat16_83 = clamp(u_xlat16_83, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_83 : u_xlat16_80;
    u_xlat16_12.xyz = u_xlat11.xyz + u_xlat16_15.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_24.xyz + u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_1.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb27 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_5.xy = (bool(u_xlatb27)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_57.xy = (bool(u_xlatb27)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_5.xy = u_xlat16_57.xy + u_xlat16_5.xy;
    u_xlat16_5.xy = u_xlat16_5.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat27.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_5.xy;
    u_xlat16_27.xyz = texture(_FlowLightUpTex, u_xlat27.xy).xyz;
    u_xlat16_5.xyz = u_xlat16_27.xyz * _FlowLightUpColor.xyz;
    u_xlat16_80 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_5.xyz = vec3(u_xlat16_80) * u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_5.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb1 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb1){
        u_xlat16_1.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_80 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_5.xyz = vec3(u_xlat16_80) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_5.xyz = u_xlat16_1.xxx * u_xlat16_5.xyz + u_xlat16_2.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_80) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_5.xyz = u_xlat16_1.yyy * u_xlat16_6.xyz + u_xlat16_5.xyz;
        u_xlat16_6.xyz = vec3(u_xlat16_80) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_5.xyz);
        u_xlat16_2.xyz = u_xlat16_1.zzz * u_xlat16_6.xyz + u_xlat16_5.xyz;
    }
    u_xlat16_5.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_5.xyz + u_xlat16_2.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(15) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
vec3 u_xlat30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
vec3 u_xlat39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
float u_xlat54;
bool u_xlatb54;
mediump vec2 u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat65;
float u_xlat66;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
float u_xlat90;
float u_xlat91;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_83 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormal, u_xlat27.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat27.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat1.xyz;
    u_xlat16_85 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_85) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat27.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat27.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat27.xyz, u_xlat9.xyz);
    u_xlat27.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat9.xyz = u_xlat27.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_85 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_13.xyz = vec3(u_xlat16_86) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb54 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat54 = (u_xlatb54) ? 1.0 : -1.0;
    u_xlat54 = u_xlat54 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.5<_anisoUse2U);
#else
    u_xlatb81 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb81)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_81 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat81 = u_xlat16_81 * 2.0 + -1.0;
    u_xlat16_60 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_87 = u_xlat16_60 + -1.0;
    u_xlat16_88 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_89 = u_xlat16_88 + -1.0;
    u_xlat3.x = u_xlat81 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat84 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat84) + u_xlat1.xyz;
    u_xlat84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat84);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat54) * u_xlat14.xyz;
    u_xlat16_94 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_15.xyz = vec3(u_xlat16_94) * vs_TEXCOORD1.yzx;
    u_xlat54 = u_xlat81 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat54 = u_xlat54 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_94 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat16_18.xyz;
    u_xlat16_94 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_94 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 + -1.0;
    u_xlat16_94 = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_58.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58.x = min(max(u_xlat16_58.x, 0.0), 1.0);
#else
    u_xlat16_58.x = clamp(u_xlat16_58.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_58.x * 0.5 + 0.5;
    u_xlat16_33.x = (-u_xlat16_58.x) + u_xlat16_33.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_33.x + u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_94 * u_xlat16_58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat81 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat81 = (-u_xlat81) * u_xlat81 + 1.0;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat81) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat81 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat81 = (-u_xlat0.x) + u_xlat81;
    u_xlat20.z = _ShadowBias.y * u_xlat81 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat81 = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat81 + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_85 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat16_86) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat12.xyz = vec3(u_xlat81) * u_xlat12.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat30.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat22.xyz = u_xlat30.xxx * u_xlat22.xyz;
    u_xlat30.x = u_xlat16_60 * u_xlat16_4.x;
    u_xlat84 = (-u_xlat16_87) + 1.0;
    u_xlat30.z = u_xlat84 * u_xlat16_4.x;
    u_xlat30.xz = max(u_xlat30.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_86 = dot(u_xlat1.zxy, u_xlat12.xyz);
    u_xlat90 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_33.x = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat91 = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat65 = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat92 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat54 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat22.xyz;
    u_xlat54 = u_xlat16_88 * u_xlat16_4.x;
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat93 = (-u_xlat16_89) + 1.0;
    u_xlat93 = u_xlat16_4.x * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat39.x = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = u_xlat54 * u_xlat93;
    u_xlat22.x = u_xlat16_86 * u_xlat93;
    u_xlat22.y = u_xlat54 * u_xlat12.x;
    u_xlat22.z = u_xlat81 * u_xlat95;
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat12.x = max(u_xlat12.x, 6.10351563e-05);
    u_xlat101 = u_xlat95 * 0.318309873;
    u_xlat12.x = u_xlat95 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat101 * u_xlat12.x;
    u_xlat12.x = min(u_xlat12.x, 16.0);
    u_xlat21.y = u_xlat90 * u_xlat54;
    u_xlat21.z = u_xlat39.x * u_xlat93;
    u_xlat39.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat39.x = sqrt(u_xlat39.x);
    u_xlat39.x = u_xlat39.x + u_xlat21.x;
    u_xlat39.x = u_xlat39.x + 6.10351563e-05;
    u_xlat20.y = u_xlat16_33.x * u_xlat54;
    u_xlat20.z = u_xlat66 * u_xlat93;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat20.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat39.x * u_xlat54 + 6.10351563e-05;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat39.x = u_xlat30.z * u_xlat30.x;
    u_xlat22.x = u_xlat30.z * u_xlat16_86;
    u_xlat22.y = u_xlat30.x * u_xlat91;
    u_xlat22.z = u_xlat81 * u_xlat39.x;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat91 = u_xlat39.x * 0.318309873;
    u_xlat81 = u_xlat39.x / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat91 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat21.y = u_xlat30.x * u_xlat90;
    u_xlat21.z = u_xlat30.z * u_xlat65;
    u_xlat90 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat90 + u_xlat21.x;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat20.y = u_xlat30.x * u_xlat16_33.x;
    u_xlat20.z = u_xlat30.z * u_xlat92;
    u_xlat30.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat20.x;
    u_xlat30.x = u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = u_xlat90 * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat84 = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat84 * u_xlat84;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_86 = u_xlat84 * u_xlat16_85;
    u_xlat90 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_85) * u_xlat84 + 1.0;
    u_xlat39.xyz = u_xlat16_2.xyz * vec3(u_xlat84);
    u_xlat39.xyz = vec3(u_xlat90) * vec3(u_xlat16_86) + u_xlat39.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat30.x;
    u_xlat47.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat16_16.xyz * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat20.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54 = u_xlat12.x * u_xlat54;
    u_xlat12.xyz = u_xlat39.xyz * vec3(u_xlat54);
    u_xlat12.xyz = u_xlat16_17.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat20.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_25.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat47.xyz * u_xlat16_25.xyz + u_xlat12.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat47.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_31.z = dot(u_xlat47.xyz, u_xlat47.xyz);
    u_xlat16_31.xz = max(u_xlat16_31.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_86 = inversesqrt(u_xlat16_31.z);
    u_xlat16_16.xyz = vec3(u_xlat16_86) * u_xlat47.xyz;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_33.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_31.z);
    u_xlat16_85 = u_xlat16_31.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat11.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat54) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_26.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat11.xzw;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_33.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.yyy * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat54) + u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati81 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_58.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat0.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat0.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat16_17.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati81].xyz + u_xlat16_26.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_17.xyw;
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb0 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_87);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat27.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_31.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_87)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat1.x * 0.5;
    u_xlat16_31.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_31.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_31.x = floor(u_xlat16_10.w);
    u_xlat16_58.x = u_xlat16_31.x + 1.0;
    u_xlat16_58.x = min(u_xlat16_58.x, 15.0);
    u_xlat16_85 = u_xlat16_31.z * 15.0 + (-u_xlat16_31.x);
    u_xlat16_10.x = u_xlat16_31.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_58.x * 16.0 + u_xlat16_10.y;
    u_xlat16_31.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_31.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_31.x = (-u_xlat16_1.x) + u_xlat16_28;
    u_xlat16_31.x = u_xlat16_85 * u_xlat16_31.x + u_xlat16_1.x;
    u_xlat16_31.x = u_xlat16_94 * u_xlat16_31.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat0.z * 0.5;
    u_xlat16_58.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_31.x = u_xlat1.x * u_xlat16_58.x + u_xlat16_31.x;
    u_xlat16_58.x = u_xlat16_31.x + u_xlat16_31.x;
    u_xlat16_85 = (-u_xlat16_31.x) * 2.0 + 1.0;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_85 + u_xlat16_58.x;
    u_xlat16_31.x = u_xlat0.z * u_xlat16_31.x;
    u_xlat16_31.x = min(u_xlat16_3.z, u_xlat16_31.x);
    u_xlat16_58.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_58.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_86 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_33.xyz = u_xlat16_4.xzw * vec3(u_xlat16_86);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat12.xyz;
    u_xlat16_85 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_85 = u_xlat16_1.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_83;
    u_xlat16_6.xyz = u_xlat12.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb27 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb27)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_58.xy = (bool(u_xlatb27)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_58.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat27.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_27.xyz = texture(_FlowLightUpTex, u_xlat27.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_27.xyz * _FlowLightUpColor.xyz;
    u_xlat16_83 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_83) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_83 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
in mediump vec4 in_TEXCOORD0;
in mediump vec2 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
out mediump vec4 vs_TEXCOORD3;
out mediump vec4 vs_TEXCOORD4;
out mediump float vs_TEXCOORD5;
out highp vec3 vs_TEXCOORD7;
out highp vec3 vs_TEXCOORD8;
out highp vec3 vs_TEXCOORD9;
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
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18 = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat16_2.x = u_xlat18 * in_TANGENT0.w;
    vs_TEXCOORD2.w = u_xlat16_2.x;
    u_xlat1.xyz = in_TANGENT0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_TANGENT0.xxx + u_xlat1.xyz;
    u_xlat1.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_TANGENT0.zzz + u_xlat1.xyz;
    u_xlat18 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat18 = max(u_xlat18, 1.17549435e-38);
    u_xlat18 = inversesqrt(u_xlat18);
    u_xlat1.xyz = vec3(u_xlat18) * u_xlat1.xyz;
    vs_TEXCOORD2.xyz = u_xlat1.xyz;
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = in_TEXCOORD1.xy;
    u_xlat3.xyz = u_xlat0.zxy * u_xlat1.yzx;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat1.zxy + (-u_xlat3.xyz);
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat3.xyz;
    u_xlat3.xyz = u_xlat0.yzx * u_xlat16_2.zxy;
    u_xlat3.xyz = u_xlat16_2.yzx * u_xlat0.zxy + (-u_xlat3.xyz);
    u_xlat16_4.x = sin(in_TEXCOORD2.y);
    u_xlat16_5 = cos(in_TEXCOORD2.y);
    u_xlat16_4.xyz = u_xlat3.xyz * u_xlat16_4.xxx;
    u_xlat3.xyz = vec3(u_xlat16_5) * u_xlat0.xyz + u_xlat16_4.xyz;
    u_xlat16_20 = (-in_TEXCOORD2.x) * in_TEXCOORD2.x + 1.0;
    u_xlat16_20 = max(u_xlat16_20, 0.0);
    u_xlat16_20 = sqrt(u_xlat16_20);
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_20);
    u_xlat3.xyz = in_TEXCOORD2.xxx * u_xlat16_2.xyz + u_xlat3.xyz;
    vs_TEXCOORD4.xyz = u_xlat3.xyz;
    vs_TEXCOORD4.w = in_TEXCOORD2.z * 0.636619747;
#ifdef UNITY_ADRENO_ES3
    vs_TEXCOORD4.w = min(max(vs_TEXCOORD4.w, 0.0), 1.0);
#else
    vs_TEXCOORD4.w = clamp(vs_TEXCOORD4.w, 0.0, 1.0);
#endif
    vs_TEXCOORD5 = in_TEXCOORD0.z;
    vs_TEXCOORD7.x = u_xlat1.x;
    vs_TEXCOORD7.z = u_xlat0.x;
    vs_TEXCOORD7.y = u_xlat16_2.x;
    vs_TEXCOORD8.x = u_xlat1.y;
    vs_TEXCOORD9.x = u_xlat1.z;
    vs_TEXCOORD8.z = u_xlat0.y;
    vs_TEXCOORD9.z = u_xlat0.z;
    vs_TEXCOORD8.y = u_xlat16_2.y;
    vs_TEXCOORD9.y = u_xlat16_2.z;
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
uniform 	mediump vec4 _detailNormal_ST;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump float _detailNormalStrength;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightUpTex_ST;
uniform 	mediump vec4 _FlowLightUpColor;
uniform 	mediump vec4 _FlowLightUpFactory;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
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
UNITY_LOCATION(5) uniform mediump sampler2D _albedoMap;
UNITY_LOCATION(6) uniform mediump sampler2D _materialParamsMap;
UNITY_LOCATION(7) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(8) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(9) uniform mediump sampler2D _detailNormal;
UNITY_LOCATION(10) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMask;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _MaskTex;
UNITY_LOCATION(14) uniform mediump sampler2D _FlowLightUpTex;
UNITY_LOCATION(15) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
int u_xlati0;
bool u_xlatb0;
vec3 u_xlat1;
mediump vec4 u_xlat16_1;
mediump vec3 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
mediump vec4 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec3 u_xlat10;
mediump vec4 u_xlat16_10;
vec4 u_xlat11;
mediump vec3 u_xlat16_11;
ivec3 u_xlati11;
vec3 u_xlat12;
mediump vec3 u_xlat16_13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec4 u_xlat20;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
vec4 u_xlat24;
mediump vec3 u_xlat16_25;
mediump vec3 u_xlat16_26;
vec3 u_xlat27;
mediump vec3 u_xlat16_27;
bool u_xlatb27;
mediump float u_xlat16_28;
vec3 u_xlat30;
mediump vec3 u_xlat16_31;
mediump vec3 u_xlat16_33;
vec3 u_xlat39;
mediump vec3 u_xlat16_46;
vec3 u_xlat47;
float u_xlat54;
bool u_xlatb54;
mediump vec2 u_xlat16_58;
mediump float u_xlat16_60;
float u_xlat65;
float u_xlat66;
float u_xlat81;
mediump float u_xlat16_81;
int u_xlati81;
bool u_xlatb81;
mediump float u_xlat16_83;
float u_xlat84;
mediump float u_xlat16_85;
mediump float u_xlat16_86;
mediump float u_xlat16_87;
mediump float u_xlat16_88;
mediump float u_xlat16_89;
float u_xlat90;
float u_xlat91;
float u_xlat92;
float u_xlat93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_96;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0.x = texture(_anisotropicMask, vs_TEXCOORD3.xy).y;
    u_xlat16_1 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_2.xyz = u_xlat16_1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat16_1.xyz * u_xlat16_2.xyz;
    u_xlat16_3 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_4.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_4.xyz = u_xlat16_3.www * u_xlat16_4.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_5.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz;
    u_xlat16_83 = u_xlat16_1.w * _albedoColor.w;
    u_xlat16_6.xy = u_xlat16_3.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_27.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat27.xy = vs_TEXCOORD3.xy * _detailNormal_ST.xy + _detailNormal_ST.zw;
    u_xlat16_27.xyz = texture(_detailNormal, u_xlat27.xy).xyz;
    u_xlat16_8.xyz = u_xlat16_27.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat1.xy = u_xlat16_8.xy * vec2(vec2(_detailNormalStrength, _detailNormalStrength)) + u_xlat16_7.xy;
    u_xlat1.z = u_xlat16_7.z * u_xlat16_8.z;
    u_xlat27.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat27.xyz = u_xlat27.xxx * u_xlat1.xyz;
    u_xlat16_85 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_85) + vs_TEXCOORD2.yzx;
    u_xlat1.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat1.x = max(u_xlat1.x, 1.17549435e-38);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_7.xyz;
    u_xlat9.xyz = u_xlat1.xyz * vs_TEXCOORD1.zxy;
    u_xlat9.xyz = vs_TEXCOORD1.yzx * u_xlat1.yzx + (-u_xlat9.xyz);
    u_xlat9.xyz = u_xlat9.xzy * vs_TEXCOORD2.www;
    u_xlat10.x = u_xlat1.z;
    u_xlat10.y = u_xlat9.x;
    u_xlat10.z = vs_TEXCOORD1.x;
    u_xlat10.x = dot(u_xlat27.xyz, u_xlat10.xyz);
    u_xlat11.x = u_xlat1.x;
    u_xlat11.y = u_xlat9.z;
    u_xlat11.z = vs_TEXCOORD1.y;
    u_xlat10.y = dot(u_xlat27.xyz, u_xlat11.xyz);
    u_xlat9.x = u_xlat1.y;
    u_xlat9.z = vs_TEXCOORD1.z;
    u_xlat10.z = dot(u_xlat27.xyz, u_xlat9.xyz);
    u_xlat27.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat27.x = max(u_xlat27.x, 1.17549435e-38);
    u_xlat27.x = inversesqrt(u_xlat27.x);
    u_xlat9.xyz = u_xlat27.xxx * u_xlat10.xyz;
    u_xlat16_11.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_7.xyz = u_xlat16_11.xyz * _emissiveColor.xyz;
    u_xlat16_8.xyz = u_xlat16_7.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_8.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_11.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_85 = u_xlat16_11.z * _shadowStrength;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_86 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_86 = inversesqrt(u_xlat16_86);
    u_xlat16_13.xyz = vec3(u_xlat16_86) * u_xlat12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb54 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat54 = (u_xlatb54) ? 1.0 : -1.0;
    u_xlat54 = u_xlat54 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb81 = !!(0.5<_anisoUse2U);
#else
    u_xlatb81 = 0.5<_anisoUse2U;
#endif
    u_xlat3.xw = (bool(u_xlatb81)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat3.xw = u_xlat3.xw * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_81 = texture(_anisotropicMap, u_xlat3.xw).x;
    u_xlat81 = u_xlat16_81 * 2.0 + -1.0;
    u_xlat16_60 = dot(vec2(vec2(_anisotropicMultiplier, _anisotropicMultiplier)), u_xlat16_3.zz);
    u_xlat16_87 = u_xlat16_60 + -1.0;
    u_xlat16_88 = dot(vec2(_anisotropicMultiplier2nd), u_xlat16_3.zz);
    u_xlat16_89 = u_xlat16_88 + -1.0;
    u_xlat3.x = u_xlat81 * _sunShift + _sunShiftOffset;
    u_xlat3.x = u_xlat3.x + vs_TEXCOORD5;
    u_xlat84 = dot(u_xlat1.zxy, u_xlat9.xyz);
    u_xlat1.xyz = (-u_xlat9.yzx) * vec3(u_xlat84) + u_xlat1.xyz;
    u_xlat84 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat84 = inversesqrt(u_xlat84);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat84);
    u_xlat14.xyz = u_xlat1.yzx * u_xlat9.xyz;
    u_xlat14.xyz = u_xlat9.zxy * u_xlat1.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat54) * u_xlat14.xyz;
    u_xlat16_94 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_15.xyz = vec3(u_xlat16_94) * vs_TEXCOORD1.yzx;
    u_xlat54 = u_xlat81 * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat54 = u_xlat54 + vs_TEXCOORD5;
    u_xlat16_16.xyz = u_xlat16_0.xxx * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_0.xxx * _directSpecularColor2nd.xyz;
    u_xlat16_18.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_18.xyz + u_xlat9.xyz;
    u_xlat16_94 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat16_18.xyz;
    u_xlat16_94 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_46.z = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_94 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 + -1.0;
    u_xlat16_94 = _occlusionScale * u_xlat16_94 + 1.0;
    u_xlat16_96 = (-u_xlat16_3.y) * _metallicMultiplier + 1.0;
    u_xlat16_5.xyz = u_xlat16_5.xyz * vec3(u_xlat16_96);
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_2.xyz = u_xlat16_6.yyy * u_xlat16_2.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_6.x;
    u_xlat16_4.x = max(u_xlat16_4.x, 0.0078125);
    u_xlat16_31.x = u_xlat16_4.x * u_xlat16_4.x;
    u_xlat16_58.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_58.x = min(max(u_xlat16_58.x, 0.0), 1.0);
#else
    u_xlat16_58.x = clamp(u_xlat16_58.x, 0.0, 1.0);
#endif
    u_xlat16_33.x = u_xlat16_58.x * 0.5 + 0.5;
    u_xlat16_33.x = (-u_xlat16_58.x) + u_xlat16_33.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_33.x + u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_46.z * u_xlat16_58.x;
    u_xlat16_58.x = u_xlat16_94 * u_xlat16_58.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb0 = _ShadowBias.z!=0.0;
#endif
    u_xlat20.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat81 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat20.xyz = vec3(u_xlat81) * u_xlat20.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat20.xyz);
    u_xlat81 = (-u_xlat81) * u_xlat81 + 1.0;
    u_xlat81 = sqrt(u_xlat81);
    u_xlat81 = u_xlat81 * _ShadowBias.z;
    u_xlat20.xyz = (-u_xlat9.xyz) * vec3(u_xlat81) + vs_TEXCOORD0.xyz;
    u_xlat20.xyz = (bool(u_xlatb0)) ? u_xlat20.xyz : vs_TEXCOORD0.xyz;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat21;
    u_xlat21 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat21;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[1].yyyy;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[1].xxxx + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[1].zzzz + u_xlat22;
    u_xlat22 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[1].wwww + u_xlat22;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[2].yyyy;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[2].xxxx + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[2].zzzz + u_xlat23;
    u_xlat23 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[2].wwww + u_xlat23;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[3].yyyy;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[3].xxxx + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[3].zzzz + u_xlat24;
    u_xlat24 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[3].wwww + u_xlat24;
    u_xlat22 = u_xlat20.yyyy * u_xlat22;
    u_xlat21 = u_xlat21 * u_xlat20.xxxx + u_xlat22;
    u_xlat20 = u_xlat23 * u_xlat20.zzzz + u_xlat21;
    u_xlat20 = u_xlat24 + u_xlat20;
    u_xlat0.x = _ShadowBias.x / u_xlat20.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = (-u_xlat0.x) + u_xlat20.z;
    u_xlat81 = max((-u_xlat20.w), u_xlat0.x);
    u_xlat81 = (-u_xlat0.x) + u_xlat81;
    u_xlat20.z = _ShadowBias.y * u_xlat81 + u_xlat0.x;
    u_xlat20.xyz = u_xlat20.xyz / u_xlat20.www;
    u_xlat20.xyz = u_xlat20.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat20.w = max(u_xlat20.z, 9.99999975e-05);
    u_xlat16_33.x = (-_ShadowBias.w) + 1.0;
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat20.xyw + u_xlat21.xyz;
    vec3 txVec0 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat21.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec1 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat22.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec2 = vec3(u_xlat22.xy,u_xlat22.z);
    u_xlat21.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat22.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat22.z = 0.0;
    u_xlat20.xyz = u_xlat20.xyw + u_xlat22.xyz;
    vec3 txVec3 = vec3(u_xlat20.xy,u_xlat20.z);
    u_xlat21.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat0.x = dot(u_xlat21, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat81 = (-u_xlat16_33.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat81 + u_xlat16_33.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * u_xlat16_85 + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat12.xyz = u_xlat12.xyz * vec3(u_xlat16_86) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat81 = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat81 = inversesqrt(u_xlat81);
    u_xlat12.xyz = vec3(u_xlat81) * u_xlat12.xyz;
    u_xlat81 = dot(u_xlat9.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat81 = min(max(u_xlat81, 0.0), 1.0);
#else
    u_xlat81 = clamp(u_xlat81, 0.0, 1.0);
#endif
    u_xlat16_85 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    u_xlat20.x = dot(u_xlat9.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat20.x = min(max(u_xlat20.x, 0.0), 1.0);
#else
    u_xlat20.x = clamp(u_xlat20.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat9.xyz, u_xlat16_13.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = u_xlat3.xxx * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat30.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat30.x = inversesqrt(u_xlat30.x);
    u_xlat22.xyz = u_xlat30.xxx * u_xlat22.xyz;
    u_xlat30.x = u_xlat16_60 * u_xlat16_4.x;
    u_xlat84 = (-u_xlat16_87) + 1.0;
    u_xlat30.z = u_xlat84 * u_xlat16_4.x;
    u_xlat30.xz = max(u_xlat30.xz, vec2(0.00100000005, 0.00100000005));
    u_xlat16_86 = dot(u_xlat1.zxy, u_xlat12.xyz);
    u_xlat90 = dot(u_xlat1.zxy, u_xlat16_13.xyz);
    u_xlat16_33.x = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat91 = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat65 = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat92 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat9.xyz + u_xlat14.zxy;
    u_xlat54 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat22.xyz = vec3(u_xlat54) * u_xlat22.xyz;
    u_xlat54 = u_xlat16_88 * u_xlat16_4.x;
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat93 = (-u_xlat16_89) + 1.0;
    u_xlat93 = u_xlat16_4.x * u_xlat93;
    u_xlat93 = max(u_xlat93, 0.00100000005);
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat12.xyz);
    u_xlat39.x = dot(u_xlat22.xyz, u_xlat16_13.xyz);
    u_xlat66 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat95 = u_xlat54 * u_xlat93;
    u_xlat22.x = u_xlat16_86 * u_xlat93;
    u_xlat22.y = u_xlat54 * u_xlat12.x;
    u_xlat22.z = u_xlat81 * u_xlat95;
    u_xlat12.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat12.x = max(u_xlat12.x, 6.10351563e-05);
    u_xlat101 = u_xlat95 * 0.318309873;
    u_xlat12.x = u_xlat95 / u_xlat12.x;
    u_xlat12.x = u_xlat12.x * u_xlat12.x;
    u_xlat12.x = u_xlat101 * u_xlat12.x;
    u_xlat12.x = min(u_xlat12.x, 16.0);
    u_xlat21.y = u_xlat90 * u_xlat54;
    u_xlat21.z = u_xlat39.x * u_xlat93;
    u_xlat39.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat39.x = sqrt(u_xlat39.x);
    u_xlat39.x = u_xlat39.x + u_xlat21.x;
    u_xlat39.x = u_xlat39.x + 6.10351563e-05;
    u_xlat20.y = u_xlat16_33.x * u_xlat54;
    u_xlat20.z = u_xlat66 * u_xlat93;
    u_xlat54 = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat54 = u_xlat54 + u_xlat20.x;
    u_xlat54 = u_xlat54 + 6.10351563e-05;
    u_xlat54 = u_xlat39.x * u_xlat54 + 6.10351563e-05;
    u_xlat54 = float(1.0) / u_xlat54;
    u_xlat39.x = u_xlat30.z * u_xlat30.x;
    u_xlat22.x = u_xlat30.z * u_xlat16_86;
    u_xlat22.y = u_xlat30.x * u_xlat91;
    u_xlat22.z = u_xlat81 * u_xlat39.x;
    u_xlat81 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat81 = max(u_xlat81, 6.10351563e-05);
    u_xlat91 = u_xlat39.x * 0.318309873;
    u_xlat81 = u_xlat39.x / u_xlat81;
    u_xlat81 = u_xlat81 * u_xlat81;
    u_xlat81 = u_xlat91 * u_xlat81;
    u_xlat81 = min(u_xlat81, 16.0);
    u_xlat21.y = u_xlat30.x * u_xlat90;
    u_xlat21.z = u_xlat30.z * u_xlat65;
    u_xlat90 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat90 = sqrt(u_xlat90);
    u_xlat90 = u_xlat90 + u_xlat21.x;
    u_xlat90 = u_xlat90 + 6.10351563e-05;
    u_xlat20.y = u_xlat30.x * u_xlat16_33.x;
    u_xlat20.z = u_xlat30.z * u_xlat92;
    u_xlat30.x = dot(u_xlat20.xyz, u_xlat20.xyz);
    u_xlat30.x = sqrt(u_xlat30.x);
    u_xlat30.x = u_xlat30.x + u_xlat20.x;
    u_xlat30.x = u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = u_xlat90 * u_xlat30.x + 6.10351563e-05;
    u_xlat30.x = float(1.0) / u_xlat30.x;
    u_xlat84 = (-u_xlat16_85) + 1.0;
    u_xlat16_85 = u_xlat84 * u_xlat84;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_85 = u_xlat84 * u_xlat16_85;
    u_xlat16_86 = u_xlat84 * u_xlat16_85;
    u_xlat90 = u_xlat16_2.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat90 = min(max(u_xlat90, 0.0), 1.0);
#else
    u_xlat90 = clamp(u_xlat90, 0.0, 1.0);
#endif
    u_xlat84 = (-u_xlat16_85) * u_xlat84 + 1.0;
    u_xlat39.xyz = u_xlat16_2.xyz * vec3(u_xlat84);
    u_xlat39.xyz = vec3(u_xlat90) * vec3(u_xlat16_86) + u_xlat39.xyz;
    u_xlat16_25.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz + _shadowColor.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_26.xyz = u_xlat16_25.xyz * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat16_26.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat81 = u_xlat81 * u_xlat30.x;
    u_xlat47.xyz = u_xlat39.xyz * vec3(u_xlat81);
#ifdef UNITY_ADRENO_ES3
    u_xlat47.xyz = min(max(u_xlat47.xyz, 0.0), 1.0);
#else
    u_xlat47.xyz = clamp(u_xlat47.xyz, 0.0, 1.0);
#endif
    u_xlat47.xyz = u_xlat16_16.xyz * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat20.xxx * u_xlat47.xyz;
    u_xlat47.xyz = u_xlat47.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54 = u_xlat12.x * u_xlat54;
    u_xlat12.xyz = u_xlat39.xyz * vec3(u_xlat54);
    u_xlat12.xyz = u_xlat16_17.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat20.xxx * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat12.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat12.xyz = u_xlat16_25.xyz * u_xlat12.xyz;
    u_xlat12.xyz = u_xlat47.xyz * u_xlat16_25.xyz + u_xlat12.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat47.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_31.z = dot(u_xlat47.xyz, u_xlat47.xyz);
    u_xlat16_31.xz = max(u_xlat16_31.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_86 = inversesqrt(u_xlat16_31.z);
    u_xlat16_16.xyz = vec3(u_xlat16_86) * u_xlat47.xyz;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_17.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * u_xlat16_33.yyy + u_xlat16_17.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_16.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_31.z);
    u_xlat16_85 = u_xlat16_31.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_17.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat11.xy = u_xlat16_11.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.xy = min(max(u_xlat11.xy, 0.0), 1.0);
#else
    u_xlat11.xy = clamp(u_xlat11.xy, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_16.xyz = u_xlat16_5.xyz * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_16.xyz = u_xlat11.xxx * u_xlat16_16.xyz;
    u_xlat16_16.xyz = vec3(u_xlat54) * u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_26.xyz * u_xlat20.xxx + u_xlat16_16.xyz;
    u_xlat16_85 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.00100000005>=abs(u_xlat16_85));
#else
    u_xlatb54 = 0.00100000005>=abs(u_xlat16_85);
#endif
    u_xlat11.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_85 = dot(u_xlat11.xzw, u_xlat11.xzw);
    u_xlat16_85 = max(u_xlat16_85, 6.10351563e-05);
    u_xlat16_86 = inversesqrt(u_xlat16_85);
    u_xlat16_17.xyz = vec3(u_xlat16_86) * u_xlat11.xzw;
    u_xlat16_33.xy = (bool(u_xlatb54)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_25.xyz = u_xlat16_33.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_33.yyy + u_xlat16_25.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb54 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb54 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_86 = (u_xlatb54) ? 1.0 : 0.0;
    u_xlat16_60 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_60 = u_xlat16_60 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_60 = min(max(u_xlat16_60, 0.0), 1.0);
#else
    u_xlat16_60 = clamp(u_xlat16_60, 0.0, 1.0);
#endif
    u_xlat16_60 = u_xlat16_60 * u_xlat16_60;
    u_xlat16_86 = max(u_xlat16_86, u_xlat16_60);
    u_xlat16_60 = float(1.0) / float(u_xlat16_85);
    u_xlat16_85 = u_xlat16_85 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_85 = (-u_xlat16_85) * u_xlat16_85 + 1.0;
    u_xlat16_85 = max(u_xlat16_85, 0.0);
    u_xlat16_85 = u_xlat16_85 * u_xlat16_85;
    u_xlat16_85 = u_xlat16_85 * u_xlat16_60;
    u_xlat16_85 = max(u_xlat16_33.x, u_xlat16_85);
    u_xlat16_85 = u_xlat16_86 * u_xlat16_85;
    u_xlat16_25.xyz = vec3(u_xlat16_85) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat54 = dot(u_xlat9.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat11.yyy * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat54) + u_xlat16_16.xyz;
    u_xlat0.x = u_xlat0.x + -1.0;
    u_xlat0.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat0.xx + vec2(1.0, 1.0);
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_17.y = u_xlat16_18.y;
    u_xlati11.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati81 = int(uint(uint(u_xlati11.x) & 1u));
    u_xlat0.xz = min(u_xlat16_58.xx, u_xlat0.xz);
    u_xlat0.x = min(u_xlat0.x, u_xlat16_3.z);
    u_xlat16_25.xyz = u_xlat16_5.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat0.xxx * u_xlat16_25.xyz;
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_26.xyz = u_xlat0.xxx * u_xlat16_26.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * u_xlat0.xxx + (-u_xlat16_26.xyz);
    u_xlat16_26.xyz = u_xlat16_5.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_25.xyz = u_xlat16_26.xyz * u_xlat0.xxx + u_xlat16_25.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat16_17.xyz;
    u_xlati0 = int(int_bitfieldInsert(2,u_xlati11.y,0,1) );
    u_xlat16_26.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati0].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati81].xyz + u_xlat16_26.xyz;
    u_xlati0 = (u_xlati11.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati0].xyz + u_xlat16_17.xyw;
    u_xlat16_26.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_26.xyz;
    u_xlat3.xyw = u_xlat3.xxx * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat0.x = dot(u_xlat3.xyw, u_xlat3.xyw);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat3.xyw = u_xlat0.xxx * u_xlat3.xyw;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_87>=0.0);
#else
    u_xlatb0 = u_xlat16_87>=0.0;
#endif
    u_xlat1.xyz = (bool(u_xlatb0)) ? u_xlat3.xyw : u_xlat1.xyz;
    u_xlat3.xyw = u_xlat16_13.xyz * u_xlat1.xyz;
    u_xlat3.xyw = u_xlat1.zxy * u_xlat16_13.yzx + (-u_xlat3.xyw);
    u_xlat11.xyz = u_xlat1.xyz * u_xlat3.xyw;
    u_xlat1.xyz = u_xlat3.wxy * u_xlat1.yzx + (-u_xlat11.xyz);
    u_xlat16_4.x = u_xlat16_4.x * 8.0;
    u_xlat16_4.x = min(u_xlat16_4.x, 1.0);
    u_xlat16_4.x = u_xlat16_4.x * abs(u_xlat16_87);
    u_xlat1.xyz = (-u_xlat10.xyz) * u_xlat27.xxx + u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_4.xxx * u_xlat1.xyz + u_xlat9.xyz;
    u_xlat0.x = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat1.xyz = u_xlat0.xxx * u_xlat1.xyz;
    u_xlat16_4.x = dot((-u_xlat16_13.xyz), u_xlat1.xyz);
    u_xlat16_4.x = u_xlat16_4.x + u_xlat16_4.x;
    u_xlat1.xyz = (-u_xlat1.xyz) * u_xlat16_4.xxx + (-u_xlat16_13.xyz);
    u_xlat0.xyw = u_xlat10.xyz * u_xlat27.xxx + (-u_xlat1.xyz);
    u_xlat0.xyw = u_xlat16_31.xxx * u_xlat0.xyw + u_xlat1.xyz;
    u_xlat3.xyw = (-u_xlat0.xyw) + u_xlat1.xyz;
    u_xlat0.xyw = abs(vec3(u_xlat16_87)) * u_xlat3.xyw + u_xlat0.xyw;
    u_xlat16_4.x = -abs(u_xlat16_87) * 0.800000012 + 1.0;
    u_xlat16_4.x = u_xlat16_6.x * u_xlat16_4.x;
    u_xlat16_4.x = u_xlat16_4.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_4.x);
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat1.xyz);
    u_xlat16_46.x = u_xlat16_6.x * 1.09769487;
    u_xlat16_46.y = u_xlat1.x * 0.5;
    u_xlat16_31.xyz = u_xlat16_46.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_31.xyz = min(max(u_xlat16_31.xyz, 0.0), 1.0);
#else
    u_xlat16_31.xyz = clamp(u_xlat16_31.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_31.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_31.x = floor(u_xlat16_10.w);
    u_xlat16_58.x = u_xlat16_31.x + 1.0;
    u_xlat16_58.x = min(u_xlat16_58.x, 15.0);
    u_xlat16_85 = u_xlat16_31.z * 15.0 + (-u_xlat16_31.x);
    u_xlat16_10.x = u_xlat16_31.x * 16.0 + u_xlat16_10.y;
    u_xlat16_13.x = u_xlat16_58.x * 16.0 + u_xlat16_10.y;
    u_xlat16_31.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1.x = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_13.y = u_xlat16_10.z;
    u_xlat16_31.xy = u_xlat16_13.xy + vec2(0.5, 0.5);
    u_xlat16_31.xy = u_xlat16_31.xy * vec2(0.00390625, 0.0625);
    u_xlat16_28 = texture(_SpecularOcclusionLut3D, u_xlat16_31.xy).x;
    u_xlat16_31.x = (-u_xlat16_1.x) + u_xlat16_28;
    u_xlat16_31.x = u_xlat16_85 * u_xlat16_31.x + u_xlat16_1.x;
    u_xlat16_31.x = u_xlat16_94 * u_xlat16_31.x;
    u_xlat1.x = dot(u_xlat16_18.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat1.x = u_xlat1.x * u_xlat16_31.x;
    u_xlat16_31.x = u_xlat0.z * 0.5;
    u_xlat16_58.x = (-u_xlat0.z) * 0.5 + 1.0;
    u_xlat16_31.x = u_xlat1.x * u_xlat16_58.x + u_xlat16_31.x;
    u_xlat16_58.x = u_xlat16_31.x + u_xlat16_31.x;
    u_xlat16_85 = (-u_xlat16_31.x) * 2.0 + 1.0;
    u_xlat16_31.x = u_xlat16_31.x * u_xlat16_85 + u_xlat16_58.x;
    u_xlat16_31.x = u_xlat0.z * u_xlat16_31.x;
    u_xlat16_31.x = min(u_xlat16_3.z, u_xlat16_31.x);
    u_xlat16_58.x = dot(_IndirectCubemapRotationParams.xy, u_xlat0.xw);
    u_xlat0.w = dot(_IndirectCubemapRotationParams.zw, u_xlat0.xw);
    u_xlat0.x = u_xlat16_58.x;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat0.xyw, u_xlat16_4.x);
    u_xlat16_4.xzw = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_4.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_4.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_4.xzw = u_xlat16_4.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_86 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_33.xyz = u_xlat16_4.xzw * vec3(u_xlat16_86);
    u_xlat16_4.xzw = (bool(u_xlatb0)) ? u_xlat16_33.xyz : u_xlat16_4.xzw;
    u_xlat21.y = u_xlat16_6.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_4.xzw * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_31.xxx * u_xlat16_2.xyz;
    u_xlat16_4.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_4.xyz = min(max(u_xlat16_4.xyz, 0.0), 1.0);
#else
    u_xlat16_4.xyz = clamp(u_xlat16_4.xyz, 0.0, 1.0);
#endif
    u_xlat16_6.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat12.xyz;
    u_xlat16_85 = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_85 = u_xlat16_1.w * _albedoColor.w + u_xlat16_85;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_85 = min(max(u_xlat16_85, 0.0), 1.0);
#else
    u_xlat16_85 = clamp(u_xlat16_85, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_85 : u_xlat16_83;
    u_xlat16_6.xyz = u_xlat12.xyz + u_xlat16_16.xyz;
    u_xlat16_5.xyz = u_xlat16_5.xyz * u_xlat16_25.xyz + u_xlat16_6.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_4.xyz + u_xlat16_5.xyz;
    u_xlat16_2.xyz = u_xlat16_7.xyz * u_xlat16_8.xyz + u_xlat16_2.xyz;
    u_xlat16_0.x = texture(_MaskTex, vs_TEXCOORD3.xy).z;
#ifdef UNITY_ADRENO_ES3
    u_xlatb27 = !!(_UseFlowLight2U>=0.5);
#else
    u_xlatb27 = _UseFlowLight2U>=0.5;
#endif
    u_xlat16_4.xy = (bool(u_xlatb27)) ? vec2(0.0, 0.0) : vs_TEXCOORD3.xy;
    u_xlat16_58.xy = (bool(u_xlatb27)) ? vs_TEXCOORD3.zw : vec2(0.0, 0.0);
    u_xlat16_4.xy = u_xlat16_58.xy + u_xlat16_4.xy;
    u_xlat16_4.xy = u_xlat16_4.xy * _FlowLightUpTex_ST.xy + _FlowLightUpTex_ST.zw;
    u_xlat27.xy = _Time.yy * _FlowLightUpFactory.yz + u_xlat16_4.xy;
    u_xlat16_27.xyz = texture(_FlowLightUpTex, u_xlat27.xy).xyz;
    u_xlat16_4.xyz = u_xlat16_27.xyz * _FlowLightUpColor.xyz;
    u_xlat16_83 = max(_FlowLightUpFactory.x, 0.0);
    u_xlat16_4.xyz = vec3(u_xlat16_83) * u_xlat16_4.xyz;
    u_xlat16_2.xyz = u_xlat16_4.xyz * u_xlat16_0.xxx + u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_83 = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_4.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_2.xyz);
        u_xlat16_4.xyz = u_xlat16_0.xxx * u_xlat16_4.xyz + u_xlat16_2.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_4.xyz = u_xlat16_0.yyy * u_xlat16_5.xyz + u_xlat16_4.xyz;
        u_xlat16_5.xyz = vec3(u_xlat16_83) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_4.xyz);
        u_xlat16_2.xyz = u_xlat16_0.zzz * u_xlat16_5.xyz + u_xlat16_4.xyz;
    }
    u_xlat16_4.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_4.xyz + u_xlat16_2.xyz;
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
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 81742
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
CustomEditor "CodeGenShaderGUI.Theseus_Pbr_Anisotropic_DoubleFlowLight_Glitter_DetailNormalGUI"
}