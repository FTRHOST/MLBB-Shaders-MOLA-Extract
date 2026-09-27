//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Theseus/Lit/PBR(Anisotropic MultiSpecular Width Control)" {
Properties {

[Header(PBR_Common)] _SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

_ACESLutTex ("ACES Lut", 2D) = "white" { }

_specularAlphaMode ("高光透明模式", Float) = 1.0

_renderingMode ("render mode", Float) = 0.0

_cutoff ("CutOff阈值", Range(0, 1)) = 0.0

[Header(Basic)] [Tex] _albedoMap ("Albedo贴图", 2D) = "white" { }

_albedoColor ("Albedo颜色", Color) = (1,1,1,1)

[Tex] _materialParamsMap ("RMO贴图", 2D) = "white" { }

[Tex] _normalMap ("法线贴图", 2D) = "bump" { }

_metallicMultiplier ("金属度", Range(0, 1)) = 1.0

_roughnessMultiplier ("粗糙度", Range(0, 1)) = 1.0

[Header(Emission)] [Tex] _emissiveMap ("自发光贴图", 2D) = "white" { }

_emissiveColor ("自发光颜色", Color) = (0,0,0,1)

[Header(Environment)] _indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("本地漫反射GI", Vector) = (1,1,1,1)

_occlusionScale ("AO强度", Range(0, 1)) = 1.0

_shadowStrengthMap ("阴影强度贴图", 2D) = "white" { }

_shadowStrength ("阴影强度", Range(0, 3)) = 1.0

_shadowColor ("阴影颜色", Color) = (0,0,0,0)

[Toggle] _anisoUse2U ("各向异性使用2U", Float) = 0.0

_anisotropicMap ("各向异性贴图", 2D) = "white" { }

_HighlightColorMask ("各向异性颜色遮罩", 2D) = "white" { }

[Toggle] _highlightColorMaskUse2U ("各向异性颜色遮罩使用2U", Float) = 0.0

_directSpecularColor ("direct specular color 01", Color) = (1,1,1,1)

_sunShift ("sunShift_01", Range(-1, 1)) = 0.0

_sunShiftOffset ("sunShiftOffset_01", Float) = 1.0

_AnisotropicStrength_1 ("各向异性程度", Range(-1, 1)) = 0.0

_HighLightWidthMultiply_1 ("高光宽度控制，基准值为0", Range(-1, 0.7)) = 0.0

_directSpecularColor2nd ("direct specular color 02", Color) = (1,1,1,1)

_sunShift2nd ("sunShift_02", Range(-1, 1)) = 1.0

_sunShiftOffset2nd ("sunShiftOffset_02", Float) = 1.0

_AnisotropicStrength_2 ("各向异性程度", Range(-1, 1)) = 0.0

_HighLightWidthMultiply_2 ("高光宽度控制，基准值为0", Range(-1, 0.7)) = 0.0

_sunShift_special_01 ("高光特殊偏移-区域1", Float) = 0.0

_sunShift_special_02 ("高光特殊偏移-区域2", Float) = 0.0

_HighlightSpecialAreaMask ("特殊偏移遮罩(R：区域1，G：区域2)", 2D) = "Black" { }

[Toggle] _highlightSpecialAreaMaskUse2U ("特殊偏移遮罩使用2U", Float) = 0.0

_blend ("__blend", Float) = 0.0

_cull ("__cull", Float) = 2.0

_srcblend ("__src", Float) = 1.0

_dstblend ("__dst", Float) = 0.0

_srcblendalpha ("__srcA", Float) = 1.0

_dstblendalpha ("__dstA", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

_alphatomask ("__alphaToMask", Float) = 0.0

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
 ZWrite Off
 Cull Off
  GpuProgramID 60242
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
vec3 u_xlat33;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
float u_xlat82;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
bool u_xlatb109;
float u_xlat110;
mediump float u_xlat16_111;
float u_xlat113;
mediump float u_xlat16_114;
mediump float u_xlat16_116;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_102 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_102 = inversesqrt(u_xlat16_102);
    u_xlat16_12.xyz = vec3(u_xlat16_102) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_103;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_103 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_15.xyz = vec3(u_xlat16_103) * vs_TEXCOORD1.yzx;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_103;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_103 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_19.xyz = vec3(u_xlat16_103) * u_xlat16_19.xyz;
    u_xlat16_103 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_71 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_71);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_69 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69) + u_xlat16_38.x;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_69;
    u_xlat16_69 = u_xlat16_103 * u_xlat16_69;
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat35.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat16.xyz = u_xlat35.xxx * u_xlat16.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.x = min(max(u_xlat16_38.x, 0.0), 1.0);
#else
    u_xlat16_38.x = clamp(u_xlat16_38.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat107 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat23.xyz = vec3(u_xlat107) * u_xlat23.xyz;
    u_xlat107 = (-u_xlat16_3.x) + 1.0;
    u_xlat76.x = abs(_AnisotropicStrength_1) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb109 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb109 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb109) ? u_xlat76.x : u_xlat16_3.x;
    u_xlat25 = (u_xlatb109) ? u_xlat16_3.x : u_xlat76.x;
    u_xlat24 = u_xlat32;
    u_xlat16_71 = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat109 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat113 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb107 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb107) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb107) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat107 = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_71 * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat35.x * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat35.z = max(u_xlat101, 0.0);
    u_xlat22.y = u_xlat76.x * u_xlat27.x;
    u_xlat22.z = u_xlat107 * u_xlat26.x;
    u_xlat107 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat22.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat107 = u_xlat107 * u_xlat16.x + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_71 * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat109 = u_xlat16_106 * u_xlat109;
    u_xlat109 = min(u_xlat109, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat109 * u_xlat25;
    u_xlat26.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat109 = u_xlat49 * 0.318309873;
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.xz = min(u_xlat35.xz, vec2(16.0, 16.0));
    u_xlat22.y = u_xlat76.x * u_xlat25;
    u_xlat22.z = u_xlat110 * u_xlat24;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat113 * u_xlat24;
    u_xlat110 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat110 = sqrt(u_xlat110);
    u_xlat110 = u_xlat110 + u_xlat21.x;
    u_xlat110 = u_xlat110 + 6.10351563e-05;
    u_xlat110 = u_xlat76.x * u_xlat110 + 6.10351563e-05;
    u_xlat110 = float(1.0) / u_xlat110;
    u_xlat113 = (-u_xlat16_38.x) + 1.0;
    u_xlat16_38.x = u_xlat113 * u_xlat113;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_71 = u_xlat113 * u_xlat16_38.x;
    u_xlat16.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat113 = (-u_xlat16_38.x) * u_xlat113 + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * vec3(u_xlat113);
    u_xlat54.xyz = u_xlat16.xxx * vec3(u_xlat16_71) + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat35.x = u_xlat35.x * u_xlat110;
    u_xlat57.xyz = u_xlat54.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat35.x = u_xlat35.z * u_xlat107;
    u_xlat54.xyz = u_xlat54.xyz * u_xlat35.xxx;
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat54.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_111 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat57.xyz;
    u_xlat16_29.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_30.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_29.yyy + u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_29.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_29.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat57.xyz = u_xlat35.xxx * u_xlat57.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_116 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat110 = u_xlat16_105 * u_xlat16_114;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat27.x = u_xlat110 * u_xlat24;
    u_xlat27.y = u_xlat101 * u_xlat25;
    u_xlat27.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat26.y = u_xlat16_116 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat26.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_111) + 1.0;
    u_xlat16_111 = u_xlat107 * u_xlat107;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_114 = u_xlat107 * u_xlat16_111;
    u_xlat107 = (-u_xlat16_111) * u_xlat107 + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat57.xyz = u_xlat16.xxx * vec3(u_xlat16_114) + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat57.xyz = u_xlat57.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_111 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat21.xyz;
    u_xlat16_30.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_30.yyy + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_30.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_30.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat11.xyz = u_xlat35.xxx * u_xlat11.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat10.x = u_xlat16_105 * u_xlat16_111;
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat11.x = u_xlat10.x * u_xlat24;
    u_xlat11.y = u_xlat101 * u_xlat25;
    u_xlat11.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat21.y = u_xlat16_114 * u_xlat25;
    u_xlat21.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat21.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat107 * u_xlat107;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_105 = u_xlat107 * u_xlat16_102;
    u_xlat107 = (-u_xlat16_102) * u_xlat107 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat10.xzw = u_xlat16.xxx * vec3(u_xlat16_105) + u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat10.xzw = u_xlat10.xzw * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_30.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_38.xyz = u_xlat16_17.xyz * u_xlat21.xxx + u_xlat16_38.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati35 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat101 = min(u_xlat16_69, 1.0);
    u_xlat107 = min(u_xlat101, u_xlat16_2.z);
    u_xlat16_29.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(u_xlat107) + (-u_xlat16_30.xyz);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_29.xyz = u_xlat16_30.xyz * vec3(u_xlat107) + u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_103) * u_xlat16_17.xyz;
    u_xlati107 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_30.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati107].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_30.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_17.xyw;
    u_xlat16_30.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69 = u_xlat16_36.x + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69 * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_103 * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat101 * 0.5;
    u_xlat16_69 = (-u_xlat101) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69 + u_xlat16_36.x;
    u_xlat16_69 = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69;
    u_xlat16_36.x = u_xlat101 * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_38.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat99 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat99 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat33.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat33.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat99);
    u_xlat33.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat33.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
vec3 u_xlat33;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
float u_xlat82;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
bool u_xlatb109;
float u_xlat110;
mediump float u_xlat16_111;
float u_xlat113;
mediump float u_xlat16_114;
mediump float u_xlat16_116;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_102 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_102 = inversesqrt(u_xlat16_102);
    u_xlat16_12.xyz = vec3(u_xlat16_102) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_103;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_103 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_15.xyz = vec3(u_xlat16_103) * vs_TEXCOORD1.yzx;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_103;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_103 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_19.xyz = vec3(u_xlat16_103) * u_xlat16_19.xyz;
    u_xlat16_103 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_71 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_71);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_69 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69) + u_xlat16_38.x;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_69;
    u_xlat16_69 = u_xlat16_103 * u_xlat16_69;
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat35.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat16.xyz = u_xlat35.xxx * u_xlat16.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.x = min(max(u_xlat16_38.x, 0.0), 1.0);
#else
    u_xlat16_38.x = clamp(u_xlat16_38.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat107 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat23.xyz = vec3(u_xlat107) * u_xlat23.xyz;
    u_xlat107 = (-u_xlat16_3.x) + 1.0;
    u_xlat76.x = abs(_AnisotropicStrength_1) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb109 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb109 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb109) ? u_xlat76.x : u_xlat16_3.x;
    u_xlat25 = (u_xlatb109) ? u_xlat16_3.x : u_xlat76.x;
    u_xlat24 = u_xlat32;
    u_xlat16_71 = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat109 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat113 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb107 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb107) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb107) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat107 = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_71 * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat35.x * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat35.z = max(u_xlat101, 0.0);
    u_xlat22.y = u_xlat76.x * u_xlat27.x;
    u_xlat22.z = u_xlat107 * u_xlat26.x;
    u_xlat107 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat22.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat107 = u_xlat107 * u_xlat16.x + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_71 * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat109 = u_xlat16_106 * u_xlat109;
    u_xlat109 = min(u_xlat109, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat109 * u_xlat25;
    u_xlat26.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat109 = u_xlat49 * 0.318309873;
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.xz = min(u_xlat35.xz, vec2(16.0, 16.0));
    u_xlat22.y = u_xlat76.x * u_xlat25;
    u_xlat22.z = u_xlat110 * u_xlat24;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat113 * u_xlat24;
    u_xlat110 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat110 = sqrt(u_xlat110);
    u_xlat110 = u_xlat110 + u_xlat21.x;
    u_xlat110 = u_xlat110 + 6.10351563e-05;
    u_xlat110 = u_xlat76.x * u_xlat110 + 6.10351563e-05;
    u_xlat110 = float(1.0) / u_xlat110;
    u_xlat113 = (-u_xlat16_38.x) + 1.0;
    u_xlat16_38.x = u_xlat113 * u_xlat113;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_71 = u_xlat113 * u_xlat16_38.x;
    u_xlat16.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat113 = (-u_xlat16_38.x) * u_xlat113 + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * vec3(u_xlat113);
    u_xlat54.xyz = u_xlat16.xxx * vec3(u_xlat16_71) + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat35.x = u_xlat35.x * u_xlat110;
    u_xlat57.xyz = u_xlat54.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat35.x = u_xlat35.z * u_xlat107;
    u_xlat54.xyz = u_xlat54.xyz * u_xlat35.xxx;
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat54.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_111 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat57.xyz;
    u_xlat16_29.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_30.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_29.yyy + u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_29.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_29.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat57.xyz = u_xlat35.xxx * u_xlat57.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_116 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat110 = u_xlat16_105 * u_xlat16_114;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat27.x = u_xlat110 * u_xlat24;
    u_xlat27.y = u_xlat101 * u_xlat25;
    u_xlat27.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat26.y = u_xlat16_116 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat26.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_111) + 1.0;
    u_xlat16_111 = u_xlat107 * u_xlat107;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_114 = u_xlat107 * u_xlat16_111;
    u_xlat107 = (-u_xlat16_111) * u_xlat107 + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat57.xyz = u_xlat16.xxx * vec3(u_xlat16_114) + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat57.xyz = u_xlat57.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_111 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat21.xyz;
    u_xlat16_30.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_30.yyy + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_30.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_30.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat11.xyz = u_xlat35.xxx * u_xlat11.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat10.x = u_xlat16_105 * u_xlat16_111;
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat11.x = u_xlat10.x * u_xlat24;
    u_xlat11.y = u_xlat101 * u_xlat25;
    u_xlat11.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat21.y = u_xlat16_114 * u_xlat25;
    u_xlat21.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat21.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat107 * u_xlat107;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_105 = u_xlat107 * u_xlat16_102;
    u_xlat107 = (-u_xlat16_102) * u_xlat107 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat10.xzw = u_xlat16.xxx * vec3(u_xlat16_105) + u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat10.xzw = u_xlat10.xzw * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_30.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_38.xyz = u_xlat16_17.xyz * u_xlat21.xxx + u_xlat16_38.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati35 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat101 = min(u_xlat16_69, 1.0);
    u_xlat107 = min(u_xlat101, u_xlat16_2.z);
    u_xlat16_29.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(u_xlat107) + (-u_xlat16_30.xyz);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_29.xyz = u_xlat16_30.xyz * vec3(u_xlat107) + u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_103) * u_xlat16_17.xyz;
    u_xlati107 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_30.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati107].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_30.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_17.xyw;
    u_xlat16_30.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69 = u_xlat16_36.x + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69 * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_103 * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat101 * 0.5;
    u_xlat16_69 = (-u_xlat101) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69 + u_xlat16_36.x;
    u_xlat16_69 = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69;
    u_xlat16_36.x = u_xlat101 * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_38.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat99 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat99 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat33.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat33.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat99);
    u_xlat33.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat33.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec4 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
vec3 u_xlat33;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump vec2 u_xlat16_69;
mediump vec2 u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
bool u_xlatb76;
float u_xlat82;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
float u_xlat110;
bool u_xlatb110;
mediump float u_xlat16_111;
float u_xlat113;
float u_xlat115;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_102 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_103 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_12.xyz = vec3(u_xlat16_103) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_71.x;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_71.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_15.xyz = u_xlat16_71.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_71.x;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_71.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_19.xyz = u_xlat16_71.xxx * u_xlat16_19.xyz;
    u_xlat16_71.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_71.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71.x = min(max(u_xlat16_71.x, 0.0), 1.0);
#else
    u_xlat16_71.x = clamp(u_xlat16_71.x, 0.0, 1.0);
#endif
    u_xlat16_71.x = u_xlat16_71.x + -1.0;
    u_xlat16_71.x = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_104 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_104);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_69.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69.x = min(max(u_xlat16_69.x, 0.0), 1.0);
#else
    u_xlat16_69.x = clamp(u_xlat16_69.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69.x * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69.x) + u_xlat16_38.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_69.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb35 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat107 = (-u_xlat107) * u_xlat107 + 1.0;
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat107) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb35)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat35.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat35.x) + u_xlat13.z;
    u_xlat107 = max((-u_xlat13.w), u_xlat35.x);
    u_xlat107 = (-u_xlat35.x) + u_xlat107;
    u_xlat13.z = _ShadowBias.y * u_xlat107 + u_xlat35.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_38.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat35.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat107 = (-u_xlat16_38.x) + 1.0;
    u_xlat35.x = u_xlat35.x * u_xlat107 + u_xlat16_38.x;
    u_xlat35.x = (-u_xlat35.x) + 1.0;
    u_xlat35.x = (-u_xlat35.x) * u_xlat16_102 + 1.0;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat107 = min(max(u_xlat107, 0.0), 1.0);
#else
    u_xlat107 = clamp(u_xlat107, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat76.x = inversesqrt(u_xlat76.x);
    u_xlat23.xyz = u_xlat76.xxx * u_xlat23.xyz;
    u_xlat76.x = (-u_xlat16_3.x) + 1.0;
    u_xlat109 = abs(_AnisotropicStrength_1) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb110 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb110 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb110) ? u_xlat109 : u_xlat16_3.x;
    u_xlat25 = (u_xlatb110) ? u_xlat16_3.x : u_xlat109;
    u_xlat24 = u_xlat32;
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat109 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat113 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat115 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb76 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb76) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb76) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_38.x * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat107 * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat27.x;
    u_xlat22.z = u_xlat76.x * u_xlat26.x;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = u_xlat76.x * u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = float(1.0) / u_xlat76.x;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_38.x * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat110 = u_xlat16_106 * u_xlat110;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat110 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat49;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = max(u_xlat107, 6.10351563e-05);
    u_xlat110 = u_xlat49 * 0.318309873;
    u_xlat107 = u_xlat49 / u_xlat107;
    u_xlat107 = u_xlat107 * u_xlat107;
    u_xlat107 = u_xlat110 * u_xlat107;
    u_xlat107 = max(u_xlat107, 0.0);
    u_xlat107 = min(u_xlat107, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat25;
    u_xlat22.z = u_xlat113 * u_xlat24;
    u_xlat109 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat109 = sqrt(u_xlat109);
    u_xlat109 = u_xlat109 + u_xlat22.x;
    u_xlat109 = u_xlat109 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat115 * u_xlat24;
    u_xlat113 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat113 = sqrt(u_xlat113);
    u_xlat113 = u_xlat113 + u_xlat21.x;
    u_xlat113 = u_xlat113 + 6.10351563e-05;
    u_xlat113 = u_xlat109 * u_xlat113 + 6.10351563e-05;
    u_xlat113 = float(1.0) / u_xlat113;
    u_xlat16.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat16.x * u_xlat16.x;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat16.x * u_xlat16_102;
    u_xlat82 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16_102) * u_xlat16.x + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat54.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat54.xyz;
    u_xlat16_29.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_29.xyz = u_xlat35.xxx * u_xlat16_29.xyz + _shadowColor.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_30.xyz = u_xlat16_29.xyz * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat107 = u_xlat107 * u_xlat113;
    u_xlat57.xyz = u_xlat54.xyz * vec3(u_xlat107);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat101 = u_xlat101 * u_xlat76.x;
    u_xlat54.xyz = u_xlat54.xyz * vec3(u_xlat101);
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat16_29.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat57.xyz * u_xlat16_29.xyz + u_xlat54.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_36.z = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_36.xz = max(u_xlat16_36.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_38.x = inversesqrt(u_xlat16_36.z);
    u_xlat16_17.xyz = u_xlat16_38.xxx * u_xlat57.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_29.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_38.zzz + u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_71.y = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_36.z);
    u_xlat16_102 = u_xlat16_36.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_69.y = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_69.xy = u_xlat16_69.xy * u_xlat16_71.xy;
    u_xlat16_29.xyz = u_xlat16_69.yyy * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_17.xyz;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat113 = u_xlat16_105 * u_xlat16_38.x;
    u_xlat113 = min(u_xlat113, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat27.x = u_xlat113 * u_xlat24;
    u_xlat27.y = u_xlat107 * u_xlat25;
    u_xlat27.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat26.y = u_xlat16_104 * u_xlat25;
    u_xlat26.z = u_xlat76.x * u_xlat24;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat26.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat76.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat76.x * u_xlat76.x;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat76.x * u_xlat16_102;
    u_xlat76.x = (-u_xlat16_102) * u_xlat76.x + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * u_xlat76.xxx;
    u_xlat57.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat57.xyz = u_xlat57.xyz * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_102 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_38.x = inversesqrt(u_xlat16_102);
    u_xlat16_30.xyz = u_xlat16_38.xxx * u_xlat21.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_38.zzz + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_104 = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_102);
    u_xlat16_102 = u_xlat16_102 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_102 = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_102 = u_xlat16_104 * u_xlat16_102;
    u_xlat16_31.xyz = vec3(u_xlat16_102) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_30.xyz;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat11.xyz = vec3(u_xlat101) * u_xlat11.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_30.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_103 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16_30.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_30.xyz);
    u_xlat76.x = u_xlat16_105 * u_xlat16_103;
    u_xlat76.x = min(u_xlat76.x, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat11.x = u_xlat76.x * u_xlat24;
    u_xlat11.y = u_xlat107 * u_xlat25;
    u_xlat11.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat21.y = u_xlat16_38.x * u_xlat25;
    u_xlat21.z = u_xlat10.x * u_xlat24;
    u_xlat107 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat21.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat10.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat10.x * u_xlat10.x;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_103 = u_xlat10.x * u_xlat16_102;
    u_xlat10.x = (-u_xlat16_102) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat82) * vec3(u_xlat16_103) + u_xlat10.xzw;
    u_xlat16_30.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_30.xyz = u_xlat10.yyy * u_xlat16_30.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_31.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat35.x = u_xlat35.x + -1.0;
    u_xlat35.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat35.xx + vec2(1.0, 1.0);
    u_xlat16_29.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_29.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_29.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_29.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati107 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat35.xz = min(u_xlat16_69.xx, u_xlat35.xz);
    u_xlat35.x = min(u_xlat35.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat35.xxx + (-u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_31.xyz * u_xlat35.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_71.xxx * u_xlat16_29.xyz;
    u_xlati35 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_31.xyz = u_xlat16_29.yyy * _IrradianceACCoeffs[u_xlati35].xyz;
    u_xlat16_29.xyw = u_xlat16_29.xxx * _IrradianceACCoeffs[u_xlati107].xyz + u_xlat16_31.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_29.xyz = u_xlat16_29.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_29.xyw;
    u_xlat16_31.xyz = u_xlat16_29.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69.x = u_xlat16_36.x + 1.0;
    u_xlat16_69.x = min(u_xlat16_69.x, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69.x * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_71.x * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat35.z * 0.5;
    u_xlat16_69.x = (-u_xlat35.z) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69.x + u_xlat16_36.x;
    u_xlat16_69.x = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69.x;
    u_xlat16_36.x = u_xlat35.z * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_29.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_38.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_38.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat99 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat99 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat33.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat33.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat99);
    u_xlat33.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat33.xyz + u_xlat16_2.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec4 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
vec3 u_xlat33;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump vec2 u_xlat16_69;
mediump vec2 u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
bool u_xlatb76;
float u_xlat82;
float u_xlat99;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
float u_xlat110;
bool u_xlatb110;
mediump float u_xlat16_111;
float u_xlat113;
float u_xlat115;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_102 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_103 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_12.xyz = vec3(u_xlat16_103) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_71.x;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_71.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_15.xyz = u_xlat16_71.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_71.x;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_71.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_19.xyz = u_xlat16_71.xxx * u_xlat16_19.xyz;
    u_xlat16_71.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_71.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71.x = min(max(u_xlat16_71.x, 0.0), 1.0);
#else
    u_xlat16_71.x = clamp(u_xlat16_71.x, 0.0, 1.0);
#endif
    u_xlat16_71.x = u_xlat16_71.x + -1.0;
    u_xlat16_71.x = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_104 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_104);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_69.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69.x = min(max(u_xlat16_69.x, 0.0), 1.0);
#else
    u_xlat16_69.x = clamp(u_xlat16_69.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69.x * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69.x) + u_xlat16_38.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_69.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb35 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat107 = (-u_xlat107) * u_xlat107 + 1.0;
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat107) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb35)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat35.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat35.x) + u_xlat13.z;
    u_xlat107 = max((-u_xlat13.w), u_xlat35.x);
    u_xlat107 = (-u_xlat35.x) + u_xlat107;
    u_xlat13.z = _ShadowBias.y * u_xlat107 + u_xlat35.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_38.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat35.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat107 = (-u_xlat16_38.x) + 1.0;
    u_xlat35.x = u_xlat35.x * u_xlat107 + u_xlat16_38.x;
    u_xlat35.x = (-u_xlat35.x) + 1.0;
    u_xlat35.x = (-u_xlat35.x) * u_xlat16_102 + 1.0;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat107 = min(max(u_xlat107, 0.0), 1.0);
#else
    u_xlat107 = clamp(u_xlat107, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat76.x = inversesqrt(u_xlat76.x);
    u_xlat23.xyz = u_xlat76.xxx * u_xlat23.xyz;
    u_xlat76.x = (-u_xlat16_3.x) + 1.0;
    u_xlat109 = abs(_AnisotropicStrength_1) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb110 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb110 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb110) ? u_xlat109 : u_xlat16_3.x;
    u_xlat25 = (u_xlatb110) ? u_xlat16_3.x : u_xlat109;
    u_xlat24 = u_xlat32;
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat109 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat113 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat115 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb76 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb76) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb76) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_38.x * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat107 * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat27.x;
    u_xlat22.z = u_xlat76.x * u_xlat26.x;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = u_xlat76.x * u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = float(1.0) / u_xlat76.x;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_38.x * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat110 = u_xlat16_106 * u_xlat110;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat110 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat49;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = max(u_xlat107, 6.10351563e-05);
    u_xlat110 = u_xlat49 * 0.318309873;
    u_xlat107 = u_xlat49 / u_xlat107;
    u_xlat107 = u_xlat107 * u_xlat107;
    u_xlat107 = u_xlat110 * u_xlat107;
    u_xlat107 = max(u_xlat107, 0.0);
    u_xlat107 = min(u_xlat107, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat25;
    u_xlat22.z = u_xlat113 * u_xlat24;
    u_xlat109 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat109 = sqrt(u_xlat109);
    u_xlat109 = u_xlat109 + u_xlat22.x;
    u_xlat109 = u_xlat109 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat115 * u_xlat24;
    u_xlat113 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat113 = sqrt(u_xlat113);
    u_xlat113 = u_xlat113 + u_xlat21.x;
    u_xlat113 = u_xlat113 + 6.10351563e-05;
    u_xlat113 = u_xlat109 * u_xlat113 + 6.10351563e-05;
    u_xlat113 = float(1.0) / u_xlat113;
    u_xlat16.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat16.x * u_xlat16.x;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat16.x * u_xlat16_102;
    u_xlat82 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16_102) * u_xlat16.x + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat54.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat54.xyz;
    u_xlat16_29.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_29.xyz = u_xlat35.xxx * u_xlat16_29.xyz + _shadowColor.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_30.xyz = u_xlat16_29.xyz * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat107 = u_xlat107 * u_xlat113;
    u_xlat57.xyz = u_xlat54.xyz * vec3(u_xlat107);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat101 = u_xlat101 * u_xlat76.x;
    u_xlat54.xyz = u_xlat54.xyz * vec3(u_xlat101);
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat16_29.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat57.xyz * u_xlat16_29.xyz + u_xlat54.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_36.z = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_36.xz = max(u_xlat16_36.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_38.x = inversesqrt(u_xlat16_36.z);
    u_xlat16_17.xyz = u_xlat16_38.xxx * u_xlat57.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_29.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_38.zzz + u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_71.y = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_36.z);
    u_xlat16_102 = u_xlat16_36.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_69.y = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_69.xy = u_xlat16_69.xy * u_xlat16_71.xy;
    u_xlat16_29.xyz = u_xlat16_69.yyy * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_17.xyz;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat113 = u_xlat16_105 * u_xlat16_38.x;
    u_xlat113 = min(u_xlat113, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat27.x = u_xlat113 * u_xlat24;
    u_xlat27.y = u_xlat107 * u_xlat25;
    u_xlat27.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat26.y = u_xlat16_104 * u_xlat25;
    u_xlat26.z = u_xlat76.x * u_xlat24;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat26.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat76.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat76.x * u_xlat76.x;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat76.x * u_xlat16_102;
    u_xlat76.x = (-u_xlat16_102) * u_xlat76.x + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * u_xlat76.xxx;
    u_xlat57.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat57.xyz = u_xlat57.xyz * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_102 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_38.x = inversesqrt(u_xlat16_102);
    u_xlat16_30.xyz = u_xlat16_38.xxx * u_xlat21.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_38.zzz + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_104 = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_102);
    u_xlat16_102 = u_xlat16_102 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_102 = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_102 = u_xlat16_104 * u_xlat16_102;
    u_xlat16_31.xyz = vec3(u_xlat16_102) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_30.xyz;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat11.xyz = vec3(u_xlat101) * u_xlat11.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_30.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_103 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16_30.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_30.xyz);
    u_xlat76.x = u_xlat16_105 * u_xlat16_103;
    u_xlat76.x = min(u_xlat76.x, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat11.x = u_xlat76.x * u_xlat24;
    u_xlat11.y = u_xlat107 * u_xlat25;
    u_xlat11.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat21.y = u_xlat16_38.x * u_xlat25;
    u_xlat21.z = u_xlat10.x * u_xlat24;
    u_xlat107 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat21.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat10.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat10.x * u_xlat10.x;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_103 = u_xlat10.x * u_xlat16_102;
    u_xlat10.x = (-u_xlat16_102) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat82) * vec3(u_xlat16_103) + u_xlat10.xzw;
    u_xlat16_30.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_30.xyz = u_xlat10.yyy * u_xlat16_30.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_31.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat35.x = u_xlat35.x + -1.0;
    u_xlat35.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat35.xx + vec2(1.0, 1.0);
    u_xlat16_29.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_29.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_29.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_29.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati107 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat35.xz = min(u_xlat16_69.xx, u_xlat35.xz);
    u_xlat35.x = min(u_xlat35.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat35.xxx + (-u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_31.xyz * u_xlat35.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_71.xxx * u_xlat16_29.xyz;
    u_xlati35 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_31.xyz = u_xlat16_29.yyy * _IrradianceACCoeffs[u_xlati35].xyz;
    u_xlat16_29.xyw = u_xlat16_29.xxx * _IrradianceACCoeffs[u_xlati107].xyz + u_xlat16_31.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_29.xyz = u_xlat16_29.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_29.xyw;
    u_xlat16_31.xyz = u_xlat16_29.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69.x = u_xlat16_36.x + 1.0;
    u_xlat16_69.x = min(u_xlat16_69.x, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69.x * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_71.x * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat35.z * 0.5;
    u_xlat16_69.x = (-u_xlat35.z) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69.x + u_xlat16_36.x;
    u_xlat16_69.x = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69.x;
    u_xlat16_36.x = u_xlat35.z * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_29.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_38.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_38.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat99 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat99 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat33.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat33.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat99);
    u_xlat33.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat33.xyz + u_xlat16_2.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
float u_xlat82;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
bool u_xlatb109;
float u_xlat110;
mediump float u_xlat16_111;
float u_xlat113;
mediump float u_xlat16_114;
mediump float u_xlat16_116;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_102 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_102 = inversesqrt(u_xlat16_102);
    u_xlat16_12.xyz = vec3(u_xlat16_102) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_103;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_103 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_15.xyz = vec3(u_xlat16_103) * vs_TEXCOORD1.yzx;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_103;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_103 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_19.xyz = vec3(u_xlat16_103) * u_xlat16_19.xyz;
    u_xlat16_103 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_71 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_71);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_69 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69) + u_xlat16_38.x;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_69;
    u_xlat16_69 = u_xlat16_103 * u_xlat16_69;
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat35.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat16.xyz = u_xlat35.xxx * u_xlat16.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.x = min(max(u_xlat16_38.x, 0.0), 1.0);
#else
    u_xlat16_38.x = clamp(u_xlat16_38.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat107 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat23.xyz = vec3(u_xlat107) * u_xlat23.xyz;
    u_xlat107 = (-u_xlat16_3.x) + 1.0;
    u_xlat76.x = abs(_AnisotropicStrength_1) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb109 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb109 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb109) ? u_xlat76.x : u_xlat16_3.x;
    u_xlat25 = (u_xlatb109) ? u_xlat16_3.x : u_xlat76.x;
    u_xlat24 = u_xlat32;
    u_xlat16_71 = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat109 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat113 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb107 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb107) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb107) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat107 = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_71 * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat35.x * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat35.z = max(u_xlat101, 0.0);
    u_xlat22.y = u_xlat76.x * u_xlat27.x;
    u_xlat22.z = u_xlat107 * u_xlat26.x;
    u_xlat107 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat22.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat107 = u_xlat107 * u_xlat16.x + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_71 * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat109 = u_xlat16_106 * u_xlat109;
    u_xlat109 = min(u_xlat109, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat109 * u_xlat25;
    u_xlat26.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat109 = u_xlat49 * 0.318309873;
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.xz = min(u_xlat35.xz, vec2(16.0, 16.0));
    u_xlat22.y = u_xlat76.x * u_xlat25;
    u_xlat22.z = u_xlat110 * u_xlat24;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat113 * u_xlat24;
    u_xlat110 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat110 = sqrt(u_xlat110);
    u_xlat110 = u_xlat110 + u_xlat21.x;
    u_xlat110 = u_xlat110 + 6.10351563e-05;
    u_xlat110 = u_xlat76.x * u_xlat110 + 6.10351563e-05;
    u_xlat110 = float(1.0) / u_xlat110;
    u_xlat113 = (-u_xlat16_38.x) + 1.0;
    u_xlat16_38.x = u_xlat113 * u_xlat113;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_71 = u_xlat113 * u_xlat16_38.x;
    u_xlat16.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat113 = (-u_xlat16_38.x) * u_xlat113 + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * vec3(u_xlat113);
    u_xlat54.xyz = u_xlat16.xxx * vec3(u_xlat16_71) + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat35.x = u_xlat35.x * u_xlat110;
    u_xlat57.xyz = u_xlat54.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat35.x = u_xlat35.z * u_xlat107;
    u_xlat54.xyz = u_xlat54.xyz * u_xlat35.xxx;
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat54.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_111 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat57.xyz;
    u_xlat16_29.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_30.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_29.yyy + u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_29.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_29.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat57.xyz = u_xlat35.xxx * u_xlat57.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_116 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat110 = u_xlat16_105 * u_xlat16_114;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat27.x = u_xlat110 * u_xlat24;
    u_xlat27.y = u_xlat101 * u_xlat25;
    u_xlat27.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat26.y = u_xlat16_116 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat26.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_111) + 1.0;
    u_xlat16_111 = u_xlat107 * u_xlat107;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_114 = u_xlat107 * u_xlat16_111;
    u_xlat107 = (-u_xlat16_111) * u_xlat107 + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat57.xyz = u_xlat16.xxx * vec3(u_xlat16_114) + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat57.xyz = u_xlat57.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_111 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat21.xyz;
    u_xlat16_30.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_30.yyy + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_30.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_30.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat11.xyz = u_xlat35.xxx * u_xlat11.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat10.x = u_xlat16_105 * u_xlat16_111;
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat11.x = u_xlat10.x * u_xlat24;
    u_xlat11.y = u_xlat101 * u_xlat25;
    u_xlat11.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat21.y = u_xlat16_114 * u_xlat25;
    u_xlat21.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat21.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat107 * u_xlat107;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_105 = u_xlat107 * u_xlat16_102;
    u_xlat107 = (-u_xlat16_102) * u_xlat107 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat10.xzw = u_xlat16.xxx * vec3(u_xlat16_105) + u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat10.xzw = u_xlat10.xzw * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_30.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_38.xyz = u_xlat16_17.xyz * u_xlat21.xxx + u_xlat16_38.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati35 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat101 = min(u_xlat16_69, 1.0);
    u_xlat107 = min(u_xlat101, u_xlat16_2.z);
    u_xlat16_29.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(u_xlat107) + (-u_xlat16_30.xyz);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_29.xyz = u_xlat16_30.xyz * vec3(u_xlat107) + u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_103) * u_xlat16_17.xyz;
    u_xlati107 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_30.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati107].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_30.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_17.xyw;
    u_xlat16_30.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69 = u_xlat16_36.x + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69 * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_103 * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat101 * 0.5;
    u_xlat16_69 = (-u_xlat101) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69 + u_xlat16_36.x;
    u_xlat16_69 = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69;
    u_xlat16_36.x = u_xlat101 * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_38.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
vec3 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec3 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump float u_xlat16_69;
mediump float u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
float u_xlat82;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
bool u_xlatb109;
float u_xlat110;
mediump float u_xlat16_111;
float u_xlat113;
mediump float u_xlat16_114;
mediump float u_xlat16_116;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_102 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_102 = inversesqrt(u_xlat16_102);
    u_xlat16_12.xyz = vec3(u_xlat16_102) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_103;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_103 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_15.xyz = vec3(u_xlat16_103) * vs_TEXCOORD1.yzx;
    u_xlat16_103 = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_103 = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_103;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_103;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_103 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_19.xyz = vec3(u_xlat16_103) * u_xlat16_19.xyz;
    u_xlat16_103 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_103 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_103 = min(max(u_xlat16_103, 0.0), 1.0);
#else
    u_xlat16_103 = clamp(u_xlat16_103, 0.0, 1.0);
#endif
    u_xlat16_103 = u_xlat16_103 + -1.0;
    u_xlat16_103 = _occlusionScale * u_xlat16_103 + 1.0;
    u_xlat16_71 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_71);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_36.x = max(u_xlat16_36.x, 0.0078125);
    u_xlat16_69 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69 * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69) + u_xlat16_38.x;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69;
    u_xlat16_69 = u_xlat16_53.z * u_xlat16_69;
    u_xlat16_69 = u_xlat16_103 * u_xlat16_69;
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat35.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat16.xyz = u_xlat35.xxx * u_xlat16.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_38.x = min(max(u_xlat16_38.x, 0.0), 1.0);
#else
    u_xlat16_38.x = clamp(u_xlat16_38.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat107 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat23.xyz = vec3(u_xlat107) * u_xlat23.xyz;
    u_xlat107 = (-u_xlat16_3.x) + 1.0;
    u_xlat76.x = abs(_AnisotropicStrength_1) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb109 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb109 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb109) ? u_xlat76.x : u_xlat16_3.x;
    u_xlat25 = (u_xlatb109) ? u_xlat16_3.x : u_xlat76.x;
    u_xlat24 = u_xlat32;
    u_xlat16_71 = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat109 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat113 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat107 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb107 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb107) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb107) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat107 = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_71 * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat35.x * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat35.z = max(u_xlat101, 0.0);
    u_xlat22.y = u_xlat76.x * u_xlat27.x;
    u_xlat22.z = u_xlat107 * u_xlat26.x;
    u_xlat107 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat22.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat107 = u_xlat107 * u_xlat16.x + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_71 * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat109 = u_xlat16_106 * u_xlat109;
    u_xlat109 = min(u_xlat109, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat109 * u_xlat25;
    u_xlat26.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat109 = u_xlat49 * 0.318309873;
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.xz = min(u_xlat35.xz, vec2(16.0, 16.0));
    u_xlat22.y = u_xlat76.x * u_xlat25;
    u_xlat22.z = u_xlat110 * u_xlat24;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat113 * u_xlat24;
    u_xlat110 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat110 = sqrt(u_xlat110);
    u_xlat110 = u_xlat110 + u_xlat21.x;
    u_xlat110 = u_xlat110 + 6.10351563e-05;
    u_xlat110 = u_xlat76.x * u_xlat110 + 6.10351563e-05;
    u_xlat110 = float(1.0) / u_xlat110;
    u_xlat113 = (-u_xlat16_38.x) + 1.0;
    u_xlat16_38.x = u_xlat113 * u_xlat113;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_38.x = u_xlat113 * u_xlat16_38.x;
    u_xlat16_71 = u_xlat113 * u_xlat16_38.x;
    u_xlat16.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat113 = (-u_xlat16_38.x) * u_xlat113 + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * vec3(u_xlat113);
    u_xlat54.xyz = u_xlat16.xxx * vec3(u_xlat16_71) + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat35.x = u_xlat35.x * u_xlat110;
    u_xlat57.xyz = u_xlat54.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat35.x = u_xlat35.z * u_xlat107;
    u_xlat54.xyz = u_xlat54.xyz * u_xlat35.xxx;
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat54.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_111 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat57.xyz;
    u_xlat16_29.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_30.xyz = u_xlat16_29.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_29.yyy + u_xlat16_30.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_29.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_29.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat57.xyz = u_xlat35.xxx * u_xlat57.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_116 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat110 = u_xlat16_105 * u_xlat16_114;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat27.x = u_xlat110 * u_xlat24;
    u_xlat27.y = u_xlat101 * u_xlat25;
    u_xlat27.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat26.y = u_xlat16_116 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat26.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_111) + 1.0;
    u_xlat16_111 = u_xlat107 * u_xlat107;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_111 = u_xlat107 * u_xlat16_111;
    u_xlat16_114 = u_xlat107 * u_xlat16_111;
    u_xlat107 = (-u_xlat16_111) * u_xlat107 + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat57.xyz = u_xlat16.xxx * vec3(u_xlat16_114) + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat57.xyz = u_xlat57.xyz * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_38.xyz = u_xlat16_38.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_111 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.00100000005>=abs(u_xlat16_111));
#else
    u_xlatb35 = 0.00100000005>=abs(u_xlat16_111);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_111 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_111 = max(u_xlat16_111, 6.10351563e-05);
    u_xlat16_114 = inversesqrt(u_xlat16_111);
    u_xlat16_17.xyz = vec3(u_xlat16_114) * u_xlat21.xyz;
    u_xlat16_30.xy = (bool(u_xlatb35)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_30.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_30.yyy + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb35 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_114 = (u_xlatb35) ? 1.0 : 0.0;
    u_xlat16_116 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_116 = u_xlat16_116 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_116 = min(max(u_xlat16_116, 0.0), 1.0);
#else
    u_xlat16_116 = clamp(u_xlat16_116, 0.0, 1.0);
#endif
    u_xlat16_116 = u_xlat16_116 * u_xlat16_116;
    u_xlat16_114 = max(u_xlat16_114, u_xlat16_116);
    u_xlat16_116 = float(1.0) / float(u_xlat16_111);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_111 = (-u_xlat16_111) * u_xlat16_111 + 1.0;
    u_xlat16_111 = max(u_xlat16_111, 0.0);
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_111 = u_xlat16_111 * u_xlat16_116;
    u_xlat16_111 = max(u_xlat16_30.x, u_xlat16_111);
    u_xlat16_111 = u_xlat16_114 * u_xlat16_111;
    u_xlat16_30.xyz = vec3(u_xlat16_111) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_102) + u_xlat16_17.xyz;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat11.xyz = u_xlat35.xxx * u_xlat11.xyz;
    u_xlat35.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_111 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_114 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat101 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat10.x = u_xlat16_105 * u_xlat16_111;
    u_xlat10.x = min(u_xlat10.x, 1.0);
    u_xlat101 = u_xlat16_106 * u_xlat101;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat11.x = u_xlat10.x * u_xlat24;
    u_xlat11.y = u_xlat101 * u_xlat25;
    u_xlat11.z = u_xlat35.x * u_xlat49;
    u_xlat35.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat35.x = max(u_xlat35.x, 6.10351563e-05);
    u_xlat35.x = u_xlat49 / u_xlat35.x;
    u_xlat35.x = u_xlat35.x * u_xlat35.x;
    u_xlat35.x = u_xlat109 * u_xlat35.x;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat35.x = min(u_xlat35.x, 16.0);
    u_xlat21.y = u_xlat16_114 * u_xlat25;
    u_xlat21.z = u_xlat107 * u_xlat24;
    u_xlat101 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat101 = sqrt(u_xlat101);
    u_xlat101 = u_xlat101 + u_xlat21.x;
    u_xlat101 = u_xlat101 + 6.10351563e-05;
    u_xlat101 = u_xlat76.x * u_xlat101 + 6.10351563e-05;
    u_xlat101 = float(1.0) / u_xlat101;
    u_xlat107 = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat107 * u_xlat107;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_102 = u_xlat107 * u_xlat16_102;
    u_xlat16_105 = u_xlat107 * u_xlat16_102;
    u_xlat107 = (-u_xlat16_102) * u_xlat107 + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * vec3(u_xlat107);
    u_xlat10.xzw = u_xlat16.xxx * vec3(u_xlat16_105) + u_xlat10.xzw;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat35.x = u_xlat101 * u_xlat35.x;
    u_xlat10.xzw = u_xlat10.xzw * u_xlat35.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_30.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_38.xyz = u_xlat16_17.xyz * u_xlat21.xxx + u_xlat16_38.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati35 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat101 = min(u_xlat16_69, 1.0);
    u_xlat107 = min(u_xlat101, u_xlat16_2.z);
    u_xlat16_29.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_29.xyz = vec3(u_xlat107) * u_xlat16_29.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_30.xyz = vec3(u_xlat107) * u_xlat16_30.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * vec3(u_xlat107) + (-u_xlat16_30.xyz);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_29.xyz = u_xlat16_30.xyz * vec3(u_xlat107) + u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_103) * u_xlat16_17.xyz;
    u_xlati107 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_30.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati107].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_30.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_17.xyw;
    u_xlat16_30.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69 = u_xlat16_36.x + 1.0;
    u_xlat16_69 = min(u_xlat16_69, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69 * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_103 * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat101 * 0.5;
    u_xlat16_69 = (-u_xlat101) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69 + u_xlat16_36.x;
    u_xlat16_69 = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69;
    u_xlat16_36.x = u_xlat101 * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_38.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec4 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump vec2 u_xlat16_69;
mediump vec2 u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
bool u_xlatb76;
float u_xlat82;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
float u_xlat110;
bool u_xlatb110;
mediump float u_xlat16_111;
float u_xlat113;
float u_xlat115;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_102 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_103 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_12.xyz = vec3(u_xlat16_103) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_71.x;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_71.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_15.xyz = u_xlat16_71.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_71.x;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_71.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_19.xyz = u_xlat16_71.xxx * u_xlat16_19.xyz;
    u_xlat16_71.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_71.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71.x = min(max(u_xlat16_71.x, 0.0), 1.0);
#else
    u_xlat16_71.x = clamp(u_xlat16_71.x, 0.0, 1.0);
#endif
    u_xlat16_71.x = u_xlat16_71.x + -1.0;
    u_xlat16_71.x = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_104 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_104);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_69.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69.x = min(max(u_xlat16_69.x, 0.0), 1.0);
#else
    u_xlat16_69.x = clamp(u_xlat16_69.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69.x * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69.x) + u_xlat16_38.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_69.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb35 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat107 = (-u_xlat107) * u_xlat107 + 1.0;
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat107) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb35)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat35.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat35.x) + u_xlat13.z;
    u_xlat107 = max((-u_xlat13.w), u_xlat35.x);
    u_xlat107 = (-u_xlat35.x) + u_xlat107;
    u_xlat13.z = _ShadowBias.y * u_xlat107 + u_xlat35.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_38.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat35.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat107 = (-u_xlat16_38.x) + 1.0;
    u_xlat35.x = u_xlat35.x * u_xlat107 + u_xlat16_38.x;
    u_xlat35.x = (-u_xlat35.x) + 1.0;
    u_xlat35.x = (-u_xlat35.x) * u_xlat16_102 + 1.0;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat107 = min(max(u_xlat107, 0.0), 1.0);
#else
    u_xlat107 = clamp(u_xlat107, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat76.x = inversesqrt(u_xlat76.x);
    u_xlat23.xyz = u_xlat76.xxx * u_xlat23.xyz;
    u_xlat76.x = (-u_xlat16_3.x) + 1.0;
    u_xlat109 = abs(_AnisotropicStrength_1) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb110 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb110 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb110) ? u_xlat109 : u_xlat16_3.x;
    u_xlat25 = (u_xlatb110) ? u_xlat16_3.x : u_xlat109;
    u_xlat24 = u_xlat32;
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat109 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat113 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat115 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb76 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb76) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb76) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_38.x * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat107 * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat27.x;
    u_xlat22.z = u_xlat76.x * u_xlat26.x;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = u_xlat76.x * u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = float(1.0) / u_xlat76.x;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_38.x * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat110 = u_xlat16_106 * u_xlat110;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat110 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat49;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = max(u_xlat107, 6.10351563e-05);
    u_xlat110 = u_xlat49 * 0.318309873;
    u_xlat107 = u_xlat49 / u_xlat107;
    u_xlat107 = u_xlat107 * u_xlat107;
    u_xlat107 = u_xlat110 * u_xlat107;
    u_xlat107 = max(u_xlat107, 0.0);
    u_xlat107 = min(u_xlat107, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat25;
    u_xlat22.z = u_xlat113 * u_xlat24;
    u_xlat109 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat109 = sqrt(u_xlat109);
    u_xlat109 = u_xlat109 + u_xlat22.x;
    u_xlat109 = u_xlat109 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat115 * u_xlat24;
    u_xlat113 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat113 = sqrt(u_xlat113);
    u_xlat113 = u_xlat113 + u_xlat21.x;
    u_xlat113 = u_xlat113 + 6.10351563e-05;
    u_xlat113 = u_xlat109 * u_xlat113 + 6.10351563e-05;
    u_xlat113 = float(1.0) / u_xlat113;
    u_xlat16.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat16.x * u_xlat16.x;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat16.x * u_xlat16_102;
    u_xlat82 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16_102) * u_xlat16.x + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat54.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat54.xyz;
    u_xlat16_29.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_29.xyz = u_xlat35.xxx * u_xlat16_29.xyz + _shadowColor.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_30.xyz = u_xlat16_29.xyz * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat107 = u_xlat107 * u_xlat113;
    u_xlat57.xyz = u_xlat54.xyz * vec3(u_xlat107);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat101 = u_xlat101 * u_xlat76.x;
    u_xlat54.xyz = u_xlat54.xyz * vec3(u_xlat101);
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat16_29.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat57.xyz * u_xlat16_29.xyz + u_xlat54.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_36.z = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_36.xz = max(u_xlat16_36.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_38.x = inversesqrt(u_xlat16_36.z);
    u_xlat16_17.xyz = u_xlat16_38.xxx * u_xlat57.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_29.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_38.zzz + u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_71.y = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_36.z);
    u_xlat16_102 = u_xlat16_36.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_69.y = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_69.xy = u_xlat16_69.xy * u_xlat16_71.xy;
    u_xlat16_29.xyz = u_xlat16_69.yyy * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_17.xyz;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat113 = u_xlat16_105 * u_xlat16_38.x;
    u_xlat113 = min(u_xlat113, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat27.x = u_xlat113 * u_xlat24;
    u_xlat27.y = u_xlat107 * u_xlat25;
    u_xlat27.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat26.y = u_xlat16_104 * u_xlat25;
    u_xlat26.z = u_xlat76.x * u_xlat24;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat26.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat76.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat76.x * u_xlat76.x;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat76.x * u_xlat16_102;
    u_xlat76.x = (-u_xlat16_102) * u_xlat76.x + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * u_xlat76.xxx;
    u_xlat57.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat57.xyz = u_xlat57.xyz * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_102 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_38.x = inversesqrt(u_xlat16_102);
    u_xlat16_30.xyz = u_xlat16_38.xxx * u_xlat21.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_38.zzz + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_104 = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_102);
    u_xlat16_102 = u_xlat16_102 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_102 = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_102 = u_xlat16_104 * u_xlat16_102;
    u_xlat16_31.xyz = vec3(u_xlat16_102) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_30.xyz;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat11.xyz = vec3(u_xlat101) * u_xlat11.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_30.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_103 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16_30.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_30.xyz);
    u_xlat76.x = u_xlat16_105 * u_xlat16_103;
    u_xlat76.x = min(u_xlat76.x, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat11.x = u_xlat76.x * u_xlat24;
    u_xlat11.y = u_xlat107 * u_xlat25;
    u_xlat11.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat21.y = u_xlat16_38.x * u_xlat25;
    u_xlat21.z = u_xlat10.x * u_xlat24;
    u_xlat107 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat21.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat10.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat10.x * u_xlat10.x;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_103 = u_xlat10.x * u_xlat16_102;
    u_xlat10.x = (-u_xlat16_102) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat82) * vec3(u_xlat16_103) + u_xlat10.xzw;
    u_xlat16_30.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_30.xyz = u_xlat10.yyy * u_xlat16_30.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_31.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat35.x = u_xlat35.x + -1.0;
    u_xlat35.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat35.xx + vec2(1.0, 1.0);
    u_xlat16_29.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_29.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_29.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_29.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati107 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat35.xz = min(u_xlat16_69.xx, u_xlat35.xz);
    u_xlat35.x = min(u_xlat35.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat35.xxx + (-u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_31.xyz * u_xlat35.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_71.xxx * u_xlat16_29.xyz;
    u_xlati35 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_31.xyz = u_xlat16_29.yyy * _IrradianceACCoeffs[u_xlati35].xyz;
    u_xlat16_29.xyw = u_xlat16_29.xxx * _IrradianceACCoeffs[u_xlati107].xyz + u_xlat16_31.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_29.xyz = u_xlat16_29.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_29.xyw;
    u_xlat16_31.xyz = u_xlat16_29.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69.x = u_xlat16_36.x + 1.0;
    u_xlat16_69.x = min(u_xlat16_69.x, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69.x * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_71.x * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat35.z * 0.5;
    u_xlat16_69.x = (-u_xlat35.z) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69.x + u_xlat16_36.x;
    u_xlat16_69.x = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69.x;
    u_xlat16_36.x = u_xlat35.z * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_29.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_38.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_38.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
vec3 u_xlat26;
vec3 u_xlat27;
vec3 u_xlat28;
mediump vec4 u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_31;
float u_xlat32;
mediump float u_xlat16_33;
vec3 u_xlat35;
int u_xlati35;
bool u_xlatb35;
mediump vec3 u_xlat16_36;
mediump vec3 u_xlat16_38;
float u_xlat49;
mediump vec3 u_xlat16_53;
vec3 u_xlat54;
vec3 u_xlat57;
mediump vec2 u_xlat16_69;
mediump vec2 u_xlat16_71;
vec2 u_xlat76;
mediump vec2 u_xlat16_76;
bool u_xlatb76;
float u_xlat82;
mediump float u_xlat16_100;
float u_xlat101;
bool u_xlatb101;
mediump float u_xlat16_102;
mediump float u_xlat16_103;
mediump float u_xlat16_104;
mediump float u_xlat16_105;
mediump float u_xlat16_106;
float u_xlat107;
mediump float u_xlat16_107;
int u_xlati107;
bool u_xlatb107;
float u_xlat108;
float u_xlat109;
float u_xlat110;
bool u_xlatb110;
mediump float u_xlat16_111;
float u_xlat113;
float u_xlat115;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_100 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_102 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_102) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_102 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_103 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_103 = inversesqrt(u_xlat16_103);
    u_xlat16_12.xyz = vec3(u_xlat16_103) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb101 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat101 = (u_xlatb101) ? 1.0 : -1.0;
    u_xlat101 = u_xlat101 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb107 = !!(0.5<_anisoUse2U);
#else
    u_xlatb107 = 0.5<_anisoUse2U;
#endif
    u_xlat76.xy = (bool(u_xlatb107)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat76.xy = u_xlat76.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_107 = texture(_anisotropicMap, u_xlat76.xy).x;
    u_xlat107 = u_xlat16_107 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_76.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat108 = u_xlat107 * _sunShift + u_xlat16_71.x;
    u_xlat108 = u_xlat108 + vs_TEXCOORD5;
    u_xlat110 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat110) + u_xlat0.xyz;
    u_xlat110 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat110 = inversesqrt(u_xlat110);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat110);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat101) * u_xlat14.xyz;
    u_xlat16_71.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_15.xyz = u_xlat16_71.xxx * vs_TEXCOORD1.yzx;
    u_xlat16_71.x = u_xlat16_76.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_71.x = u_xlat16_76.y * _sunShift_special_02 + u_xlat16_71.x;
    u_xlat101 = u_xlat107 * _sunShift2nd + u_xlat16_71.x;
    u_xlat101 = u_xlat101 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_71.x = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_71.x = inversesqrt(u_xlat16_71.x);
    u_xlat16_19.xyz = u_xlat16_71.xxx * u_xlat16_19.xyz;
    u_xlat16_71.x = vs_TEXCOORD4.w + -1.0;
    u_xlat16_53.z = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_71.x = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_71.x = min(max(u_xlat16_71.x, 0.0), 1.0);
#else
    u_xlat16_71.x = clamp(u_xlat16_71.x, 0.0, 1.0);
#endif
    u_xlat16_71.x = u_xlat16_71.x + -1.0;
    u_xlat16_71.x = _occlusionScale * u_xlat16_71.x + 1.0;
    u_xlat16_104 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_104);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_36.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_69.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69.x = min(max(u_xlat16_69.x, 0.0), 1.0);
#else
    u_xlat16_69.x = clamp(u_xlat16_69.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = u_xlat16_69.x * 0.5 + 0.5;
    u_xlat16_38.x = (-u_xlat16_69.x) + u_xlat16_38.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_38.x + u_xlat16_69.x;
    u_xlat16_69.x = u_xlat16_53.z * u_xlat16_69.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb35 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat107 = (-u_xlat107) * u_xlat107 + 1.0;
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat107) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb35)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat35.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat35.x = min(max(u_xlat35.x, 0.0), 1.0);
#else
    u_xlat35.x = clamp(u_xlat35.x, 0.0, 1.0);
#endif
    u_xlat35.x = (-u_xlat35.x) + u_xlat13.z;
    u_xlat107 = max((-u_xlat13.w), u_xlat35.x);
    u_xlat107 = (-u_xlat35.x) + u_xlat107;
    u_xlat13.z = _ShadowBias.y * u_xlat107 + u_xlat35.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_38.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat35.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat107 = (-u_xlat16_38.x) + 1.0;
    u_xlat35.x = u_xlat35.x * u_xlat107 + u_xlat16_38.x;
    u_xlat35.x = (-u_xlat35.x) + 1.0;
    u_xlat35.x = (-u_xlat35.x) * u_xlat16_102 + 1.0;
    u_xlat35.x = max(u_xlat35.x, 0.0);
    u_xlat16.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat107 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat107 = inversesqrt(u_xlat107);
    u_xlat16.xyz = vec3(u_xlat107) * u_xlat16.xyz;
    u_xlat107 = dot(u_xlat8.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat107 = min(max(u_xlat107, 0.0), 1.0);
#else
    u_xlat107 = clamp(u_xlat107, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat16.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat22.x = min(max(u_xlat22.x, 0.0), 1.0);
#else
    u_xlat22.x = clamp(u_xlat22.x, 0.0, 1.0);
#endif
    u_xlat23.xyz = vec3(u_xlat108) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat76.x = inversesqrt(u_xlat76.x);
    u_xlat23.xyz = u_xlat76.xxx * u_xlat23.xyz;
    u_xlat76.x = (-u_xlat16_3.x) + 1.0;
    u_xlat109 = abs(_AnisotropicStrength_1) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb110 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb110 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat32 = (u_xlatb110) ? u_xlat109 : u_xlat16_3.x;
    u_xlat25 = (u_xlatb110) ? u_xlat16_3.x : u_xlat109;
    u_xlat24 = u_xlat32;
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16.xyz);
    u_xlat109 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat110 = dot(u_xlat23.xyz, u_xlat16.xyz);
    u_xlat113 = dot(u_xlat23.xyz, u_xlat16_12.xyz);
    u_xlat115 = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = abs(_AnisotropicStrength_2) * u_xlat76.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb76 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb76 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat32 = (u_xlatb76) ? u_xlat101 : u_xlat16_3.x;
    u_xlat27.x = (u_xlatb76) ? u_xlat16_3.x : u_xlat101;
    u_xlat26.x = u_xlat32;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat16.xyz);
    u_xlat76.x = dot(u_xlat57.xyz, u_xlat16_12.xyz);
    u_xlat16.x = dot(u_xlat57.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_105 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat49 = u_xlat16_38.x * u_xlat16_105;
    u_xlat49 = min(u_xlat49, 1.0);
    u_xlat101 = u_xlat101 * u_xlat16_106;
    u_xlat101 = min(u_xlat101, 1.0);
    u_xlat82 = u_xlat26.x * u_xlat27.x;
    u_xlat28.x = u_xlat49 * u_xlat26.x;
    u_xlat28.y = u_xlat101 * u_xlat27.x;
    u_xlat28.z = u_xlat107 * u_xlat82;
    u_xlat101 = dot(u_xlat28.xyz, u_xlat28.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat49 = u_xlat82 * 0.318309873;
    u_xlat101 = u_xlat82 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat49 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat27.x;
    u_xlat22.z = u_xlat76.x * u_xlat26.x;
    u_xlat76.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat76.x = sqrt(u_xlat76.x);
    u_xlat76.x = u_xlat76.x + u_xlat22.x;
    u_xlat76.x = u_xlat76.x + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat27.x;
    u_xlat21.z = u_xlat16.x * u_xlat26.x;
    u_xlat16.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16.x = sqrt(u_xlat16.x);
    u_xlat16.x = u_xlat16.x + u_xlat21.x;
    u_xlat16.x = u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = u_xlat76.x * u_xlat16.x + 6.10351563e-05;
    u_xlat76.x = float(1.0) / u_xlat76.x;
    u_xlat16_105 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_105 = u_xlat16_105 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_106 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_106 = u_xlat16_106 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16.x = u_xlat16_38.x * u_xlat16_105;
    u_xlat16.x = min(u_xlat16.x, 1.0);
    u_xlat110 = u_xlat16_106 * u_xlat110;
    u_xlat110 = min(u_xlat110, 1.0);
    u_xlat49 = u_xlat24 * u_xlat25;
    u_xlat26.x = u_xlat16.x * u_xlat24;
    u_xlat26.y = u_xlat110 * u_xlat25;
    u_xlat26.z = u_xlat107 * u_xlat49;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = max(u_xlat107, 6.10351563e-05);
    u_xlat110 = u_xlat49 * 0.318309873;
    u_xlat107 = u_xlat49 / u_xlat107;
    u_xlat107 = u_xlat107 * u_xlat107;
    u_xlat107 = u_xlat110 * u_xlat107;
    u_xlat107 = max(u_xlat107, 0.0);
    u_xlat107 = min(u_xlat107, 16.0);
    u_xlat22.y = u_xlat109 * u_xlat25;
    u_xlat22.z = u_xlat113 * u_xlat24;
    u_xlat109 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat109 = sqrt(u_xlat109);
    u_xlat109 = u_xlat109 + u_xlat22.x;
    u_xlat109 = u_xlat109 + 6.10351563e-05;
    u_xlat21.y = u_xlat16_104 * u_xlat25;
    u_xlat21.z = u_xlat115 * u_xlat24;
    u_xlat113 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat113 = sqrt(u_xlat113);
    u_xlat113 = u_xlat113 + u_xlat21.x;
    u_xlat113 = u_xlat113 + 6.10351563e-05;
    u_xlat113 = u_xlat109 * u_xlat113 + 6.10351563e-05;
    u_xlat113 = float(1.0) / u_xlat113;
    u_xlat16.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat16.x * u_xlat16.x;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_102 = u_xlat16.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat16.x * u_xlat16_102;
    u_xlat82 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat82 = min(max(u_xlat82, 0.0), 1.0);
#else
    u_xlat82 = clamp(u_xlat82, 0.0, 1.0);
#endif
    u_xlat16.x = (-u_xlat16_102) * u_xlat16.x + 1.0;
    u_xlat54.xyz = u_xlat16_1.xyz * u_xlat16.xxx;
    u_xlat54.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat54.xyz;
    u_xlat16_29.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_29.xyz = u_xlat35.xxx * u_xlat16_29.xyz + _shadowColor.xyz;
    u_xlat16_30.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_30.xyz = u_xlat16_29.xyz * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat107 = u_xlat107 * u_xlat113;
    u_xlat57.xyz = u_xlat54.xyz * vec3(u_xlat107);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat21.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat57.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat101 = u_xlat101 * u_xlat76.x;
    u_xlat54.xyz = u_xlat54.xyz * vec3(u_xlat101);
    u_xlat54.xyz = u_xlat16_17.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat21.xxx * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat54.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat54.xyz = u_xlat16_29.xyz * u_xlat54.xyz;
    u_xlat54.xyz = u_xlat57.xyz * u_xlat16_29.xyz + u_xlat54.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat57.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_36.z = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat16_36.xz = max(u_xlat16_36.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_38.x = inversesqrt(u_xlat16_36.z);
    u_xlat16_17.xyz = u_xlat16_38.xxx * u_xlat57.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_29.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_38.zzz + u_xlat16_29.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_71.y = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_36.z);
    u_xlat16_102 = u_xlat16_36.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_69.y = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_69.xy = u_xlat16_69.xy * u_xlat16_71.xy;
    u_xlat16_29.xyz = u_xlat16_69.yyy * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_17.xyz;
    u_xlat101 = dot(u_xlat57.xyz, u_xlat57.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat57.xyz = vec3(u_xlat101) * u_xlat57.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_17.xyz, u_xlat57.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat26.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat26.x = min(max(u_xlat26.x, 0.0), 1.0);
#else
    u_xlat26.x = clamp(u_xlat26.x, 0.0, 1.0);
#endif
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat57.xyz);
    u_xlat16_104 = dot(u_xlat0.zxy, u_xlat16_17.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat57.xyz);
    u_xlat76.x = dot(u_xlat23.xyz, u_xlat16_17.xyz);
    u_xlat113 = u_xlat16_105 * u_xlat16_38.x;
    u_xlat113 = min(u_xlat113, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat27.x = u_xlat113 * u_xlat24;
    u_xlat27.y = u_xlat107 * u_xlat25;
    u_xlat27.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat26.y = u_xlat16_104 * u_xlat25;
    u_xlat26.z = u_xlat76.x * u_xlat24;
    u_xlat107 = dot(u_xlat26.xyz, u_xlat26.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat26.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat76.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat76.x * u_xlat76.x;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_102 = u_xlat76.x * u_xlat16_102;
    u_xlat16_38.x = u_xlat76.x * u_xlat16_102;
    u_xlat76.x = (-u_xlat16_102) * u_xlat76.x + 1.0;
    u_xlat57.xyz = u_xlat16_1.xyz * u_xlat76.xxx;
    u_xlat57.xyz = vec3(u_xlat82) * u_xlat16_38.xxx + u_xlat57.xyz;
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat26.xxx * u_xlat16_17.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat57.xyz = u_xlat57.xyz * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat57.xyz = min(max(u_xlat57.xyz, 0.0), 1.0);
#else
    u_xlat57.xyz = clamp(u_xlat57.xyz, 0.0, 1.0);
#endif
    u_xlat57.xyz = u_xlat16_18.xyz * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat26.xxx * u_xlat57.xyz;
    u_xlat57.xyz = u_xlat16_29.xyz * u_xlat57.xyz;
    u_xlat16_29.xyz = u_xlat57.xyz * u_xlat10.xxx + u_xlat54.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat16_102 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.00100000005>=abs(u_xlat16_102));
#else
    u_xlatb101 = 0.00100000005>=abs(u_xlat16_102);
#endif
    u_xlat21.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_102 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat16_102 = max(u_xlat16_102, 6.10351563e-05);
    u_xlat16_38.x = inversesqrt(u_xlat16_102);
    u_xlat16_30.xyz = u_xlat16_38.xxx * u_xlat21.xyz;
    u_xlat16_38.xz = (bool(u_xlatb101)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_31.xyz = u_xlat16_38.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_38.zzz + u_xlat16_31.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb101 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_104 = (u_xlatb101) ? 1.0 : 0.0;
    u_xlat16_111 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_30.xyz);
    u_xlat16_111 = u_xlat16_111 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_111 = min(max(u_xlat16_111, 0.0), 1.0);
#else
    u_xlat16_111 = clamp(u_xlat16_111, 0.0, 1.0);
#endif
    u_xlat16_111 = u_xlat16_111 * u_xlat16_111;
    u_xlat16_104 = max(u_xlat16_104, u_xlat16_111);
    u_xlat16_111 = float(1.0) / float(u_xlat16_102);
    u_xlat16_102 = u_xlat16_102 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_102 = (-u_xlat16_102) * u_xlat16_102 + 1.0;
    u_xlat16_102 = max(u_xlat16_102, 0.0);
    u_xlat16_102 = u_xlat16_102 * u_xlat16_102;
    u_xlat16_102 = u_xlat16_102 * u_xlat16_111;
    u_xlat16_102 = max(u_xlat16_38.x, u_xlat16_102);
    u_xlat16_102 = u_xlat16_104 * u_xlat16_102;
    u_xlat16_31.xyz = vec3(u_xlat16_102) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_103) + u_xlat16_30.xyz;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat11.xyz = vec3(u_xlat101) * u_xlat11.xyz;
    u_xlat101 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat101 = min(max(u_xlat101, 0.0), 1.0);
#else
    u_xlat101 = clamp(u_xlat101, 0.0, 1.0);
#endif
    u_xlat16_102 = dot(u_xlat16_30.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_30.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat16_103 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat16_38.x = dot(u_xlat0.zxy, u_xlat16_30.xyz);
    u_xlat107 = dot(u_xlat23.xyz, u_xlat11.xyz);
    u_xlat10.x = dot(u_xlat23.xyz, u_xlat16_30.xyz);
    u_xlat76.x = u_xlat16_105 * u_xlat16_103;
    u_xlat76.x = min(u_xlat76.x, 1.0);
    u_xlat107 = u_xlat16_106 * u_xlat107;
    u_xlat107 = min(u_xlat107, 1.0);
    u_xlat11.x = u_xlat76.x * u_xlat24;
    u_xlat11.y = u_xlat107 * u_xlat25;
    u_xlat11.z = u_xlat101 * u_xlat49;
    u_xlat101 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat101 = max(u_xlat101, 6.10351563e-05);
    u_xlat101 = u_xlat49 / u_xlat101;
    u_xlat101 = u_xlat101 * u_xlat101;
    u_xlat101 = u_xlat110 * u_xlat101;
    u_xlat101 = max(u_xlat101, 0.0);
    u_xlat101 = min(u_xlat101, 16.0);
    u_xlat21.y = u_xlat16_38.x * u_xlat25;
    u_xlat21.z = u_xlat10.x * u_xlat24;
    u_xlat107 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat107 = sqrt(u_xlat107);
    u_xlat107 = u_xlat107 + u_xlat21.x;
    u_xlat107 = u_xlat107 + 6.10351563e-05;
    u_xlat107 = u_xlat109 * u_xlat107 + 6.10351563e-05;
    u_xlat107 = float(1.0) / u_xlat107;
    u_xlat10.x = (-u_xlat16_102) + 1.0;
    u_xlat16_102 = u_xlat10.x * u_xlat10.x;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_102 = u_xlat10.x * u_xlat16_102;
    u_xlat16_103 = u_xlat10.x * u_xlat16_102;
    u_xlat10.x = (-u_xlat16_102) * u_xlat10.x + 1.0;
    u_xlat10.xzw = u_xlat16_1.xyz * u_xlat10.xxx;
    u_xlat10.xzw = vec3(u_xlat82) * vec3(u_xlat16_103) + u_xlat10.xzw;
    u_xlat16_30.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_30.xyz = u_xlat10.yyy * u_xlat16_30.xyz;
    u_xlat101 = u_xlat101 * u_xlat107;
    u_xlat10.xzw = u_xlat10.xzw * vec3(u_xlat101);
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xzw = min(max(u_xlat10.xzw, 0.0), 1.0);
#else
    u_xlat10.xzw = clamp(u_xlat10.xzw, 0.0, 1.0);
#endif
    u_xlat10.xzw = u_xlat16_18.xyz * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat21.xxx * u_xlat10.xzw;
    u_xlat10.xzw = u_xlat16_31.xyz * u_xlat10.xzw;
    u_xlat16_18.xyz = u_xlat10.xzw * u_xlat10.yyy + u_xlat16_29.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * u_xlat21.xxx + u_xlat16_17.xyz;
    u_xlat35.x = u_xlat35.x + -1.0;
    u_xlat35.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat35.xx + vec2(1.0, 1.0);
    u_xlat16_29.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_29.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_29.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_29.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati107 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat35.xz = min(u_xlat16_69.xx, u_xlat35.xz);
    u_xlat35.x = min(u_xlat35.x, u_xlat16_2.z);
    u_xlat16_30.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat35.xxx * u_xlat16_30.xyz;
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_31.xyz = u_xlat35.xxx * u_xlat16_31.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat35.xxx + (-u_xlat16_31.xyz);
    u_xlat16_31.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_30.xyz = u_xlat16_31.xyz * u_xlat35.xxx + u_xlat16_30.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * _localDiffuseGI.xyz;
    u_xlat16_29.xyz = u_xlat16_29.xyz * u_xlat16_29.xyz;
    u_xlat16_29.xyz = u_xlat16_71.xxx * u_xlat16_29.xyz;
    u_xlati35 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_31.xyz = u_xlat16_29.yyy * _IrradianceACCoeffs[u_xlati35].xyz;
    u_xlat16_29.xyw = u_xlat16_29.xxx * _IrradianceACCoeffs[u_xlati107].xyz + u_xlat16_31.xyz;
    u_xlati35 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_29.xyz = u_xlat16_29.zzz * _IrradianceACCoeffs[u_xlati35].xyz + u_xlat16_29.xyw;
    u_xlat16_31.xyz = u_xlat16_29.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_31.xyz;
    u_xlat10.xyz = vec3(u_xlat108) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat35.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat10.xyz = u_xlat35.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb35 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb35 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb35)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat11.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat11.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat35.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat35.x = inversesqrt(u_xlat35.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat35.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_36.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_53.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_53.y = u_xlat0.x * 0.5;
    u_xlat16_36.xyz = u_xlat16_53.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_36.xyz = min(max(u_xlat16_36.xyz, 0.0), 1.0);
#else
    u_xlat16_36.xyz = clamp(u_xlat16_36.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_36.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_36.x = floor(u_xlat16_10.w);
    u_xlat16_69.x = u_xlat16_36.x + 1.0;
    u_xlat16_69.x = min(u_xlat16_69.x, 15.0);
    u_xlat16_102 = u_xlat16_36.z * 15.0 + (-u_xlat16_36.x);
    u_xlat16_10.x = u_xlat16_36.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_69.x * 16.0 + u_xlat16_10.y;
    u_xlat16_36.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_36.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_36.xy = u_xlat16_36.xy * vec2(0.00390625, 0.0625);
    u_xlat16_33 = texture(_SpecularOcclusionLut3D, u_xlat16_36.xy).x;
    u_xlat16_36.x = (-u_xlat16_0.x) + u_xlat16_33;
    u_xlat16_36.x = u_xlat16_102 * u_xlat16_36.x + u_xlat16_0.x;
    u_xlat16_36.x = u_xlat16_71.x * u_xlat16_36.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_36.x;
    u_xlat16_36.x = u_xlat35.z * 0.5;
    u_xlat16_69.x = (-u_xlat35.z) * 0.5 + 1.0;
    u_xlat16_36.x = u_xlat0.x * u_xlat16_69.x + u_xlat16_36.x;
    u_xlat16_69.x = u_xlat16_36.x + u_xlat16_36.x;
    u_xlat16_102 = (-u_xlat16_36.x) * 2.0 + 1.0;
    u_xlat16_36.x = u_xlat16_36.x * u_xlat16_102 + u_xlat16_69.x;
    u_xlat16_36.x = u_xlat35.z * u_xlat16_36.x;
    u_xlat16_36.x = min(u_xlat16_2.z, u_xlat16_36.x);
    u_xlat16_69.x = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_69.x;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_103 = dot(u_xlat16_29.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_38.xyz = u_xlat16_3.xzw * vec3(u_xlat16_103);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_38.xyz : u_xlat16_3.xzw;
    u_xlat22.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat22.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_36.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_18.xyz;
    u_xlat16_102 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_102 = u_xlat16_0.w * _albedoColor.w + u_xlat16_102;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_102 = min(max(u_xlat16_102, 0.0), 1.0);
#else
    u_xlat16_102 = clamp(u_xlat16_102, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_102 : u_xlat16_100;
    u_xlat16_5.xyz = u_xlat16_18.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_30.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_100 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_100) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
float u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
float u_xlat28;
vec3 u_xlat29;
mediump float u_xlat16_29;
vec3 u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
vec3 u_xlat40;
vec3 u_xlat45;
mediump vec3 u_xlat16_49;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
vec2 u_xlat68;
mediump vec2 u_xlat16_68;
float u_xlat69;
float u_xlat87;
mediump float u_xlat16_88;
float u_xlat89;
bool u_xlatb89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_95;
int u_xlati95;
bool u_xlatb95;
float u_xlat96;
float u_xlat97;
bool u_xlatb97;
float u_xlat98;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_90 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_90) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb89 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat89 = (u_xlatb89) ? 1.0 : -1.0;
    u_xlat89 = u_xlat89 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(0.5<_anisoUse2U);
#else
    u_xlatb95 = 0.5<_anisoUse2U;
#endif
    u_xlat68.xy = (bool(u_xlatb95)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat68.xy = u_xlat68.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_95 = texture(_anisotropicMap, u_xlat68.xy).x;
    u_xlat95 = u_xlat16_95 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_68.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat96 = u_xlat95 * _sunShift + u_xlat16_91;
    u_xlat96 = u_xlat96 + vs_TEXCOORD5;
    u_xlat98 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat98) + u_xlat0.xyz;
    u_xlat98 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat98);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat89) * u_xlat14.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat89 = u_xlat95 * _sunShift2nd + u_xlat16_91;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_19.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_63);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_32.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_61) + u_xlat16_34.x;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_34.x + u_xlat16_61;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_61;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat11.xyz = u_xlat31.xxx * u_xlat11.xyz;
    u_xlat31.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat96) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat95 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat22.xyz = vec3(u_xlat95) * u_xlat22.xyz;
    u_xlat95 = (-u_xlat16_3.x) + 1.0;
    u_xlat68.x = abs(_AnisotropicStrength_1) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb97 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb97 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat28 = (u_xlatb97) ? u_xlat68.x : u_xlat16_3.x;
    u_xlat24 = (u_xlatb97) ? u_xlat16_3.x : u_xlat68.x;
    u_xlat23 = u_xlat28;
    u_xlat16_34.x = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat68.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_63 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat98 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat101 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat22.xyz;
    u_xlat89 = abs(_AnisotropicStrength_2) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb95 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat28 = (u_xlatb95) ? u_xlat89 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb95) ? u_xlat16_3.x : u_xlat89;
    u_xlat25 = u_xlat28;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat40.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat40.x = min(u_xlat40.x, 1.0);
    u_xlat89 = u_xlat89 * u_xlat16_93;
    u_xlat89 = min(u_xlat89, 1.0);
    u_xlat69 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat40.x * u_xlat25;
    u_xlat22.y = u_xlat89 * u_xlat26;
    u_xlat22.z = u_xlat31.x * u_xlat69;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = max(u_xlat89, 6.10351563e-05);
    u_xlat40.x = u_xlat69 * 0.318309873;
    u_xlat89 = u_xlat69 / u_xlat89;
    u_xlat89 = u_xlat89 * u_xlat89;
    u_xlat89 = u_xlat40.x * u_xlat89;
    u_xlat31.z = max(u_xlat89, 0.0);
    u_xlat21.y = u_xlat68.x * u_xlat26;
    u_xlat21.z = u_xlat95 * u_xlat25;
    u_xlat95 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat21.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_63 * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat95 = u_xlat95 * u_xlat11.x + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat16_92 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat97 = u_xlat16_93 * u_xlat97;
    u_xlat97 = min(u_xlat97, 1.0);
    u_xlat40.x = u_xlat23 * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23;
    u_xlat22.y = u_xlat97 * u_xlat24;
    u_xlat22.z = u_xlat31.x * u_xlat40.x;
    u_xlat31.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31.x = max(u_xlat31.x, 6.10351563e-05);
    u_xlat97 = u_xlat40.x * 0.318309873;
    u_xlat31.x = u_xlat40.x / u_xlat31.x;
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat31.x = u_xlat97 * u_xlat31.x;
    u_xlat31.x = max(u_xlat31.x, 0.0);
    u_xlat31.xz = min(u_xlat31.xz, vec2(16.0, 16.0));
    u_xlat21.y = u_xlat68.x * u_xlat24;
    u_xlat21.z = u_xlat98 * u_xlat23;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = sqrt(u_xlat68.x);
    u_xlat68.x = u_xlat68.x + u_xlat21.x;
    u_xlat16.y = u_xlat16_63 * u_xlat24;
    u_xlat16.z = u_xlat101 * u_xlat23;
    u_xlat97 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat68.y = u_xlat97 + u_xlat16.x;
    u_xlat68.xy = u_xlat68.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat68.x = u_xlat68.x * u_xlat68.y + 6.10351563e-05;
    u_xlat68.x = float(1.0) / u_xlat68.x;
    u_xlat97 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat97 * u_xlat97;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_34.x = u_xlat97 * u_xlat16_90;
    u_xlat11.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_90) * u_xlat97 + 1.0;
    u_xlat40.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_34.xxx + u_xlat40.xyz;
    u_xlat16_34.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31.x = u_xlat31.x * u_xlat68.x;
    u_xlat45.xyz = u_xlat11.xyz * u_xlat31.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_18.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat16.xxx * u_xlat45.xyz;
    u_xlat31.x = u_xlat31.z * u_xlat95;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat31.xxx;
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat45.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.z = dot(u_xlat45.xyz, u_xlat45.xyz);
    u_xlat16_32.xz = max(u_xlat16_32.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_93 = inversesqrt(u_xlat16_32.z);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat45.xyz;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.z);
    u_xlat16_90 = u_xlat16_32.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat31.xxx * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_90);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat10.xzw;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_17.xyz * u_xlat31.xxx + u_xlat16_34.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati31 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat89 = min(u_xlat16_61, 1.0);
    u_xlat95 = min(u_xlat89, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat95) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_27.xyz * vec3(u_xlat95) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_17.xyz;
    u_xlati95 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_27.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati95].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_27.xyz;
    u_xlati31 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_17.xyw;
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat10.xyz = vec3(u_xlat96) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat31.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat10.xyz = u_xlat31.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb31 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb31)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat31.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat31.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_32.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_49.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_49.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_10.w);
    u_xlat16_61 = u_xlat16_32.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_90 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_10.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_61 * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_29;
    u_xlat16_32.x = u_xlat16_90 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat89 * 0.5;
    u_xlat16_61 = (-u_xlat89) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_61 + u_xlat16_32.x;
    u_xlat16_61 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_90 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_90 + u_xlat16_61;
    u_xlat16_32.x = u_xlat89 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_2.z, u_xlat16_32.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_91);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_90 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_90 = u_xlat16_0.w * _albedoColor.w + u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_90 : u_xlat16_88;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_34.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
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
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(12) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
float u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
float u_xlat28;
vec3 u_xlat29;
mediump float u_xlat16_29;
vec3 u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
vec3 u_xlat40;
vec3 u_xlat45;
mediump vec3 u_xlat16_49;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
vec2 u_xlat68;
mediump vec2 u_xlat16_68;
float u_xlat69;
float u_xlat87;
mediump float u_xlat16_88;
float u_xlat89;
bool u_xlatb89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_95;
int u_xlati95;
bool u_xlatb95;
float u_xlat96;
float u_xlat97;
bool u_xlatb97;
float u_xlat98;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_90 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_90) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb89 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat89 = (u_xlatb89) ? 1.0 : -1.0;
    u_xlat89 = u_xlat89 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(0.5<_anisoUse2U);
#else
    u_xlatb95 = 0.5<_anisoUse2U;
#endif
    u_xlat68.xy = (bool(u_xlatb95)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat68.xy = u_xlat68.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_95 = texture(_anisotropicMap, u_xlat68.xy).x;
    u_xlat95 = u_xlat16_95 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_68.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat96 = u_xlat95 * _sunShift + u_xlat16_91;
    u_xlat96 = u_xlat96 + vs_TEXCOORD5;
    u_xlat98 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat98) + u_xlat0.xyz;
    u_xlat98 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat98);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat89) * u_xlat14.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat89 = u_xlat95 * _sunShift2nd + u_xlat16_91;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_19.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_63);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_32.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_61) + u_xlat16_34.x;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_34.x + u_xlat16_61;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_61;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat11.xyz = u_xlat31.xxx * u_xlat11.xyz;
    u_xlat31.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat96) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat95 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat22.xyz = vec3(u_xlat95) * u_xlat22.xyz;
    u_xlat95 = (-u_xlat16_3.x) + 1.0;
    u_xlat68.x = abs(_AnisotropicStrength_1) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb97 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb97 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat28 = (u_xlatb97) ? u_xlat68.x : u_xlat16_3.x;
    u_xlat24 = (u_xlatb97) ? u_xlat16_3.x : u_xlat68.x;
    u_xlat23 = u_xlat28;
    u_xlat16_34.x = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat68.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_63 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat98 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat101 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat22.xyz;
    u_xlat89 = abs(_AnisotropicStrength_2) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb95 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat28 = (u_xlatb95) ? u_xlat89 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb95) ? u_xlat16_3.x : u_xlat89;
    u_xlat25 = u_xlat28;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat40.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat40.x = min(u_xlat40.x, 1.0);
    u_xlat89 = u_xlat89 * u_xlat16_93;
    u_xlat89 = min(u_xlat89, 1.0);
    u_xlat69 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat40.x * u_xlat25;
    u_xlat22.y = u_xlat89 * u_xlat26;
    u_xlat22.z = u_xlat31.x * u_xlat69;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = max(u_xlat89, 6.10351563e-05);
    u_xlat40.x = u_xlat69 * 0.318309873;
    u_xlat89 = u_xlat69 / u_xlat89;
    u_xlat89 = u_xlat89 * u_xlat89;
    u_xlat89 = u_xlat40.x * u_xlat89;
    u_xlat31.z = max(u_xlat89, 0.0);
    u_xlat21.y = u_xlat68.x * u_xlat26;
    u_xlat21.z = u_xlat95 * u_xlat25;
    u_xlat95 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat21.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_63 * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat95 = u_xlat95 * u_xlat11.x + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat16_92 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat97 = u_xlat16_93 * u_xlat97;
    u_xlat97 = min(u_xlat97, 1.0);
    u_xlat40.x = u_xlat23 * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23;
    u_xlat22.y = u_xlat97 * u_xlat24;
    u_xlat22.z = u_xlat31.x * u_xlat40.x;
    u_xlat31.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31.x = max(u_xlat31.x, 6.10351563e-05);
    u_xlat97 = u_xlat40.x * 0.318309873;
    u_xlat31.x = u_xlat40.x / u_xlat31.x;
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat31.x = u_xlat97 * u_xlat31.x;
    u_xlat31.x = max(u_xlat31.x, 0.0);
    u_xlat31.xz = min(u_xlat31.xz, vec2(16.0, 16.0));
    u_xlat21.y = u_xlat68.x * u_xlat24;
    u_xlat21.z = u_xlat98 * u_xlat23;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = sqrt(u_xlat68.x);
    u_xlat68.x = u_xlat68.x + u_xlat21.x;
    u_xlat16.y = u_xlat16_63 * u_xlat24;
    u_xlat16.z = u_xlat101 * u_xlat23;
    u_xlat97 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat68.y = u_xlat97 + u_xlat16.x;
    u_xlat68.xy = u_xlat68.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat68.x = u_xlat68.x * u_xlat68.y + 6.10351563e-05;
    u_xlat68.x = float(1.0) / u_xlat68.x;
    u_xlat97 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat97 * u_xlat97;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_34.x = u_xlat97 * u_xlat16_90;
    u_xlat11.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_90) * u_xlat97 + 1.0;
    u_xlat40.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_34.xxx + u_xlat40.xyz;
    u_xlat16_34.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31.x = u_xlat31.x * u_xlat68.x;
    u_xlat45.xyz = u_xlat11.xyz * u_xlat31.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_18.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat16.xxx * u_xlat45.xyz;
    u_xlat31.x = u_xlat31.z * u_xlat95;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat31.xxx;
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat45.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.z = dot(u_xlat45.xyz, u_xlat45.xyz);
    u_xlat16_32.xz = max(u_xlat16_32.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_93 = inversesqrt(u_xlat16_32.z);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat45.xyz;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.z);
    u_xlat16_90 = u_xlat16_32.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat31.xxx * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_90);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat10.xzw;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_17.xyz * u_xlat31.xxx + u_xlat16_34.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati31 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat89 = min(u_xlat16_61, 1.0);
    u_xlat95 = min(u_xlat89, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat95) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_27.xyz * vec3(u_xlat95) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_17.xyz;
    u_xlati95 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_27.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati95].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_27.xyz;
    u_xlati31 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_17.xyw;
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat10.xyz = vec3(u_xlat96) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat31.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat10.xyz = u_xlat31.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb31 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb31)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat31.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat31.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_32.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_49.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_49.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_10.w);
    u_xlat16_61 = u_xlat16_32.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_90 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_10.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_61 * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_29;
    u_xlat16_32.x = u_xlat16_90 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat89 * 0.5;
    u_xlat16_61 = (-u_xlat89) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_61 + u_xlat16_32.x;
    u_xlat16_61 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_90 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_90 + u_xlat16_61;
    u_xlat16_32.x = u_xlat89 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_2.z, u_xlat16_32.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_91);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_90 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_90 = u_xlat16_0.w * _albedoColor.w + u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_90 : u_xlat16_88;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_34.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
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
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat29.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat87);
    u_xlat29.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat29.xyz + u_xlat16_2.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
vec3 u_xlat30;
mediump float u_xlat16_30;
vec3 u_xlat32;
int u_xlati32;
bool u_xlatb32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat41;
vec3 u_xlat46;
mediump vec3 u_xlat16_50;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
vec2 u_xlat70;
mediump vec2 u_xlat16_70;
bool u_xlatb70;
float u_xlat71;
float u_xlat90;
mediump float u_xlat16_91;
float u_xlat92;
bool u_xlatb92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
mediump float u_xlat16_96;
float u_xlat98;
mediump float u_xlat16_98;
int u_xlati98;
bool u_xlatb98;
float u_xlat99;
float u_xlat100;
float u_xlat101;
bool u_xlatb101;
float u_xlat104;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_91 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_93 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_93) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_93 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_94 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_12.xyz = vec3(u_xlat16_94) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb92 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat92 = (u_xlatb92) ? 1.0 : -1.0;
    u_xlat92 = u_xlat92 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb98 = !!(0.5<_anisoUse2U);
#else
    u_xlatb98 = 0.5<_anisoUse2U;
#endif
    u_xlat70.xy = (bool(u_xlatb98)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat70.xy = u_xlat70.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_98 = texture(_anisotropicMap, u_xlat70.xy).x;
    u_xlat98 = u_xlat16_98 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_70.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat99 = u_xlat98 * _sunShift + u_xlat16_65;
    u_xlat99 = u_xlat99 + vs_TEXCOORD5;
    u_xlat101 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat101) + u_xlat0.xyz;
    u_xlat101 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat101);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat92) * u_xlat14.xyz;
    u_xlat16_65 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * vs_TEXCOORD1.yzx;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat92 = u_xlat98 * _sunShift2nd + u_xlat16_65;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_19.xyz = vec3(u_xlat16_65) * u_xlat16_19.xyz;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_50.z = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_95 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_95);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_33.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_63 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_63) + u_xlat16_35.x;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_35.x + u_xlat16_63;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_63;
    u_xlat16_63 = u_xlat16_65 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb32 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat98 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat16.xyz = vec3(u_xlat98) * u_xlat16.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat98 = (-u_xlat98) * u_xlat98 + 1.0;
    u_xlat98 = sqrt(u_xlat98);
    u_xlat98 = u_xlat98 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat98) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb32)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat32.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.x = min(max(u_xlat32.x, 0.0), 1.0);
#else
    u_xlat32.x = clamp(u_xlat32.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat32.x) + u_xlat13.z;
    u_xlat98 = max((-u_xlat13.w), u_xlat32.x);
    u_xlat98 = (-u_xlat32.x) + u_xlat98;
    u_xlat13.z = _ShadowBias.y * u_xlat98 + u_xlat32.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat32.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat98 = (-u_xlat16_35.x) + 1.0;
    u_xlat32.x = u_xlat32.x * u_xlat98 + u_xlat16_35.x;
    u_xlat32.x = (-u_xlat32.x) + 1.0;
    u_xlat32.x = (-u_xlat32.x) * u_xlat16_93 + 1.0;
    u_xlat32.x = max(u_xlat32.x, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_94) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat98 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat11.xyz = vec3(u_xlat98) * u_xlat11.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat98 = min(max(u_xlat98, 0.0), 1.0);
#else
    u_xlat98 = clamp(u_xlat98, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat99) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat70.x = inversesqrt(u_xlat70.x);
    u_xlat22.xyz = u_xlat70.xxx * u_xlat22.xyz;
    u_xlat70.x = (-u_xlat16_3.x) + 1.0;
    u_xlat100 = abs(_AnisotropicStrength_1) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb101 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat29 = (u_xlatb101) ? u_xlat100 : u_xlat16_3.x;
    u_xlat24 = (u_xlatb101) ? u_xlat16_3.x : u_xlat100;
    u_xlat23.x = u_xlat29;
    u_xlat16_94 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat100 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_35.x = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat101 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat104 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat106 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat22.xyz;
    u_xlat92 = abs(_AnisotropicStrength_2) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb70 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat29 = (u_xlatb70) ? u_xlat92 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb70) ? u_xlat16_3.x : u_xlat92;
    u_xlat25 = u_xlat29;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_95 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat41 = u_xlat16_94 * u_xlat16_95;
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat92 = u_xlat92 * u_xlat16_96;
    u_xlat92 = min(u_xlat92, 1.0);
    u_xlat71 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat41 * u_xlat25;
    u_xlat22.y = u_xlat92 * u_xlat26;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = max(u_xlat92, 6.10351563e-05);
    u_xlat41 = u_xlat71 * 0.318309873;
    u_xlat92 = u_xlat71 / u_xlat92;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat41 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat26;
    u_xlat21.z = u_xlat70.x * u_xlat25;
    u_xlat70.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat70.x = sqrt(u_xlat70.x);
    u_xlat70.x = u_xlat70.x + u_xlat21.x;
    u_xlat70.x = u_xlat70.x + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = u_xlat70.x * u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = float(1.0) / u_xlat70.x;
    u_xlat16_95 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_94 * u_xlat16_95;
    u_xlat11.y = u_xlat16_96 * u_xlat101;
    u_xlat11.xy = min(u_xlat11.xy, vec2(1.0, 1.0));
    u_xlat71 = u_xlat23.x * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23.x;
    u_xlat22.y = u_xlat11.y * u_xlat24;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat98 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat98 = max(u_xlat98, 6.10351563e-05);
    u_xlat11.x = u_xlat71 * 0.318309873;
    u_xlat98 = u_xlat71 / u_xlat98;
    u_xlat98 = u_xlat98 * u_xlat98;
    u_xlat98 = u_xlat11.x * u_xlat98;
    u_xlat98 = max(u_xlat98, 0.0);
    u_xlat98 = min(u_xlat98, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat24;
    u_xlat21.z = u_xlat104 * u_xlat23.x;
    u_xlat100 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat21.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat24;
    u_xlat16.z = u_xlat106 * u_xlat23.x;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat100 = u_xlat100 * u_xlat11.x + 6.10351563e-05;
    u_xlat100 = float(1.0) / u_xlat100;
    u_xlat11.x = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat11.x * u_xlat11.x;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_94 = u_xlat11.x * u_xlat16_93;
    u_xlat41 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_93) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xyz = vec3(u_xlat41) * vec3(u_xlat16_94) + u_xlat11.xzw;
    u_xlat16_27.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz + _shadowColor.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat98 = u_xlat98 * u_xlat100;
    u_xlat46.xyz = u_xlat11.xyz * vec3(u_xlat98);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat16_18.xyz * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat16.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat92 = u_xlat92 * u_xlat70.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat92);
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat16_27.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat46.xyz * u_xlat16_27.xyz + u_xlat11.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat46.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat46.xyz, u_xlat46.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_94 = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat46.xyz;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.zzz + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_93 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_18.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat92) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_28.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_93 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_93);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat10.xzw;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_27.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.yyy * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat92) + u_xlat16_17.xyz;
    u_xlat32.x = u_xlat32.x + -1.0;
    u_xlat32.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat32.xx + vec2(1.0, 1.0);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati98 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat32.xz = min(vec2(u_xlat16_63), u_xlat32.xz);
    u_xlat32.x = min(u_xlat32.x, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat32.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_28.xyz * u_xlat32.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlati32 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati32].xyz;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati98].xyz + u_xlat16_28.xyz;
    u_xlati32 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati32].xyz + u_xlat16_18.xyw;
    u_xlat16_28.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_28.xyz;
    u_xlat10.xyz = vec3(u_xlat99) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat32.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat10.xyz = u_xlat32.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb32 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb32)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat32.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat32.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_33.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_50.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_50.y = u_xlat0.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_50.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_63 = u_xlat16_33.x + 1.0;
    u_xlat16_63 = min(u_xlat16_63, 15.0);
    u_xlat16_93 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_63 * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_93 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_65 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat32.z * 0.5;
    u_xlat16_63 = (-u_xlat32.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_63 + u_xlat16_33.x;
    u_xlat16_63 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_93 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_93 + u_xlat16_63;
    u_xlat16_33.x = u_xlat32.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_63 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_63;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_94 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_3.xzw * vec3(u_xlat16_94);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_93 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_93 = u_xlat16_0.w * _albedoColor.w + u_xlat16_93;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_93 : u_xlat16_91;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_91 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat90 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat90 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat30.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat30.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat90);
    u_xlat30.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat30.xyz + u_xlat16_2.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _ACESLutTex;
UNITY_LOCATION(14) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
mediump vec3 u_xlat16_8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
vec3 u_xlat30;
mediump float u_xlat16_30;
vec3 u_xlat32;
int u_xlati32;
bool u_xlatb32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat41;
vec3 u_xlat46;
mediump vec3 u_xlat16_50;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
vec2 u_xlat70;
mediump vec2 u_xlat16_70;
bool u_xlatb70;
float u_xlat71;
float u_xlat90;
mediump float u_xlat16_91;
float u_xlat92;
bool u_xlatb92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
mediump float u_xlat16_96;
float u_xlat98;
mediump float u_xlat16_98;
int u_xlati98;
bool u_xlatb98;
float u_xlat99;
float u_xlat100;
float u_xlat101;
bool u_xlatb101;
float u_xlat104;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_91 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_93 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_93) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_93 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_94 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_12.xyz = vec3(u_xlat16_94) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb92 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat92 = (u_xlatb92) ? 1.0 : -1.0;
    u_xlat92 = u_xlat92 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb98 = !!(0.5<_anisoUse2U);
#else
    u_xlatb98 = 0.5<_anisoUse2U;
#endif
    u_xlat70.xy = (bool(u_xlatb98)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat70.xy = u_xlat70.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_98 = texture(_anisotropicMap, u_xlat70.xy).x;
    u_xlat98 = u_xlat16_98 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_70.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat99 = u_xlat98 * _sunShift + u_xlat16_65;
    u_xlat99 = u_xlat99 + vs_TEXCOORD5;
    u_xlat101 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat101) + u_xlat0.xyz;
    u_xlat101 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat101);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat92) * u_xlat14.xyz;
    u_xlat16_65 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * vs_TEXCOORD1.yzx;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat92 = u_xlat98 * _sunShift2nd + u_xlat16_65;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_19.xyz = vec3(u_xlat16_65) * u_xlat16_19.xyz;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_50.z = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_95 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_95);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_33.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_63 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_63) + u_xlat16_35.x;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_35.x + u_xlat16_63;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_63;
    u_xlat16_63 = u_xlat16_65 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb32 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat98 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat16.xyz = vec3(u_xlat98) * u_xlat16.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat98 = (-u_xlat98) * u_xlat98 + 1.0;
    u_xlat98 = sqrt(u_xlat98);
    u_xlat98 = u_xlat98 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat98) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb32)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat32.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.x = min(max(u_xlat32.x, 0.0), 1.0);
#else
    u_xlat32.x = clamp(u_xlat32.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat32.x) + u_xlat13.z;
    u_xlat98 = max((-u_xlat13.w), u_xlat32.x);
    u_xlat98 = (-u_xlat32.x) + u_xlat98;
    u_xlat13.z = _ShadowBias.y * u_xlat98 + u_xlat32.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat32.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat98 = (-u_xlat16_35.x) + 1.0;
    u_xlat32.x = u_xlat32.x * u_xlat98 + u_xlat16_35.x;
    u_xlat32.x = (-u_xlat32.x) + 1.0;
    u_xlat32.x = (-u_xlat32.x) * u_xlat16_93 + 1.0;
    u_xlat32.x = max(u_xlat32.x, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_94) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat98 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat11.xyz = vec3(u_xlat98) * u_xlat11.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat98 = min(max(u_xlat98, 0.0), 1.0);
#else
    u_xlat98 = clamp(u_xlat98, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat99) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat70.x = inversesqrt(u_xlat70.x);
    u_xlat22.xyz = u_xlat70.xxx * u_xlat22.xyz;
    u_xlat70.x = (-u_xlat16_3.x) + 1.0;
    u_xlat100 = abs(_AnisotropicStrength_1) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb101 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat29 = (u_xlatb101) ? u_xlat100 : u_xlat16_3.x;
    u_xlat24 = (u_xlatb101) ? u_xlat16_3.x : u_xlat100;
    u_xlat23.x = u_xlat29;
    u_xlat16_94 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat100 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_35.x = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat101 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat104 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat106 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat22.xyz;
    u_xlat92 = abs(_AnisotropicStrength_2) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb70 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat29 = (u_xlatb70) ? u_xlat92 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb70) ? u_xlat16_3.x : u_xlat92;
    u_xlat25 = u_xlat29;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_95 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat41 = u_xlat16_94 * u_xlat16_95;
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat92 = u_xlat92 * u_xlat16_96;
    u_xlat92 = min(u_xlat92, 1.0);
    u_xlat71 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat41 * u_xlat25;
    u_xlat22.y = u_xlat92 * u_xlat26;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = max(u_xlat92, 6.10351563e-05);
    u_xlat41 = u_xlat71 * 0.318309873;
    u_xlat92 = u_xlat71 / u_xlat92;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat41 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat26;
    u_xlat21.z = u_xlat70.x * u_xlat25;
    u_xlat70.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat70.x = sqrt(u_xlat70.x);
    u_xlat70.x = u_xlat70.x + u_xlat21.x;
    u_xlat70.x = u_xlat70.x + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = u_xlat70.x * u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = float(1.0) / u_xlat70.x;
    u_xlat16_95 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_94 * u_xlat16_95;
    u_xlat11.y = u_xlat16_96 * u_xlat101;
    u_xlat11.xy = min(u_xlat11.xy, vec2(1.0, 1.0));
    u_xlat71 = u_xlat23.x * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23.x;
    u_xlat22.y = u_xlat11.y * u_xlat24;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat98 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat98 = max(u_xlat98, 6.10351563e-05);
    u_xlat11.x = u_xlat71 * 0.318309873;
    u_xlat98 = u_xlat71 / u_xlat98;
    u_xlat98 = u_xlat98 * u_xlat98;
    u_xlat98 = u_xlat11.x * u_xlat98;
    u_xlat98 = max(u_xlat98, 0.0);
    u_xlat98 = min(u_xlat98, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat24;
    u_xlat21.z = u_xlat104 * u_xlat23.x;
    u_xlat100 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat21.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat24;
    u_xlat16.z = u_xlat106 * u_xlat23.x;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat100 = u_xlat100 * u_xlat11.x + 6.10351563e-05;
    u_xlat100 = float(1.0) / u_xlat100;
    u_xlat11.x = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat11.x * u_xlat11.x;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_94 = u_xlat11.x * u_xlat16_93;
    u_xlat41 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_93) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xyz = vec3(u_xlat41) * vec3(u_xlat16_94) + u_xlat11.xzw;
    u_xlat16_27.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz + _shadowColor.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat98 = u_xlat98 * u_xlat100;
    u_xlat46.xyz = u_xlat11.xyz * vec3(u_xlat98);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat16_18.xyz * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat16.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat92 = u_xlat92 * u_xlat70.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat92);
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat16_27.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat46.xyz * u_xlat16_27.xyz + u_xlat11.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat46.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat46.xyz, u_xlat46.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_94 = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat46.xyz;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.zzz + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_93 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_18.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat92) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_28.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_93 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_93);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat10.xzw;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_27.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.yyy * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat92) + u_xlat16_17.xyz;
    u_xlat32.x = u_xlat32.x + -1.0;
    u_xlat32.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat32.xx + vec2(1.0, 1.0);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati98 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat32.xz = min(vec2(u_xlat16_63), u_xlat32.xz);
    u_xlat32.x = min(u_xlat32.x, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat32.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_28.xyz * u_xlat32.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlati32 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati32].xyz;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati98].xyz + u_xlat16_28.xyz;
    u_xlati32 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati32].xyz + u_xlat16_18.xyw;
    u_xlat16_28.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_28.xyz;
    u_xlat10.xyz = vec3(u_xlat99) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat32.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat10.xyz = u_xlat32.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb32 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb32)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat32.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat32.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_33.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_50.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_50.y = u_xlat0.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_50.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_63 = u_xlat16_33.x + 1.0;
    u_xlat16_63 = min(u_xlat16_63, 15.0);
    u_xlat16_93 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_63 * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_93 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_65 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat32.z * 0.5;
    u_xlat16_63 = (-u_xlat32.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_63 + u_xlat16_33.x;
    u_xlat16_63 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_93 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_93 + u_xlat16_63;
    u_xlat16_33.x = u_xlat32.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_63 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_63;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_94 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_3.xzw * vec3(u_xlat16_94);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_93 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_93 = u_xlat16_0.w * _albedoColor.w + u_xlat16_93;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_93 : u_xlat16_91;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_91 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
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
    u_xlat90 = floor(u_xlat1.x);
    u_xlat1.yz = u_xlat0.yz * vec2(0.05859375, 0.9375) + vec2(0.001953125, 0.03125);
    u_xlat1.x = u_xlat90 * 0.0625 + u_xlat1.y;
    u_xlat16_2.xyz = textureLod(_ACESLutTex, u_xlat1.xz, 0.0).xyz;
    u_xlat30.xy = u_xlat1.xw + vec2(0.0625, 0.03125);
    u_xlat16_8.xyz = textureLod(_ACESLutTex, u_xlat30.xy, 0.0).xyz;
    u_xlat0.x = u_xlat0.x * 15.0 + (-u_xlat90);
    u_xlat30.xyz = (-u_xlat16_2.xyz) + u_xlat16_8.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat30.xyz + u_xlat16_2.xyz;
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
in mediump vec2 in_TEXCOORD0;
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
float u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_29;
vec3 u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
vec3 u_xlat40;
vec3 u_xlat45;
mediump vec3 u_xlat16_49;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
vec2 u_xlat68;
mediump vec2 u_xlat16_68;
float u_xlat69;
mediump float u_xlat16_88;
float u_xlat89;
bool u_xlatb89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_95;
int u_xlati95;
bool u_xlatb95;
float u_xlat96;
float u_xlat97;
bool u_xlatb97;
float u_xlat98;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_90 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_90) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb89 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat89 = (u_xlatb89) ? 1.0 : -1.0;
    u_xlat89 = u_xlat89 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(0.5<_anisoUse2U);
#else
    u_xlatb95 = 0.5<_anisoUse2U;
#endif
    u_xlat68.xy = (bool(u_xlatb95)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat68.xy = u_xlat68.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_95 = texture(_anisotropicMap, u_xlat68.xy).x;
    u_xlat95 = u_xlat16_95 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_68.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat96 = u_xlat95 * _sunShift + u_xlat16_91;
    u_xlat96 = u_xlat96 + vs_TEXCOORD5;
    u_xlat98 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat98) + u_xlat0.xyz;
    u_xlat98 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat98);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat89) * u_xlat14.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat89 = u_xlat95 * _sunShift2nd + u_xlat16_91;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_19.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_63);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_32.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_61) + u_xlat16_34.x;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_34.x + u_xlat16_61;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_61;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat11.xyz = u_xlat31.xxx * u_xlat11.xyz;
    u_xlat31.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat96) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat95 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat22.xyz = vec3(u_xlat95) * u_xlat22.xyz;
    u_xlat95 = (-u_xlat16_3.x) + 1.0;
    u_xlat68.x = abs(_AnisotropicStrength_1) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb97 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb97 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat28 = (u_xlatb97) ? u_xlat68.x : u_xlat16_3.x;
    u_xlat24 = (u_xlatb97) ? u_xlat16_3.x : u_xlat68.x;
    u_xlat23 = u_xlat28;
    u_xlat16_34.x = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat68.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_63 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat98 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat101 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat22.xyz;
    u_xlat89 = abs(_AnisotropicStrength_2) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb95 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat28 = (u_xlatb95) ? u_xlat89 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb95) ? u_xlat16_3.x : u_xlat89;
    u_xlat25 = u_xlat28;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat40.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat40.x = min(u_xlat40.x, 1.0);
    u_xlat89 = u_xlat89 * u_xlat16_93;
    u_xlat89 = min(u_xlat89, 1.0);
    u_xlat69 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat40.x * u_xlat25;
    u_xlat22.y = u_xlat89 * u_xlat26;
    u_xlat22.z = u_xlat31.x * u_xlat69;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = max(u_xlat89, 6.10351563e-05);
    u_xlat40.x = u_xlat69 * 0.318309873;
    u_xlat89 = u_xlat69 / u_xlat89;
    u_xlat89 = u_xlat89 * u_xlat89;
    u_xlat89 = u_xlat40.x * u_xlat89;
    u_xlat31.z = max(u_xlat89, 0.0);
    u_xlat21.y = u_xlat68.x * u_xlat26;
    u_xlat21.z = u_xlat95 * u_xlat25;
    u_xlat95 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat21.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_63 * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat95 = u_xlat95 * u_xlat11.x + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat16_92 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat97 = u_xlat16_93 * u_xlat97;
    u_xlat97 = min(u_xlat97, 1.0);
    u_xlat40.x = u_xlat23 * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23;
    u_xlat22.y = u_xlat97 * u_xlat24;
    u_xlat22.z = u_xlat31.x * u_xlat40.x;
    u_xlat31.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31.x = max(u_xlat31.x, 6.10351563e-05);
    u_xlat97 = u_xlat40.x * 0.318309873;
    u_xlat31.x = u_xlat40.x / u_xlat31.x;
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat31.x = u_xlat97 * u_xlat31.x;
    u_xlat31.x = max(u_xlat31.x, 0.0);
    u_xlat31.xz = min(u_xlat31.xz, vec2(16.0, 16.0));
    u_xlat21.y = u_xlat68.x * u_xlat24;
    u_xlat21.z = u_xlat98 * u_xlat23;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = sqrt(u_xlat68.x);
    u_xlat68.x = u_xlat68.x + u_xlat21.x;
    u_xlat16.y = u_xlat16_63 * u_xlat24;
    u_xlat16.z = u_xlat101 * u_xlat23;
    u_xlat97 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat68.y = u_xlat97 + u_xlat16.x;
    u_xlat68.xy = u_xlat68.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat68.x = u_xlat68.x * u_xlat68.y + 6.10351563e-05;
    u_xlat68.x = float(1.0) / u_xlat68.x;
    u_xlat97 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat97 * u_xlat97;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_34.x = u_xlat97 * u_xlat16_90;
    u_xlat11.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_90) * u_xlat97 + 1.0;
    u_xlat40.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_34.xxx + u_xlat40.xyz;
    u_xlat16_34.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31.x = u_xlat31.x * u_xlat68.x;
    u_xlat45.xyz = u_xlat11.xyz * u_xlat31.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_18.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat16.xxx * u_xlat45.xyz;
    u_xlat31.x = u_xlat31.z * u_xlat95;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat31.xxx;
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat45.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.z = dot(u_xlat45.xyz, u_xlat45.xyz);
    u_xlat16_32.xz = max(u_xlat16_32.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_93 = inversesqrt(u_xlat16_32.z);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat45.xyz;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.z);
    u_xlat16_90 = u_xlat16_32.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat31.xxx * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_90);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat10.xzw;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_17.xyz * u_xlat31.xxx + u_xlat16_34.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati31 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat89 = min(u_xlat16_61, 1.0);
    u_xlat95 = min(u_xlat89, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat95) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_27.xyz * vec3(u_xlat95) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_17.xyz;
    u_xlati95 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_27.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati95].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_27.xyz;
    u_xlati31 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_17.xyw;
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat10.xyz = vec3(u_xlat96) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat31.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat10.xyz = u_xlat31.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb31 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb31)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat31.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat31.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_32.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_49.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_49.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_10.w);
    u_xlat16_61 = u_xlat16_32.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_90 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_10.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_61 * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_29;
    u_xlat16_32.x = u_xlat16_90 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat89 * 0.5;
    u_xlat16_61 = (-u_xlat89) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_61 + u_xlat16_32.x;
    u_xlat16_61 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_90 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_90 + u_xlat16_61;
    u_xlat16_32.x = u_xlat89 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_2.z, u_xlat16_32.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_91);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_90 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_90 = u_xlat16_0.w * _albedoColor.w + u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_90 : u_xlat16_88;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_34.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
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
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(7) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(8) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(9) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(10) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(11) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec3 u_xlat21;
vec3 u_xlat22;
float u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
float u_xlat28;
mediump float u_xlat16_29;
vec3 u_xlat31;
int u_xlati31;
bool u_xlatb31;
mediump vec3 u_xlat16_32;
mediump vec3 u_xlat16_34;
vec3 u_xlat40;
vec3 u_xlat45;
mediump vec3 u_xlat16_49;
mediump float u_xlat16_61;
mediump float u_xlat16_63;
vec2 u_xlat68;
mediump vec2 u_xlat16_68;
float u_xlat69;
mediump float u_xlat16_88;
float u_xlat89;
bool u_xlatb89;
mediump float u_xlat16_90;
mediump float u_xlat16_91;
mediump float u_xlat16_92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
float u_xlat95;
mediump float u_xlat16_95;
int u_xlati95;
bool u_xlatb95;
float u_xlat96;
float u_xlat97;
bool u_xlatb97;
float u_xlat98;
float u_xlat101;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_88 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_90 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_90) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xy = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yz;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_90 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_90 = inversesqrt(u_xlat16_90);
    u_xlat16_12.xyz = vec3(u_xlat16_90) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb89 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb89 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat89 = (u_xlatb89) ? 1.0 : -1.0;
    u_xlat89 = u_xlat89 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(0.5<_anisoUse2U);
#else
    u_xlatb95 = 0.5<_anisoUse2U;
#endif
    u_xlat68.xy = (bool(u_xlatb95)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat68.xy = u_xlat68.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_95 = texture(_anisotropicMap, u_xlat68.xy).x;
    u_xlat95 = u_xlat16_95 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_68.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat96 = u_xlat95 * _sunShift + u_xlat16_91;
    u_xlat96 = u_xlat96 + vs_TEXCOORD5;
    u_xlat98 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat98) + u_xlat0.xyz;
    u_xlat98 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat98);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat89) * u_xlat14.xyz;
    u_xlat16_91 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_15.xyz = vec3(u_xlat16_91) * vs_TEXCOORD1.yzx;
    u_xlat16_91 = u_xlat16_68.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_91 = u_xlat16_68.y * _sunShift_special_02 + u_xlat16_91;
    u_xlat89 = u_xlat95 * _sunShift2nd + u_xlat16_91;
    u_xlat89 = u_xlat89 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_91 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_91 = inversesqrt(u_xlat16_91);
    u_xlat16_19.xyz = vec3(u_xlat16_91) * u_xlat16_19.xyz;
    u_xlat16_91 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_49.z = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_91 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_91 = min(max(u_xlat16_91, 0.0), 1.0);
#else
    u_xlat16_91 = clamp(u_xlat16_91, 0.0, 1.0);
#endif
    u_xlat16_91 = u_xlat16_91 + -1.0;
    u_xlat16_91 = _occlusionScale * u_xlat16_91 + 1.0;
    u_xlat16_63 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_63);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_32.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_61 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_61 = min(max(u_xlat16_61, 0.0), 1.0);
#else
    u_xlat16_61 = clamp(u_xlat16_61, 0.0, 1.0);
#endif
    u_xlat16_34.x = u_xlat16_61 * 0.5 + 0.5;
    u_xlat16_34.x = (-u_xlat16_61) + u_xlat16_34.x;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_34.x + u_xlat16_61;
    u_xlat16_61 = u_xlat16_49.z * u_xlat16_61;
    u_xlat16_61 = u_xlat16_91 * u_xlat16_61;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_90) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat31.x = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat11.xyz = u_xlat31.xxx * u_xlat11.xyz;
    u_xlat31.x = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_90 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat96) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat95 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat95 = inversesqrt(u_xlat95);
    u_xlat22.xyz = vec3(u_xlat95) * u_xlat22.xyz;
    u_xlat95 = (-u_xlat16_3.x) + 1.0;
    u_xlat68.x = abs(_AnisotropicStrength_1) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb97 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb97 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat28 = (u_xlatb97) ? u_xlat68.x : u_xlat16_3.x;
    u_xlat24 = (u_xlatb97) ? u_xlat16_3.x : u_xlat68.x;
    u_xlat23 = u_xlat28;
    u_xlat16_34.x = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat68.x = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_63 = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat97 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat98 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat101 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = inversesqrt(u_xlat89);
    u_xlat22.xyz = vec3(u_xlat89) * u_xlat22.xyz;
    u_xlat89 = abs(_AnisotropicStrength_2) * u_xlat95 + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb95 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb95 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat28 = (u_xlatb95) ? u_xlat89 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb95) ? u_xlat16_3.x : u_xlat89;
    u_xlat25 = u_xlat28;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat95 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_92 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat40.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat40.x = min(u_xlat40.x, 1.0);
    u_xlat89 = u_xlat89 * u_xlat16_93;
    u_xlat89 = min(u_xlat89, 1.0);
    u_xlat69 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat40.x * u_xlat25;
    u_xlat22.y = u_xlat89 * u_xlat26;
    u_xlat22.z = u_xlat31.x * u_xlat69;
    u_xlat89 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat89 = max(u_xlat89, 6.10351563e-05);
    u_xlat40.x = u_xlat69 * 0.318309873;
    u_xlat89 = u_xlat69 / u_xlat89;
    u_xlat89 = u_xlat89 * u_xlat89;
    u_xlat89 = u_xlat40.x * u_xlat89;
    u_xlat31.z = max(u_xlat89, 0.0);
    u_xlat21.y = u_xlat68.x * u_xlat26;
    u_xlat21.z = u_xlat95 * u_xlat25;
    u_xlat95 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat95 = sqrt(u_xlat95);
    u_xlat95 = u_xlat95 + u_xlat21.x;
    u_xlat95 = u_xlat95 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_63 * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat95 = u_xlat95 * u_xlat11.x + 6.10351563e-05;
    u_xlat95 = float(1.0) / u_xlat95;
    u_xlat16_92 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_92 = u_xlat16_92 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_93 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_93 = u_xlat16_93 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_92 * u_xlat16_34.x;
    u_xlat11.x = min(u_xlat11.x, 1.0);
    u_xlat97 = u_xlat16_93 * u_xlat97;
    u_xlat97 = min(u_xlat97, 1.0);
    u_xlat40.x = u_xlat23 * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23;
    u_xlat22.y = u_xlat97 * u_xlat24;
    u_xlat22.z = u_xlat31.x * u_xlat40.x;
    u_xlat31.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat31.x = max(u_xlat31.x, 6.10351563e-05);
    u_xlat97 = u_xlat40.x * 0.318309873;
    u_xlat31.x = u_xlat40.x / u_xlat31.x;
    u_xlat31.x = u_xlat31.x * u_xlat31.x;
    u_xlat31.x = u_xlat97 * u_xlat31.x;
    u_xlat31.x = max(u_xlat31.x, 0.0);
    u_xlat31.xz = min(u_xlat31.xz, vec2(16.0, 16.0));
    u_xlat21.y = u_xlat68.x * u_xlat24;
    u_xlat21.z = u_xlat98 * u_xlat23;
    u_xlat68.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat68.x = sqrt(u_xlat68.x);
    u_xlat68.x = u_xlat68.x + u_xlat21.x;
    u_xlat16.y = u_xlat16_63 * u_xlat24;
    u_xlat16.z = u_xlat101 * u_xlat23;
    u_xlat97 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat97 = sqrt(u_xlat97);
    u_xlat68.y = u_xlat97 + u_xlat16.x;
    u_xlat68.xy = u_xlat68.xy + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat68.x = u_xlat68.x * u_xlat68.y + 6.10351563e-05;
    u_xlat68.x = float(1.0) / u_xlat68.x;
    u_xlat97 = (-u_xlat16_90) + 1.0;
    u_xlat16_90 = u_xlat97 * u_xlat97;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_90 = u_xlat97 * u_xlat16_90;
    u_xlat16_34.x = u_xlat97 * u_xlat16_90;
    u_xlat11.x = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat97 = (-u_xlat16_90) * u_xlat97 + 1.0;
    u_xlat40.xyz = u_xlat16_1.xyz * vec3(u_xlat97);
    u_xlat11.xyz = u_xlat11.xxx * u_xlat16_34.xxx + u_xlat40.xyz;
    u_xlat16_34.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat31.x = u_xlat31.x * u_xlat68.x;
    u_xlat45.xyz = u_xlat11.xyz * u_xlat31.xxx;
#ifdef UNITY_ADRENO_ES3
    u_xlat45.xyz = min(max(u_xlat45.xyz, 0.0), 1.0);
#else
    u_xlat45.xyz = clamp(u_xlat45.xyz, 0.0, 1.0);
#endif
    u_xlat45.xyz = u_xlat16_18.xyz * u_xlat45.xyz;
    u_xlat45.xyz = u_xlat16.xxx * u_xlat45.xyz;
    u_xlat31.x = u_xlat31.z * u_xlat95;
    u_xlat11.xyz = u_xlat11.xyz * u_xlat31.xxx;
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat45.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat11.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat45.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_32.z = dot(u_xlat45.xyz, u_xlat45.xyz);
    u_xlat16_32.xz = max(u_xlat16_32.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_93 = inversesqrt(u_xlat16_32.z);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat45.xyz;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_32.z);
    u_xlat16_90 = u_xlat16_32.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat31.xxx * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_34.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_90 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.00100000005>=abs(u_xlat16_90));
#else
    u_xlatb31 = 0.00100000005>=abs(u_xlat16_90);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_90 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_90 = max(u_xlat16_90, 6.10351563e-05);
    u_xlat16_93 = inversesqrt(u_xlat16_90);
    u_xlat16_17.xyz = vec3(u_xlat16_93) * u_xlat10.xzw;
    u_xlat16_18.xy = (bool(u_xlatb31)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb31 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_93 = (u_xlatb31) ? 1.0 : 0.0;
    u_xlat16_94 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_17.xyz);
    u_xlat16_94 = u_xlat16_94 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_94 = min(max(u_xlat16_94, 0.0), 1.0);
#else
    u_xlat16_94 = clamp(u_xlat16_94, 0.0, 1.0);
#endif
    u_xlat16_94 = u_xlat16_94 * u_xlat16_94;
    u_xlat16_93 = max(u_xlat16_93, u_xlat16_94);
    u_xlat16_94 = float(1.0) / float(u_xlat16_90);
    u_xlat16_90 = u_xlat16_90 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_90 = (-u_xlat16_90) * u_xlat16_90 + 1.0;
    u_xlat16_90 = max(u_xlat16_90, 0.0);
    u_xlat16_90 = u_xlat16_90 * u_xlat16_90;
    u_xlat16_90 = u_xlat16_90 * u_xlat16_94;
    u_xlat16_90 = max(u_xlat16_18.x, u_xlat16_90);
    u_xlat16_90 = u_xlat16_93 * u_xlat16_90;
    u_xlat16_18.xyz = vec3(u_xlat16_90) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat31.x = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat31.x = min(max(u_xlat31.x, 0.0), 1.0);
#else
    u_xlat31.x = clamp(u_xlat31.x, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.yyy * u_xlat16_17.xyz;
    u_xlat16_34.xyz = u_xlat16_17.xyz * u_xlat31.xxx + u_xlat16_34.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_17.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati31 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat89 = min(u_xlat16_61, 1.0);
    u_xlat95 = min(u_xlat89, u_xlat16_2.z);
    u_xlat16_18.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat95) * u_xlat16_18.xyz;
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_27.xyz = vec3(u_xlat95) * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(u_xlat95) + (-u_xlat16_27.xyz);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_18.xyz = u_xlat16_27.xyz * vec3(u_xlat95) + u_xlat16_18.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat16_91) * u_xlat16_17.xyz;
    u_xlati95 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_27.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati95].xyz;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_27.xyz;
    u_xlati31 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati31].xyz + u_xlat16_17.xyw;
    u_xlat16_27.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat10.xyz = vec3(u_xlat96) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat31.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat10.xyz = u_xlat31.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb31 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb31 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb31)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat31.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat31.x = inversesqrt(u_xlat31.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat31.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_32.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_49.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_49.y = u_xlat0.x * 0.5;
    u_xlat16_32.xyz = u_xlat16_49.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_32.xyz = min(max(u_xlat16_32.xyz, 0.0), 1.0);
#else
    u_xlat16_32.xyz = clamp(u_xlat16_32.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_32.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_32.x = floor(u_xlat16_10.w);
    u_xlat16_61 = u_xlat16_32.x + 1.0;
    u_xlat16_61 = min(u_xlat16_61, 15.0);
    u_xlat16_90 = u_xlat16_32.z * 15.0 + (-u_xlat16_32.x);
    u_xlat16_10.x = u_xlat16_32.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_61 * 16.0 + u_xlat16_10.y;
    u_xlat16_32.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_32.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_32.xy = u_xlat16_32.xy * vec2(0.00390625, 0.0625);
    u_xlat16_29 = texture(_SpecularOcclusionLut3D, u_xlat16_32.xy).x;
    u_xlat16_32.x = (-u_xlat16_0.x) + u_xlat16_29;
    u_xlat16_32.x = u_xlat16_90 * u_xlat16_32.x + u_xlat16_0.x;
    u_xlat16_32.x = u_xlat16_91 * u_xlat16_32.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_32.x;
    u_xlat16_32.x = u_xlat89 * 0.5;
    u_xlat16_61 = (-u_xlat89) * 0.5 + 1.0;
    u_xlat16_32.x = u_xlat0.x * u_xlat16_61 + u_xlat16_32.x;
    u_xlat16_61 = u_xlat16_32.x + u_xlat16_32.x;
    u_xlat16_90 = (-u_xlat16_32.x) * 2.0 + 1.0;
    u_xlat16_32.x = u_xlat16_32.x * u_xlat16_90 + u_xlat16_61;
    u_xlat16_32.x = u_xlat89 * u_xlat16_32.x;
    u_xlat16_32.x = min(u_xlat16_2.z, u_xlat16_32.x);
    u_xlat16_61 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_61;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_91 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_12.xyz = u_xlat16_3.xzw * vec3(u_xlat16_91);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_32.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_12.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_90 = dot(u_xlat16_12.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_90 = u_xlat16_0.w * _albedoColor.w + u_xlat16_90;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_90 = min(max(u_xlat16_90, 0.0), 1.0);
#else
    u_xlat16_90 = clamp(u_xlat16_90, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_90 : u_xlat16_88;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_34.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
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
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_88) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_30;
vec3 u_xlat32;
int u_xlati32;
bool u_xlatb32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat41;
vec3 u_xlat46;
mediump vec3 u_xlat16_50;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
vec2 u_xlat70;
mediump vec2 u_xlat16_70;
bool u_xlatb70;
float u_xlat71;
mediump float u_xlat16_91;
float u_xlat92;
bool u_xlatb92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
mediump float u_xlat16_96;
float u_xlat98;
mediump float u_xlat16_98;
int u_xlati98;
bool u_xlatb98;
float u_xlat99;
float u_xlat100;
float u_xlat101;
bool u_xlatb101;
float u_xlat104;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_91 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_93 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_93) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_93 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_94 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_12.xyz = vec3(u_xlat16_94) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb92 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat92 = (u_xlatb92) ? 1.0 : -1.0;
    u_xlat92 = u_xlat92 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb98 = !!(0.5<_anisoUse2U);
#else
    u_xlatb98 = 0.5<_anisoUse2U;
#endif
    u_xlat70.xy = (bool(u_xlatb98)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat70.xy = u_xlat70.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_98 = texture(_anisotropicMap, u_xlat70.xy).x;
    u_xlat98 = u_xlat16_98 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_70.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat99 = u_xlat98 * _sunShift + u_xlat16_65;
    u_xlat99 = u_xlat99 + vs_TEXCOORD5;
    u_xlat101 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat101) + u_xlat0.xyz;
    u_xlat101 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat101);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat92) * u_xlat14.xyz;
    u_xlat16_65 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * vs_TEXCOORD1.yzx;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat92 = u_xlat98 * _sunShift2nd + u_xlat16_65;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_19.xyz = vec3(u_xlat16_65) * u_xlat16_19.xyz;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_50.z = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_95 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_95);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_33.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_63 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_63) + u_xlat16_35.x;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_35.x + u_xlat16_63;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_63;
    u_xlat16_63 = u_xlat16_65 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb32 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat98 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat16.xyz = vec3(u_xlat98) * u_xlat16.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat98 = (-u_xlat98) * u_xlat98 + 1.0;
    u_xlat98 = sqrt(u_xlat98);
    u_xlat98 = u_xlat98 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat98) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb32)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat32.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.x = min(max(u_xlat32.x, 0.0), 1.0);
#else
    u_xlat32.x = clamp(u_xlat32.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat32.x) + u_xlat13.z;
    u_xlat98 = max((-u_xlat13.w), u_xlat32.x);
    u_xlat98 = (-u_xlat32.x) + u_xlat98;
    u_xlat13.z = _ShadowBias.y * u_xlat98 + u_xlat32.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat32.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat98 = (-u_xlat16_35.x) + 1.0;
    u_xlat32.x = u_xlat32.x * u_xlat98 + u_xlat16_35.x;
    u_xlat32.x = (-u_xlat32.x) + 1.0;
    u_xlat32.x = (-u_xlat32.x) * u_xlat16_93 + 1.0;
    u_xlat32.x = max(u_xlat32.x, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_94) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat98 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat11.xyz = vec3(u_xlat98) * u_xlat11.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat98 = min(max(u_xlat98, 0.0), 1.0);
#else
    u_xlat98 = clamp(u_xlat98, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat99) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat70.x = inversesqrt(u_xlat70.x);
    u_xlat22.xyz = u_xlat70.xxx * u_xlat22.xyz;
    u_xlat70.x = (-u_xlat16_3.x) + 1.0;
    u_xlat100 = abs(_AnisotropicStrength_1) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb101 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat29 = (u_xlatb101) ? u_xlat100 : u_xlat16_3.x;
    u_xlat24 = (u_xlatb101) ? u_xlat16_3.x : u_xlat100;
    u_xlat23.x = u_xlat29;
    u_xlat16_94 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat100 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_35.x = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat101 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat104 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat106 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat22.xyz;
    u_xlat92 = abs(_AnisotropicStrength_2) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb70 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat29 = (u_xlatb70) ? u_xlat92 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb70) ? u_xlat16_3.x : u_xlat92;
    u_xlat25 = u_xlat29;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_95 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat41 = u_xlat16_94 * u_xlat16_95;
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat92 = u_xlat92 * u_xlat16_96;
    u_xlat92 = min(u_xlat92, 1.0);
    u_xlat71 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat41 * u_xlat25;
    u_xlat22.y = u_xlat92 * u_xlat26;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = max(u_xlat92, 6.10351563e-05);
    u_xlat41 = u_xlat71 * 0.318309873;
    u_xlat92 = u_xlat71 / u_xlat92;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat41 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat26;
    u_xlat21.z = u_xlat70.x * u_xlat25;
    u_xlat70.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat70.x = sqrt(u_xlat70.x);
    u_xlat70.x = u_xlat70.x + u_xlat21.x;
    u_xlat70.x = u_xlat70.x + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = u_xlat70.x * u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = float(1.0) / u_xlat70.x;
    u_xlat16_95 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_94 * u_xlat16_95;
    u_xlat11.y = u_xlat16_96 * u_xlat101;
    u_xlat11.xy = min(u_xlat11.xy, vec2(1.0, 1.0));
    u_xlat71 = u_xlat23.x * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23.x;
    u_xlat22.y = u_xlat11.y * u_xlat24;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat98 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat98 = max(u_xlat98, 6.10351563e-05);
    u_xlat11.x = u_xlat71 * 0.318309873;
    u_xlat98 = u_xlat71 / u_xlat98;
    u_xlat98 = u_xlat98 * u_xlat98;
    u_xlat98 = u_xlat11.x * u_xlat98;
    u_xlat98 = max(u_xlat98, 0.0);
    u_xlat98 = min(u_xlat98, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat24;
    u_xlat21.z = u_xlat104 * u_xlat23.x;
    u_xlat100 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat21.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat24;
    u_xlat16.z = u_xlat106 * u_xlat23.x;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat100 = u_xlat100 * u_xlat11.x + 6.10351563e-05;
    u_xlat100 = float(1.0) / u_xlat100;
    u_xlat11.x = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat11.x * u_xlat11.x;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_94 = u_xlat11.x * u_xlat16_93;
    u_xlat41 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_93) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xyz = vec3(u_xlat41) * vec3(u_xlat16_94) + u_xlat11.xzw;
    u_xlat16_27.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz + _shadowColor.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat98 = u_xlat98 * u_xlat100;
    u_xlat46.xyz = u_xlat11.xyz * vec3(u_xlat98);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat16_18.xyz * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat16.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat92 = u_xlat92 * u_xlat70.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat92);
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat16_27.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat46.xyz * u_xlat16_27.xyz + u_xlat11.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat46.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat46.xyz, u_xlat46.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_94 = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat46.xyz;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.zzz + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_93 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_18.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat92) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_28.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_93 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_93);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat10.xzw;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_27.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.yyy * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat92) + u_xlat16_17.xyz;
    u_xlat32.x = u_xlat32.x + -1.0;
    u_xlat32.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat32.xx + vec2(1.0, 1.0);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati98 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat32.xz = min(vec2(u_xlat16_63), u_xlat32.xz);
    u_xlat32.x = min(u_xlat32.x, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat32.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_28.xyz * u_xlat32.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlati32 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati32].xyz;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati98].xyz + u_xlat16_28.xyz;
    u_xlati32 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati32].xyz + u_xlat16_18.xyw;
    u_xlat16_28.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_28.xyz;
    u_xlat10.xyz = vec3(u_xlat99) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat32.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat10.xyz = u_xlat32.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb32 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb32)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat32.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat32.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_33.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_50.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_50.y = u_xlat0.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_50.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_63 = u_xlat16_33.x + 1.0;
    u_xlat16_63 = min(u_xlat16_63, 15.0);
    u_xlat16_93 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_63 * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_93 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_65 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat32.z * 0.5;
    u_xlat16_63 = (-u_xlat32.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_63 + u_xlat16_33.x;
    u_xlat16_63 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_93 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_93 + u_xlat16_63;
    u_xlat16_33.x = u_xlat32.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_63 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_63;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_94 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_3.xzw * vec3(u_xlat16_94);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_93 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_93 = u_xlat16_0.w * _albedoColor.w + u_xlat16_93;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_93 : u_xlat16_91;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_91 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
in mediump vec4 in_TEXCOORD1;
in mediump vec4 in_TEXCOORD2;
out highp vec4 vs_TEXCOORD0;
out mediump vec4 vs_TEXCOORD1;
out mediump vec4 vs_TEXCOORD2;
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
    vs_TEXCOORD5 = in_TEXCOORD1.z;
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
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _sunShift_special_01;
uniform 	mediump float _sunShift_special_02;
uniform 	mediump float _highlightColorMaskUse2U;
uniform 	mediump float _highlightSpecialAreaMaskUse2U;
uniform 	mediump float _HighLightWidthMultiply_1;
uniform 	mediump float _AnisotropicStrength_1;
uniform 	mediump float _HighLightWidthMultiply_2;
uniform 	mediump float _AnisotropicStrength_2;
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
UNITY_LOCATION(9) uniform mediump sampler2D _HighlightColorMask;
UNITY_LOCATION(10) uniform mediump sampler2D _HighlightSpecialAreaMask;
UNITY_LOCATION(11) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(12) uniform mediump sampler2D _shadowStrengthMap;
UNITY_LOCATION(13) uniform mediump sampler2D _Crystal_CustomColorMask;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec3 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
float u_xlat2;
mediump vec4 u_xlat16_2;
mediump vec4 u_xlat16_3;
mediump vec3 u_xlat16_4;
mediump vec3 u_xlat16_5;
mediump vec3 u_xlat16_6;
mediump vec3 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
vec4 u_xlat10;
mediump vec4 u_xlat16_10;
ivec3 u_xlati10;
vec4 u_xlat11;
mediump vec3 u_xlat16_12;
vec4 u_xlat13;
mediump vec4 u_xlat16_13;
bvec4 u_xlatb13;
vec3 u_xlat14;
mediump vec3 u_xlat16_15;
vec4 u_xlat16;
mediump vec3 u_xlat16_16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
vec4 u_xlat21;
vec4 u_xlat22;
vec4 u_xlat23;
float u_xlat24;
float u_xlat25;
float u_xlat26;
mediump vec3 u_xlat16_27;
mediump vec3 u_xlat16_28;
float u_xlat29;
mediump float u_xlat16_30;
vec3 u_xlat32;
int u_xlati32;
bool u_xlatb32;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_35;
float u_xlat41;
vec3 u_xlat46;
mediump vec3 u_xlat16_50;
mediump float u_xlat16_63;
mediump float u_xlat16_65;
vec2 u_xlat70;
mediump vec2 u_xlat16_70;
bool u_xlatb70;
float u_xlat71;
mediump float u_xlat16_91;
float u_xlat92;
bool u_xlatb92;
mediump float u_xlat16_93;
mediump float u_xlat16_94;
mediump float u_xlat16_95;
mediump float u_xlat16_96;
float u_xlat98;
mediump float u_xlat16_98;
int u_xlati98;
bool u_xlatb98;
float u_xlat99;
float u_xlat100;
float u_xlat101;
bool u_xlatb101;
float u_xlat104;
float u_xlat106;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat16_0 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_1.xyz = u_xlat16_0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_1.xyz = u_xlat16_0.xyz * u_xlat16_1.xyz;
    u_xlat16_2 = texture(_materialParamsMap, vs_TEXCOORD3.xy);
    u_xlat16_3.xyz = _albedoColor.xyz + vec3(-1.0, -1.0, -1.0);
    u_xlat16_3.xyz = u_xlat16_2.www * u_xlat16_3.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_4.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz;
    u_xlat16_91 = u_xlat16_0.w * _albedoColor.w;
    u_xlat16_5.xy = u_xlat16_2.xy * vec2(_roughnessMultiplier, _metallicMultiplier);
    u_xlat16_0.xyz = texture(_normalMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_0.xyz * vec3(2.0, 2.0, 2.0) + vec3(-1.0, -1.0, -1.0);
    u_xlat16_93 = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_7.xyz = (-vs_TEXCOORD1.yzx) * vec3(u_xlat16_93) + vs_TEXCOORD2.yzx;
    u_xlat0.x = dot(u_xlat16_7.xyz, u_xlat16_7.xyz);
    u_xlat0.x = max(u_xlat0.x, 1.17549435e-38);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_7.xyz;
    u_xlat8.xyz = u_xlat0.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat0.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat9.x = u_xlat0.z;
    u_xlat9.y = u_xlat8.x;
    u_xlat9.z = vs_TEXCOORD1.x;
    u_xlat9.x = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat10.x = u_xlat0.x;
    u_xlat10.y = u_xlat8.z;
    u_xlat10.z = vs_TEXCOORD1.y;
    u_xlat9.y = dot(u_xlat16_6.xyz, u_xlat10.xyz);
    u_xlat8.x = u_xlat0.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat9.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat2 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat2 = max(u_xlat2, 1.17549435e-38);
    u_xlat2 = inversesqrt(u_xlat2);
    u_xlat8.xyz = vec3(u_xlat2) * u_xlat9.xyz;
    u_xlat16_10.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_6.xyz = u_xlat16_10.xyz * _emissiveColor.xyz;
    u_xlat16_7.xyz = u_xlat16_6.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_7.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = texture(_shadowStrengthMap, vs_TEXCOORD3.xy).yzx;
    u_xlat16_93 = u_xlat16_10.z * _shadowStrength;
    u_xlat11.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_94 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat16_94 = inversesqrt(u_xlat16_94);
    u_xlat16_12.xyz = vec3(u_xlat16_94) * u_xlat11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb92 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat92 = (u_xlatb92) ? 1.0 : -1.0;
    u_xlat92 = u_xlat92 * vs_TEXCOORD2.w;
#ifdef UNITY_ADRENO_ES3
    u_xlatb98 = !!(0.5<_anisoUse2U);
#else
    u_xlatb98 = 0.5<_anisoUse2U;
#endif
    u_xlat70.xy = (bool(u_xlatb98)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat70.xy = u_xlat70.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_98 = texture(_anisotropicMap, u_xlat70.xy).x;
    u_xlat98 = u_xlat16_98 * 2.0 + -1.0;
    u_xlatb13 = lessThan(vec4(0.5, 0.5, 0.5, 0.5), vec4(_highlightSpecialAreaMaskUse2U, _highlightSpecialAreaMaskUse2U, _highlightColorMaskUse2U, _highlightColorMaskUse2U));
    u_xlat16_13.x = (u_xlatb13.x) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.y = (u_xlatb13.y) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_13.z = (u_xlatb13.z) ? vs_TEXCOORD3.z : vs_TEXCOORD3.x;
    u_xlat16_13.w = (u_xlatb13.w) ? vs_TEXCOORD3.w : vs_TEXCOORD3.y;
    u_xlat16_70.xy = texture(_HighlightSpecialAreaMask, u_xlat16_13.xy).xy;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat99 = u_xlat98 * _sunShift + u_xlat16_65;
    u_xlat99 = u_xlat99 + vs_TEXCOORD5;
    u_xlat101 = dot(u_xlat0.zxy, u_xlat8.xyz);
    u_xlat0.xyz = (-u_xlat8.yzx) * vec3(u_xlat101) + u_xlat0.xyz;
    u_xlat101 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat101 = inversesqrt(u_xlat101);
    u_xlat0.xyz = u_xlat0.xyz * vec3(u_xlat101);
    u_xlat14.xyz = u_xlat0.yzx * u_xlat8.xyz;
    u_xlat14.xyz = u_xlat8.zxy * u_xlat0.zxy + (-u_xlat14.xyz);
    u_xlat14.xyz = vec3(u_xlat92) * u_xlat14.xyz;
    u_xlat16_65 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_15.xyz = vec3(u_xlat16_65) * vs_TEXCOORD1.yzx;
    u_xlat16_65 = u_xlat16_70.x * _sunShift_special_01 + _sunShiftOffset2nd;
    u_xlat16_65 = u_xlat16_70.y * _sunShift_special_02 + u_xlat16_65;
    u_xlat92 = u_xlat98 * _sunShift2nd + u_xlat16_65;
    u_xlat92 = u_xlat92 + vs_TEXCOORD5;
    u_xlat16_16.xyz = texture(_HighlightColorMask, u_xlat16_13.zw).xyz;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_17.xyz;
    u_xlat16_18.xyz = u_xlat16_17.xyz * _directSpecularColor.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * _directSpecularColor2nd.xyz;
    u_xlat16_19.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + vs_TEXCOORD4.xyz;
    u_xlat16_19.xyz = vec3(vec3(_occlusionScale, _occlusionScale, _occlusionScale)) * u_xlat16_19.xyz + u_xlat8.xyz;
    u_xlat16_65 = dot(u_xlat16_19.xyz, u_xlat16_19.xyz);
    u_xlat16_65 = inversesqrt(u_xlat16_65);
    u_xlat16_19.xyz = vec3(u_xlat16_65) * u_xlat16_19.xyz;
    u_xlat16_65 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_50.z = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_65 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_65 = min(max(u_xlat16_65, 0.0), 1.0);
#else
    u_xlat16_65 = clamp(u_xlat16_65, 0.0, 1.0);
#endif
    u_xlat16_65 = u_xlat16_65 + -1.0;
    u_xlat16_65 = _occlusionScale * u_xlat16_65 + 1.0;
    u_xlat16_95 = (-u_xlat16_2.y) * _metallicMultiplier + 1.0;
    u_xlat16_4.xyz = u_xlat16_4.xyz * vec3(u_xlat16_95);
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_1.xyz = u_xlat16_5.yyy * u_xlat16_1.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_5.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0883883014);
    u_xlat16_33.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_63 = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_35.x = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_35.x = (-u_xlat16_63) + u_xlat16_35.x;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_35.x + u_xlat16_63;
    u_xlat16_63 = u_xlat16_50.z * u_xlat16_63;
    u_xlat16_63 = u_xlat16_65 * u_xlat16_63;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_ShadowBias.z!=0.0);
#else
    u_xlatb32 = _ShadowBias.z!=0.0;
#endif
    u_xlat16.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat98 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat16.xyz = vec3(u_xlat98) * u_xlat16.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat16.xyz);
    u_xlat98 = (-u_xlat98) * u_xlat98 + 1.0;
    u_xlat98 = sqrt(u_xlat98);
    u_xlat98 = u_xlat98 * _ShadowBias.z;
    u_xlat16.xyz = (-u_xlat8.xyz) * vec3(u_xlat98) + vs_TEXCOORD0.xyz;
    u_xlat16.xyz = (bool(u_xlatb32)) ? u_xlat16.xyz : vs_TEXCOORD0.xyz;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[1] * hlslcc_mtx4x4customShadowViewM[0].yyyy;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[0] * hlslcc_mtx4x4customShadowViewM[0].xxxx + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[2] * hlslcc_mtx4x4customShadowViewM[0].zzzz + u_xlat13;
    u_xlat13 = hlslcc_mtx4x4customShadowProjM[3] * hlslcc_mtx4x4customShadowViewM[0].wwww + u_xlat13;
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
    u_xlat21 = u_xlat16.yyyy * u_xlat21;
    u_xlat13 = u_xlat13 * u_xlat16.xxxx + u_xlat21;
    u_xlat13 = u_xlat22 * u_xlat16.zzzz + u_xlat13;
    u_xlat13 = u_xlat23 + u_xlat13;
    u_xlat32.x = _ShadowBias.x / u_xlat13.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat32.x = min(max(u_xlat32.x, 0.0), 1.0);
#else
    u_xlat32.x = clamp(u_xlat32.x, 0.0, 1.0);
#endif
    u_xlat32.x = (-u_xlat32.x) + u_xlat13.z;
    u_xlat98 = max((-u_xlat13.w), u_xlat32.x);
    u_xlat98 = (-u_xlat32.x) + u_xlat98;
    u_xlat13.z = _ShadowBias.y * u_xlat98 + u_xlat32.x;
    u_xlat16.xyz = u_xlat13.xyz / u_xlat13.www;
    u_xlat13.xyz = u_xlat16.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat13.w = max(u_xlat13.z, 9.99999975e-05);
    u_xlat16_35.x = (-_ShadowBias.w) + 1.0;
    u_xlat16.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat16.z = 0.0;
    u_xlat16.xyz = u_xlat13.xyw + u_xlat16.xyz;
    vec3 txVec0 = vec3(u_xlat16.xy,u_xlat16.z);
    u_xlat16.x = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec0, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, -0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec1 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.y = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec1, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec2 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.z = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec2, 0.0);
    u_xlat21.xy = _ShadowMapTexture_TexelSize.xy * vec2(0.5, 0.5);
    u_xlat21.z = 0.0;
    u_xlat21.xyz = u_xlat13.xyw + u_xlat21.xyz;
    vec3 txVec3 = vec3(u_xlat21.xy,u_xlat21.z);
    u_xlat16.w = textureLod(hlslcc_zcmp_ShadowMapTexture, txVec3, 0.0);
    u_xlat32.x = dot(u_xlat16, vec4(0.25, 0.25, 0.25, 0.25));
    u_xlat98 = (-u_xlat16_35.x) + 1.0;
    u_xlat32.x = u_xlat32.x * u_xlat98 + u_xlat16_35.x;
    u_xlat32.x = (-u_xlat32.x) + 1.0;
    u_xlat32.x = (-u_xlat32.x) * u_xlat16_93 + 1.0;
    u_xlat32.x = max(u_xlat32.x, 0.0);
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat16_94) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat98 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat98 = inversesqrt(u_xlat98);
    u_xlat11.xyz = vec3(u_xlat98) * u_xlat11.xyz;
    u_xlat98 = dot(u_xlat8.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat98 = min(max(u_xlat98, 0.0), 1.0);
#else
    u_xlat98 = clamp(u_xlat98, 0.0, 1.0);
#endif
    u_xlat16_93 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat11.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    u_xlat16.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16.x = min(max(u_xlat16.x, 0.0), 1.0);
#else
    u_xlat16.x = clamp(u_xlat16.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat8.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat21.x = min(max(u_xlat21.x, 0.0), 1.0);
#else
    u_xlat21.x = clamp(u_xlat21.x, 0.0, 1.0);
#endif
    u_xlat22.xyz = vec3(u_xlat99) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat70.x = inversesqrt(u_xlat70.x);
    u_xlat22.xyz = u_xlat70.xxx * u_xlat22.xyz;
    u_xlat70.x = (-u_xlat16_3.x) + 1.0;
    u_xlat100 = abs(_AnisotropicStrength_1) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb101 = !!(_AnisotropicStrength_1<0.0);
#else
    u_xlatb101 = _AnisotropicStrength_1<0.0;
#endif
    u_xlat29 = (u_xlatb101) ? u_xlat100 : u_xlat16_3.x;
    u_xlat24 = (u_xlatb101) ? u_xlat16_3.x : u_xlat100;
    u_xlat23.x = u_xlat29;
    u_xlat16_94 = dot(u_xlat0.zxy, u_xlat11.xyz);
    u_xlat100 = dot(u_xlat0.zxy, u_xlat16_12.xyz);
    u_xlat16_35.x = dot(u_xlat0.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat101 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat104 = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat106 = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat8.xyz + u_xlat14.zxy;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = inversesqrt(u_xlat92);
    u_xlat22.xyz = vec3(u_xlat92) * u_xlat22.xyz;
    u_xlat92 = abs(_AnisotropicStrength_2) * u_xlat70.x + u_xlat16_3.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(_AnisotropicStrength_2<0.0);
#else
    u_xlatb70 = _AnisotropicStrength_2<0.0;
#endif
    u_xlat29 = (u_xlatb70) ? u_xlat92 : u_xlat16_3.x;
    u_xlat26 = (u_xlatb70) ? u_xlat16_3.x : u_xlat92;
    u_xlat25 = u_xlat29;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat11.xyz);
    u_xlat70.x = dot(u_xlat22.xyz, u_xlat16_12.xyz);
    u_xlat11.x = dot(u_xlat22.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_95 = max((-_AnisotropicStrength_2), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_2, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_2) + 1.0;
    u_xlat41 = u_xlat16_94 * u_xlat16_95;
    u_xlat41 = min(u_xlat41, 1.0);
    u_xlat92 = u_xlat92 * u_xlat16_96;
    u_xlat92 = min(u_xlat92, 1.0);
    u_xlat71 = u_xlat25 * u_xlat26;
    u_xlat22.x = u_xlat41 * u_xlat25;
    u_xlat22.y = u_xlat92 * u_xlat26;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat92 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat92 = max(u_xlat92, 6.10351563e-05);
    u_xlat41 = u_xlat71 * 0.318309873;
    u_xlat92 = u_xlat71 / u_xlat92;
    u_xlat92 = u_xlat92 * u_xlat92;
    u_xlat92 = u_xlat41 * u_xlat92;
    u_xlat92 = max(u_xlat92, 0.0);
    u_xlat92 = min(u_xlat92, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat26;
    u_xlat21.z = u_xlat70.x * u_xlat25;
    u_xlat70.x = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat70.x = sqrt(u_xlat70.x);
    u_xlat70.x = u_xlat70.x + u_xlat21.x;
    u_xlat70.x = u_xlat70.x + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat26;
    u_xlat16.z = u_xlat11.x * u_xlat25;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = u_xlat70.x * u_xlat11.x + 6.10351563e-05;
    u_xlat70.x = float(1.0) / u_xlat70.x;
    u_xlat16_95 = max((-_AnisotropicStrength_1), 0.0);
    u_xlat16_95 = u_xlat16_95 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat16_96 = max(_AnisotropicStrength_1, 0.0);
    u_xlat16_96 = u_xlat16_96 * (-_HighLightWidthMultiply_1) + 1.0;
    u_xlat11.x = u_xlat16_94 * u_xlat16_95;
    u_xlat11.y = u_xlat16_96 * u_xlat101;
    u_xlat11.xy = min(u_xlat11.xy, vec2(1.0, 1.0));
    u_xlat71 = u_xlat23.x * u_xlat24;
    u_xlat22.x = u_xlat11.x * u_xlat23.x;
    u_xlat22.y = u_xlat11.y * u_xlat24;
    u_xlat22.z = u_xlat98 * u_xlat71;
    u_xlat98 = dot(u_xlat22.xyz, u_xlat22.xyz);
    u_xlat98 = max(u_xlat98, 6.10351563e-05);
    u_xlat11.x = u_xlat71 * 0.318309873;
    u_xlat98 = u_xlat71 / u_xlat98;
    u_xlat98 = u_xlat98 * u_xlat98;
    u_xlat98 = u_xlat11.x * u_xlat98;
    u_xlat98 = max(u_xlat98, 0.0);
    u_xlat98 = min(u_xlat98, 16.0);
    u_xlat21.y = u_xlat100 * u_xlat24;
    u_xlat21.z = u_xlat104 * u_xlat23.x;
    u_xlat100 = dot(u_xlat21.xyz, u_xlat21.xyz);
    u_xlat100 = sqrt(u_xlat100);
    u_xlat100 = u_xlat100 + u_xlat21.x;
    u_xlat100 = u_xlat100 + 6.10351563e-05;
    u_xlat16.y = u_xlat16_35.x * u_xlat24;
    u_xlat16.z = u_xlat106 * u_xlat23.x;
    u_xlat11.x = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat11.x = sqrt(u_xlat11.x);
    u_xlat11.x = u_xlat11.x + u_xlat16.x;
    u_xlat11.x = u_xlat11.x + 6.10351563e-05;
    u_xlat100 = u_xlat100 * u_xlat11.x + 6.10351563e-05;
    u_xlat100 = float(1.0) / u_xlat100;
    u_xlat11.x = (-u_xlat16_93) + 1.0;
    u_xlat16_93 = u_xlat11.x * u_xlat11.x;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_93 = u_xlat11.x * u_xlat16_93;
    u_xlat16_94 = u_xlat11.x * u_xlat16_93;
    u_xlat41 = u_xlat16_1.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat41 = min(max(u_xlat41, 0.0), 1.0);
#else
    u_xlat41 = clamp(u_xlat41, 0.0, 1.0);
#endif
    u_xlat11.x = (-u_xlat16_93) * u_xlat11.x + 1.0;
    u_xlat11.xzw = u_xlat16_1.xyz * u_xlat11.xxx;
    u_xlat11.xyz = vec3(u_xlat41) * vec3(u_xlat16_94) + u_xlat11.xzw;
    u_xlat16_27.xyz = (-_shadowColor.xyz) + vec3(1.0, 1.0, 1.0);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz + _shadowColor.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_28.xyz = u_xlat16_27.xyz * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat16_28.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat98 = u_xlat98 * u_xlat100;
    u_xlat46.xyz = u_xlat11.xyz * vec3(u_xlat98);
#ifdef UNITY_ADRENO_ES3
    u_xlat46.xyz = min(max(u_xlat46.xyz, 0.0), 1.0);
#else
    u_xlat46.xyz = clamp(u_xlat46.xyz, 0.0, 1.0);
#endif
    u_xlat46.xyz = u_xlat16_18.xyz * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat16.xxx * u_xlat46.xyz;
    u_xlat46.xyz = u_xlat46.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat92 = u_xlat92 * u_xlat70.x;
    u_xlat11.xyz = u_xlat11.xyz * vec3(u_xlat92);
    u_xlat11.xyz = u_xlat16_17.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat16.xxx * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat11.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat11.xyz = u_xlat16_27.xyz * u_xlat11.xyz;
    u_xlat11.xyz = u_xlat46.xyz * u_xlat16_27.xyz + u_xlat11.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat46.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_33.z = dot(u_xlat46.xyz, u_xlat46.xyz);
    u_xlat16_33.xz = max(u_xlat16_33.xz, vec2(0.0078125, 6.10351563e-05));
    u_xlat16_94 = inversesqrt(u_xlat16_33.z);
    u_xlat16_17.xyz = vec3(u_xlat16_94) * u_xlat46.xyz;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_18.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_35.zzz + u_xlat16_18.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_33.z);
    u_xlat16_93 = u_xlat16_33.z * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_18.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat10.xy = u_xlat16_10.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat10.xy = min(max(u_xlat10.xy, 0.0), 1.0);
#else
    u_xlat10.xy = clamp(u_xlat10.xy, 0.0, 1.0);
#endif
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_17.xyz = u_xlat16_4.xyz * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_17.xyz = u_xlat10.xxx * u_xlat16_17.xyz;
    u_xlat16_17.xyz = vec3(u_xlat92) * u_xlat16_17.xyz;
    u_xlat16_17.xyz = u_xlat16_28.xyz * u_xlat16.xxx + u_xlat16_17.xyz;
    u_xlat16_93 = _AdditionalLightIntensityAndAngleScale[1].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.00100000005>=abs(u_xlat16_93));
#else
    u_xlatb92 = 0.00100000005>=abs(u_xlat16_93);
#endif
    u_xlat10.xzw = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[1].xyz;
    u_xlat16_93 = dot(u_xlat10.xzw, u_xlat10.xzw);
    u_xlat16_93 = max(u_xlat16_93, 6.10351563e-05);
    u_xlat16_94 = inversesqrt(u_xlat16_93);
    u_xlat16_18.xyz = vec3(u_xlat16_94) * u_xlat10.xzw;
    u_xlat16_35.xz = (bool(u_xlatb92)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_27.xyz = u_xlat16_35.xxx * _AdditionalLightDirectionAndAngleOffset[1].xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_35.zzz + u_xlat16_27.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb92 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[1].w);
#else
    u_xlatb92 = 0.0>=_AdditionalLightIntensityAndAngleScale[1].w;
#endif
    u_xlat16_94 = (u_xlatb92) ? 1.0 : 0.0;
    u_xlat16_95 = dot(_AdditionalLightDirectionAndAngleOffset[1].xyz, u_xlat16_18.xyz);
    u_xlat16_95 = u_xlat16_95 * _AdditionalLightIntensityAndAngleScale[1].w + _AdditionalLightDirectionAndAngleOffset[1].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_95 = min(max(u_xlat16_95, 0.0), 1.0);
#else
    u_xlat16_95 = clamp(u_xlat16_95, 0.0, 1.0);
#endif
    u_xlat16_95 = u_xlat16_95 * u_xlat16_95;
    u_xlat16_94 = max(u_xlat16_94, u_xlat16_95);
    u_xlat16_95 = float(1.0) / float(u_xlat16_93);
    u_xlat16_93 = u_xlat16_93 * _AdditionalLightPositionAndFalloff[1].w;
    u_xlat16_93 = (-u_xlat16_93) * u_xlat16_93 + 1.0;
    u_xlat16_93 = max(u_xlat16_93, 0.0);
    u_xlat16_93 = u_xlat16_93 * u_xlat16_93;
    u_xlat16_93 = u_xlat16_93 * u_xlat16_95;
    u_xlat16_93 = max(u_xlat16_35.x, u_xlat16_93);
    u_xlat16_93 = u_xlat16_94 * u_xlat16_93;
    u_xlat16_27.xyz = vec3(u_xlat16_93) * _AdditionalLightIntensityAndAngleScale[1].xyz;
    u_xlat92 = dot(u_xlat16_12.xyz, u_xlat16_18.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat92 = min(max(u_xlat92, 0.0), 1.0);
#else
    u_xlat92 = clamp(u_xlat92, 0.0, 1.0);
#endif
    u_xlat16_18.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat10.yyy * u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_18.xyz * vec3(u_xlat92) + u_xlat16_17.xyz;
    u_xlat32.x = u_xlat32.x + -1.0;
    u_xlat32.xz = vec2(_diffuseShadowStrength, _cubemapShadowStrength) * u_xlat32.xx + vec2(1.0, 1.0);
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_19.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_19.xz);
    u_xlat16_18.y = u_xlat16_19.y;
    u_xlati10.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlati98 = int(uint(uint(u_xlati10.x) & 1u));
    u_xlat32.xz = min(vec2(u_xlat16_63), u_xlat32.xz);
    u_xlat32.x = min(u_xlat32.x, u_xlat16_2.z);
    u_xlat16_27.xyz = u_xlat16_4.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat32.xxx * u_xlat16_27.xyz;
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_28.xyz = u_xlat32.xxx * u_xlat16_28.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * u_xlat32.xxx + (-u_xlat16_28.xyz);
    u_xlat16_28.xyz = u_xlat16_4.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_27.xyz = u_xlat16_28.xyz * u_xlat32.xxx + u_xlat16_27.xyz;
    u_xlat16_27.xyz = u_xlat16_27.xyz * _localDiffuseGI.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlat16_18.xyz = vec3(u_xlat16_65) * u_xlat16_18.xyz;
    u_xlati32 = int(int_bitfieldInsert(2,u_xlati10.y,0,1) );
    u_xlat16_28.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati32].xyz;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati98].xyz + u_xlat16_28.xyz;
    u_xlati32 = (u_xlati10.z != 0) ? 5 : 4;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati32].xyz + u_xlat16_18.xyw;
    u_xlat16_28.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_28.xyz;
    u_xlat10.xyz = vec3(u_xlat99) * u_xlat16_15.xyz + u_xlat14.xyz;
    u_xlat32.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat10.xyz = u_xlat32.xxx * u_xlat10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb32 = !!(_AnisotropicStrength_1>=0.0);
#else
    u_xlatb32 = _AnisotropicStrength_1>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb32)) ? u_xlat10.xyz : u_xlat0.xyz;
    u_xlat10.xyz = u_xlat16_12.xyz * u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.zxy * u_xlat16_12.yzx + (-u_xlat10.xyz);
    u_xlat14.xyz = u_xlat0.xyz * u_xlat10.xyz;
    u_xlat0.xyz = u_xlat10.zxy * u_xlat0.yzx + (-u_xlat14.xyz);
    u_xlat16_3.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = min(u_xlat16_3.x, 1.0);
    u_xlat16_3.x = u_xlat16_3.x * abs(_AnisotropicStrength_1);
    u_xlat0.xyz = (-u_xlat9.xyz) * vec3(u_xlat2) + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat16_3.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat32.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat32.x = inversesqrt(u_xlat32.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat32.xxx;
    u_xlat16_3.x = dot((-u_xlat16_12.xyz), u_xlat0.xyz);
    u_xlat16_3.x = u_xlat16_3.x + u_xlat16_3.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_3.xxx + (-u_xlat16_12.xyz);
    u_xlat9.xyz = u_xlat9.xyz * vec3(u_xlat2) + (-u_xlat0.xyz);
    u_xlat9.xyz = u_xlat16_33.xxx * u_xlat9.xyz + u_xlat0.xyz;
    u_xlat10.xyz = u_xlat0.xyz + (-u_xlat9.xyz);
    u_xlat9.xyz = abs(vec3(vec3(_AnisotropicStrength_1, _AnisotropicStrength_1, _AnisotropicStrength_1))) * u_xlat10.xyz + u_xlat9.xyz;
    u_xlat16_3.x = -abs(_AnisotropicStrength_1) * 0.800000012 + 1.0;
    u_xlat16_3.x = u_xlat16_5.x * u_xlat16_3.x;
    u_xlat16_3.x = u_xlat16_3.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_3.x);
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat0.xyz);
    u_xlat16_50.x = u_xlat16_5.x * 1.09769487;
    u_xlat16_50.y = u_xlat0.x * 0.5;
    u_xlat16_33.xyz = u_xlat16_50.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_33.xyz = min(max(u_xlat16_33.xyz, 0.0), 1.0);
#else
    u_xlat16_33.xyz = clamp(u_xlat16_33.xyz, 0.0, 1.0);
#endif
    u_xlat16_10.yzw = u_xlat16_33.xyz * vec3(15.0, 15.0, 15.0);
    u_xlat16_33.x = floor(u_xlat16_10.w);
    u_xlat16_63 = u_xlat16_33.x + 1.0;
    u_xlat16_63 = min(u_xlat16_63, 15.0);
    u_xlat16_93 = u_xlat16_33.z * 15.0 + (-u_xlat16_33.x);
    u_xlat16_10.x = u_xlat16_33.x * 16.0 + u_xlat16_10.y;
    u_xlat16_12.x = u_xlat16_63 * 16.0 + u_xlat16_10.y;
    u_xlat16_33.xy = u_xlat16_10.xz + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_12.y = u_xlat16_10.z;
    u_xlat16_33.xy = u_xlat16_12.xy + vec2(0.5, 0.5);
    u_xlat16_33.xy = u_xlat16_33.xy * vec2(0.00390625, 0.0625);
    u_xlat16_30 = texture(_SpecularOcclusionLut3D, u_xlat16_33.xy).x;
    u_xlat16_33.x = (-u_xlat16_0.x) + u_xlat16_30;
    u_xlat16_33.x = u_xlat16_93 * u_xlat16_33.x + u_xlat16_0.x;
    u_xlat16_33.x = u_xlat16_65 * u_xlat16_33.x;
    u_xlat0.x = dot(u_xlat16_19.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.x = min(max(u_xlat0.x, 0.0), 1.0);
#else
    u_xlat0.x = clamp(u_xlat0.x, 0.0, 1.0);
#endif
    u_xlat0.x = u_xlat0.x * u_xlat16_33.x;
    u_xlat16_33.x = u_xlat32.z * 0.5;
    u_xlat16_63 = (-u_xlat32.z) * 0.5 + 1.0;
    u_xlat16_33.x = u_xlat0.x * u_xlat16_63 + u_xlat16_33.x;
    u_xlat16_63 = u_xlat16_33.x + u_xlat16_33.x;
    u_xlat16_93 = (-u_xlat16_33.x) * 2.0 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_93 + u_xlat16_63;
    u_xlat16_33.x = u_xlat32.z * u_xlat16_33.x;
    u_xlat16_33.x = min(u_xlat16_2.z, u_xlat16_33.x);
    u_xlat16_63 = dot(_IndirectCubemapRotationParams.xy, u_xlat9.xz);
    u_xlat9.z = dot(_IndirectCubemapRotationParams.zw, u_xlat9.xz);
    u_xlat9.x = u_xlat16_63;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat9.xyz, u_xlat16_3.x);
    u_xlat16_3.xzw = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat0.xyz = u_xlat16_3.xzw * vec3(6.0, 6.0, 6.0);
    u_xlat16_3.xzw = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_3.xzw = u_xlat16_3.xzw * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_94 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_35.xyz = u_xlat16_3.xzw * vec3(u_xlat16_94);
    u_xlat16_3.xzw = (bool(u_xlatb0)) ? u_xlat16_35.xyz : u_xlat16_3.xzw;
    u_xlat21.y = u_xlat16_5.x;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat21.xy).xy;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_1.xyz = u_xlat16_3.xzw * u_xlat16_1.xyz;
    u_xlat16_1.xyz = u_xlat16_33.xxx * u_xlat16_1.xyz;
    u_xlat16_3.xyz = _indirectSpecularIntensityScale.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_3.xyz = min(max(u_xlat16_3.xyz, 0.0), 1.0);
#else
    u_xlat16_3.xyz = clamp(u_xlat16_3.xyz, 0.0, 1.0);
#endif
    u_xlat16_5.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat11.xyz;
    u_xlat16_93 = dot(u_xlat16_5.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    u_xlat16_93 = u_xlat16_0.w * _albedoColor.w + u_xlat16_93;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_93 = min(max(u_xlat16_93, 0.0), 1.0);
#else
    u_xlat16_93 = clamp(u_xlat16_93, 0.0, 1.0);
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_93 : u_xlat16_91;
    u_xlat16_5.xyz = u_xlat11.xyz + u_xlat16_17.xyz;
    u_xlat16_4.xyz = u_xlat16_4.xyz * u_xlat16_27.xyz + u_xlat16_5.xyz;
    u_xlat16_1.xyz = u_xlat16_1.xyz * u_xlat16_3.xyz + u_xlat16_4.xyz;
    u_xlat16_1.xyz = u_xlat16_6.xyz * u_xlat16_7.xyz + u_xlat16_1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_Crystal_UseCustomColor);
#else
    u_xlatb0 = 0.5<_Crystal_UseCustomColor;
#endif
    if(u_xlatb0){
        u_xlat16_0.xyz = texture(_Crystal_CustomColorMask, vs_TEXCOORD3.xy).xyz;
        u_xlat16_91 = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
        u_xlat16_3.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_R_Color.xyz + (-u_xlat16_1.xyz);
        u_xlat16_3.xyz = u_xlat16_0.xxx * u_xlat16_3.xyz + u_xlat16_1.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_G_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_3.xyz = u_xlat16_0.yyy * u_xlat16_4.xyz + u_xlat16_3.xyz;
        u_xlat16_4.xyz = vec3(u_xlat16_91) * _Crystal_CustomColor_B_Color.xyz + (-u_xlat16_3.xyz);
        u_xlat16_1.xyz = u_xlat16_0.zzz * u_xlat16_4.xyz + u_xlat16_3.xyz;
    }
    u_xlat16_3.xyz = (-u_xlat16_1.xyz) + _FogCol.xyz;
    SV_Target0.xyz = vs_TEXCOORD0.www * u_xlat16_3.xyz + u_xlat16_1.xyz;
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
  GpuProgramID 128509
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
CustomEditor "CodeGenShaderGUI.Theseus_PBR_Hair_WidthControlGUI"
}