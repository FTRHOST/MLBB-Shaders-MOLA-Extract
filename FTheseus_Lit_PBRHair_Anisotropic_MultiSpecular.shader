//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "FTheseus/Lit/PBR(Hair_Anisotropic_MultiSpecular)" {
Properties {

[Tex] _albedoMap ("albedoMap", 2D) = "white" { }

_albedoColor ("albedoColor", Color) = (1,1,1,1)

_metallicMultiplier ("metallicMultiplier", Range(0, 1)) = 1.0

_roughnessMultiplier ("roughnessMultiplier", Range(0, 1)) = 1.0

[Tex] _emissiveMap ("emissiveMap", 2D) = "white" { }

_emissiveColor ("emissiveColor", Color) = (0,0,0,1)

[Tex] _normalMap ("normalMap", 2D) = "bump" { }

_indirectSpecularIntensityScale ("indirectSpecularIntensityScale", Vector) = (1,1,1,1)

_localDiffuseGI ("localDiffuseGI", Vector) = (1,1,1,1)

_occlusionScale ("occlusionScale", Range(0, 1)) = 1.0

_shadowStrength ("shadowStrength", Range(0, 3)) = 1.0

_shadowColor ("shadow Color", Color) = (0,0,0,0)

_specularAlphaMode ("specular alpha mode", Float) = 1.0

_directSpecularColor ("direct specular color", Color) = (1,1,1,1)

_renderingMode ("render mode", Float) = 0.0

_cutoff ("cut off", Range(0, 1)) = 0.0

[Toggle] _anisoUse2U ("anisoUse2U", Float) = 0.0

_anisotropicMap ("anisotropicMap", 2D) = "white" { }

_sunShift ("sunShift", Float) = 1.0

_sunShiftOffset ("sunShiftOffset", Float) = 1.0

_anisotropicMultiplier ("anisotropicMultiplier", Range(0, 1)) = 1.0

_anisotropicMultiplier2nd ("anisotropicMultiplier2nd", Range(0, 1)) = 1.0

_directSpecularColor2nd ("direct specular color1nd", Color) = (1,1,1,1)

_sunShift2nd ("sunShift2nd", Float) = 1.0

_sunShiftOffset2nd ("sunShiftOffset2nd", Float) = 1.0

_SpecularOcclusionLut3D ("SpecularOcclusionLut3D", 2D) = "black" { }

_DfgTexture ("DfgTexture", 2D) = "black" { }

[Toggle] _UseFlowLight2U ("使用2U", Float) = 0.0

_FlowLightMask ("流光遮罩(RGB色)", 2D) = "white" { }

_FlowLightTex ("流光纹理", 2D) = "white" { }

_FlowLightColor ("流光颜色", Color) = (1,1,1,1)

_FlowLightFactory ("流光参数", Vector) = (1,0,0,0)

[Header(Glittering)] _GlitteryControl ("X:uv1Tiling Y:uv2Tiling Z:闪点对比度 W颜色强度 ", Vector) = (0.342,4.3,7.31,7.04)

_GlitterMap ("闪点贴图颜色,闪点遮罩区域A", 2D) = "white" { }

_GlitterySPColor ("闪点颜色", Color) = (0,0,0,1)

[Toggle] _LGMaskedGlitter ("仅在流光区域显示闪点", Float) = 0.0

_Glitter_Offset ("闪点相对流光偏移率", Range(0, 1)) = 0.0

_GlitteryFresnelMaskPower ("Fresnel遮罩强度", Range(0, 4)) = 2.0

[Header(SanShe)] [Toggle(_DIRECTIONAL_SANSHE)] _DirectionalSanshe ("补光类型(关闭:边缘光;打开:平行光)  自发光alpha通道为遮罩图", Float) = 0.0

[Toggle] _EnableVISInfluence ("开启visibility影响", Float) = 0.0

_Sanshe_color ("补光颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe_Fw ("补光范围", Range(0, 10)) = 1.0

_Sanshe_Power ("补光强度", Float) = 0.0

_Sanshe_X ("补光X轴偏移", Range(-1, 1)) = 0.0

_Sanshe_Y ("补光Y轴偏移", Range(-1, 1)) = 0.0

[Toggle] _isGradient ("渐变补光", Float) = 0.0

_Sanshe_color_low ("渐变补光颜色(补光最低点以下颜色）", Color) = (0.5,0.5,0.5,1)

_Sanshe_GradientCenter ("渐变补光中心点高度偏移(相对模型中心)", Float) = 0.0

_Sanshe_GradientRange ("渐变补光范围", Float) = 0.0

[Space(8)] [Toggle(_SANSHE2)] _SanShe2 ("补光2开关", Float) = 0.0

_Sanshe2_color ("补光2颜色", Color) = (0.5,0.5,0.5,1)

_Sanshe2_Fw ("补光2范围", Range(0, 10)) = 1.0

_Sanshe2_Power ("补光2强度", Float) = 0.0

_Sanshe2_X ("补光2X轴偏移", Range(-1, 1)) = 0.0

_Sanshe2_Y ("补光2Y轴偏移", Range(-1, 1)) = 0.0

[Toggle] _isGradient2 ("渐变补光", Float) = 0.0

_Sanshe2_color_low ("渐变补光颜色(补光最低点以下颜色）", Color) = (0.5,0.5,0.5,1)

_Sanshe2_GradientCenter ("渐变补光中心点高度偏移(相对模型中心)", Float) = 0.0

_Sanshe2_GradientRange ("渐变补光范围", Float) = 0.0

_blend ("__blend", Float) = 0.0

_cull ("__cull", Float) = 2.0

_srcblend ("__src", Float) = 1.0

_dstblend ("__dst", Float) = 0.0

_srcblendalpha ("__srcA", Float) = 1.0

_dstblendalpha ("__dstA", Float) = 0.0

_zwrite ("__zw", Float) = 1.0

_alphatomask ("__alphaToMask", Float) = 0.0

}
SubShader {
 Tags { "RenderType" = "Opaque" }
 Pass {
 Name "PBR"
  Tags { "LIGHTMODE" = "FORWARDBASE" "RenderType" = "Opaque" "SHADOWSUPPORT" = "true" }
 ZWrite Off
 Cull Off
  GpuProgramID 31910
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	vec4 _GlitteryControl;
uniform 	mediump vec3 _GlitterySPColor;
uniform 	int _LGMaskedGlitter;
uniform 	mediump float _Glitter_Offset;
uniform 	mediump float _GlitteryFresnelMaskPower;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
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
UNITY_LOCATION(4) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec3 u_xlati9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
int u_xlati22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_41;
float u_xlat44;
bool u_xlatb44;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat52;
float u_xlat66;
bool u_xlatb66;
mediump float u_xlat16_68;
float u_xlat70;
mediump float u_xlat16_70;
int u_xlati70;
bool u_xlatb70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_23.x * u_xlat16_45.x;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_23.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.y = u_xlat0.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.xy = u_xlat0.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb44 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat44 = (u_xlatb44) ? 1.0 : -1.0;
    u_xlat44 = u_xlat44 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat66 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat16_7.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_3.xy = u_xlat16_7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_3.z = max(u_xlat16_1.x, 1.00000002e-16);
    u_xlat4.x = u_xlat5.z;
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat66 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat6.xyz = vec3(u_xlat66) * u_xlat4.xyz;
    u_xlat70 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat70) + u_xlat5.xyz;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat5.xyz = vec3(u_xlat70) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat44) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.yyy * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat8.xyz = u_xlat22.xxx * u_xlat8.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat10.xyz = u_xlat9.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat10.xyz = u_xlat22.xxx * u_xlat10.xyz;
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat16_68 = _anisotropicMultiplier2nd + _anisotropicMultiplier2nd;
    u_xlat16_3.x = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat44 = u_xlat16_68 * u_xlat16_3.x;
    u_xlat44 = max(u_xlat44, 0.00100000005);
    u_xlat11.y = u_xlat22.x * u_xlat44;
    u_xlat16_68 = dot(u_xlat5.zxy, u_xlat10.xyz);
    u_xlat16_25.x = _anisotropicMultiplier2nd * 2.0 + -1.0;
    u_xlat22.x = (-u_xlat16_25.x) + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat16_3.x;
    u_xlat22.x = max(u_xlat22.x, 0.00100000005);
    u_xlat11.x = u_xlat16_68 * u_xlat22.x;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat22.x * u_xlat44;
    u_xlat11.z = u_xlat70 * u_xlat71;
    u_xlat72 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat71 / u_xlat72;
    u_xlat71 = u_xlat71 * 0.318309873;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.z = u_xlat22.x * u_xlat72;
    u_xlat16_25.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.y = u_xlat44 * u_xlat16_25.x;
    u_xlat11.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + u_xlat11.x;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat73 = dot(u_xlat8.xyz, u_xlat16_12.xyz);
    u_xlat8.z = u_xlat22.x * u_xlat73;
    u_xlat22.x = dot(u_xlat5.zxy, u_xlat16_12.xyz);
    u_xlat8.y = u_xlat22.x * u_xlat44;
    u_xlat44 = dot(u_xlat6.xyz, u_xlat16_12.xyz);
    u_xlat8.x = u_xlat44;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = max(u_xlat44, 0.00100000005);
    u_xlat44 = log2(u_xlat44);
    u_xlat73 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat8.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat72 = u_xlat73 * u_xlat72 + 6.10351563e-05;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat72 * u_xlat72;
    u_xlat16_1.x = u_xlat72 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat72 * u_xlat16_1.x;
    u_xlat16_47 = u_xlat72 * u_xlat16_1.x;
    u_xlat72 = (-u_xlat16_1.x) * u_xlat72 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _albedoColor.xyz;
    u_xlat16_15.xyz = vec3(_metallicMultiplier) * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat72) * u_xlat16_15.xyz;
    u_xlat72 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat72) * vec3(u_xlat16_47) + u_xlat13.xyz;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat13.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor2nd.xyz;
    u_xlat16.xyz = u_xlat11.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat17.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat71 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat17.xyz = vec3(u_xlat71) * u_xlat17.xyz;
    u_xlat71 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat73 = (-u_xlat16_1.x) + 1.0;
    u_xlat73 = u_xlat16_3.x * u_xlat73;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat11.z = u_xlat71 * u_xlat73;
    u_xlat16_47 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat71 = u_xlat16_47 * u_xlat16_3.x;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat11.y = u_xlat16_25.x * u_xlat71;
    u_xlat74 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat11.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat75 = dot(u_xlat17.xyz, u_xlat16_12.xyz);
    u_xlat8.z = u_xlat73 * u_xlat75;
    u_xlat8.y = u_xlat22.x * u_xlat71;
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat8.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat52 = u_xlat22.x * u_xlat74 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat74 = dot(u_xlat17.xyz, u_xlat10.xyz);
    u_xlat10.y = u_xlat71 * u_xlat74;
    u_xlat10.x = u_xlat16_68 * u_xlat73;
    u_xlat74 = u_xlat73 * u_xlat71;
    u_xlat10.z = u_xlat70 * u_xlat74;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat74 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat75 = u_xlat74 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat75;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat70 = u_xlat52 * u_xlat70;
    u_xlat10.xyz = u_xlat13.xyz * vec3(u_xlat70);
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat11.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat70) * u_xlat9.xyz;
    u_xlat70 = dot(u_xlat17.xyz, u_xlat9.xyz);
    u_xlat52 = dot(u_xlat17.xyz, u_xlat16_23.xyz);
    u_xlat13.z = u_xlat73 * u_xlat52;
    u_xlat16.y = u_xlat70 * u_xlat71;
    u_xlat16_68 = dot(u_xlat5.zxy, u_xlat9.xyz);
    u_xlat16.x = u_xlat16_68 * u_xlat73;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_23.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_68) + 1.0;
    u_xlat16.z = u_xlat70 * u_xlat74;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat74 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat75 * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat16_68 = dot(u_xlat5.zxy, u_xlat16_23.xyz);
    u_xlat13.x = dot(u_xlat6.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat13.y = u_xlat16_68 * u_xlat71;
    u_xlat71 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat13.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat22.x = u_xlat22.x * u_xlat71 + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat70;
    u_xlat16_23.x = u_xlat73 * u_xlat73;
    u_xlat16_23.x = u_xlat73 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat73 * u_xlat16_23.x;
    u_xlat16_45.x = u_xlat73 * u_xlat16_23.x;
    u_xlat70 = (-u_xlat16_23.x) * u_xlat73 + 1.0;
    u_xlat9.xyz = u_xlat16_15.xyz * vec3(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat16_45.xxx + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat22.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat13.xxx * u_xlat9.xyz;
    u_xlat16_23.xyz = u_xlat9.xyz * u_xlat16_2.xyz + u_xlat10.xyz;
    u_xlat16_68 = (-_metallicMultiplier) + 1.0;
    u_xlat16_25.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_25.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat13.xxx * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat11.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = (-u_xlat4.xyz) * vec3(u_xlat66) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat6.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_18.y = u_xlat16_14.y;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati22 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati70 = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati70].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_78 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_25.xyz * u_xlat16_19.xyz;
    u_xlat16_80 = dot(u_xlat16_14.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_80 * 0.5 + 0.5;
    u_xlat16_81 = (-u_xlat16_80) + u_xlat16_81;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_80 = u_xlat16_41.z * u_xlat16_81 + u_xlat16_80;
    u_xlat16_80 = u_xlat16_41.z * u_xlat16_80;
    u_xlat16_80 = u_xlat16_68 * u_xlat16_80;
    u_xlat16_81 = min(u_xlat16_80, 1.0);
    u_xlat16_84 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_20.xyz = u_xlat16_25.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = vec3(u_xlat16_84) * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat16_81) + (-u_xlat16_21.xyz);
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat16_81) + u_xlat16_20.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + u_xlat16_2.xyz;
    u_xlat16_25.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_25.xxx * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_25.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=0.0);
#else
    u_xlatb0 = u_xlat16_1.x>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_12.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_12.yzx + (-u_xlat7.xyz);
    u_xlat9.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat66) + u_xlat5.xyz;
    u_xlat16_25.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_25.x = min(u_xlat16_25.x, 1.0);
    u_xlat16_25.x = abs(u_xlat16_1.x) * u_xlat16_25.x;
    u_xlat5.xyz = u_xlat16_25.xxx * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_25.x = dot((-u_xlat16_12.xyz), u_xlat5.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_25.xxx + (-u_xlat16_12.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat66) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat16_3.xxx * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat7.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = abs(u_xlat16_1.xxx) * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat16_1.x = -abs(u_xlat16_1.x) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat22.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat66 = dot(u_xlat16_14.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_41.y = u_xlat22.x * 0.5;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_3.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_1.x);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_78) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb22)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat8.y = _roughnessMultiplier;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_41.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_3.w);
    u_xlat16_78 = u_xlat16_1.x + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_3.x = u_xlat16_78 * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_3.x = u_xlat16_1.x * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_1.x = u_xlat16_14.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_78 = u_xlat16_22 + (-u_xlat16_4.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_78 + u_xlat16_4.x;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_1.x;
    u_xlat22.x = u_xlat66 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_80 * 0.5;
    u_xlat16_68 = (-u_xlat16_80) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_68 + u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_78 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_78 + u_xlat16_68;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_80;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat22.x = _emissiveBreathe.y * _Time.y;
    u_xlat22.x = sin(u_xlat22.x);
    u_xlat66 = (-_emissiveBreathe.z) + 1.0;
    u_xlat22.x = abs(u_xlat22.x) * u_xlat66 + _emissiveBreathe.z;
    u_xlat16_3 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat4.xyz = u_xlat22.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat4.xyz * u_xlat16_12.xyz + u_xlat16_2.xyz;
    u_xlat16_45.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_45.xy = u_xlat16_45.xx * vs_TEXCOORD3.xy;
    u_xlat16_45.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD4.xy + u_xlat16_45.xy;
    u_xlat22.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_45.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat16_45.xy).xyz;
    u_xlat16_45.xy = u_xlat22.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat22.xz = u_xlat22.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat22.xz = u_xlat22.xz + vec2(_Glitter_Offset);
    u_xlat16_5.xyz = texture(_FlowLightTex, u_xlat22.xz).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _FlowLightColor.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _FlowLightFactory.xxx;
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat16_7 = texture(_FlowLightTex, u_xlat16_45.xy);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _FlowLightFactory.xxx;
    u_xlat16_12.xyz = u_xlat16_7.www * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_12.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat4.xyz = u_xlat4.xyz / u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_45.x = _GlitteryControl.x * -0.0500000007;
    u_xlat0.xy = u_xlat16_45.xx * u_xlat0.xx + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat0.xy, vec2(-0.999998748, 0.00159265287));
    u_xlat7.y = dot(u_xlat0.xy, vec2(-0.00159265287, -0.999998748));
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_45.xy = _GlitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat66 = u_xlat16_45.y * _GlitteryControl.y;
    u_xlat7.xy = u_xlat16_45.xx * vs_TEXCOORD3.xy;
    u_xlat7.xy = u_xlat7.xy * _GlitteryControl.yy;
    u_xlat16_7.xyz = texture(_GlitterMap, u_xlat7.xy).xyz;
    u_xlat0.xy = vec2(u_xlat66) * u_xlat0.xy;
    u_xlat16_0.xyw = texture(_GlitterMap, u_xlat0.xy).xyz;
    u_xlat16_70 = texture(_GlitterMap, vs_TEXCOORD3.xy).w;
    u_xlat0.xyw = u_xlat16_7.xyz * u_xlat16_0.xyw + vec3(u_xlat16_70);
    u_xlat0.xyw = u_xlat0.xyw + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _GlitteryControl.www;
    u_xlat0.xyw = log2(u_xlat0.xyw);
    u_xlat0.xyw = u_xlat0.xyw * _GlitteryControl.zzz;
    u_xlat0.xyw = exp2(u_xlat0.xyw);
    u_xlat0.xyw = u_xlat0.xyw * _GlitterySPColor.xyz;
    u_xlat16_45.x = _GlitteryFresnelMaskPower * 32.0;
    u_xlat44 = u_xlat44 * u_xlat16_45.x;
    u_xlat44 = exp2(u_xlat44);
    u_xlat0.xyz = vec3(u_xlat44) * u_xlat0.xyw;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xyz;
    u_xlat66 = float(_LGMaskedGlitter);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.5<u_xlat66);
#else
    u_xlatb66 = 0.5<u_xlat66;
#endif
    u_xlat0.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_45.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat16_45.xy = u_xlat16_45.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_2.x = sin(u_xlat16_45.x);
    u_xlat16_12.x = cos(u_xlat16_45.x);
    u_xlat16_14.x = sin(u_xlat16_45.y);
    u_xlat16_15.x = cos(u_xlat16_45.y);
    u_xlat16_45.x = u_xlat16_12.x + u_xlat16_15.x;
    u_xlat16_2.y = u_xlat16_14.x;
    u_xlat16_2.z = u_xlat16_45.x * 0.5;
    u_xlat66 = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = log2(u_xlat66);
    u_xlat4.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat66 = u_xlat66 * u_xlat4.x;
    u_xlat66 = exp2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Power;
    u_xlat4.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat26.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat4.x = (-u_xlat26.x) + u_xlat4.x;
    u_xlat4.x = u_xlat4.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat26.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.5<_isGradient);
#else
    u_xlatb70 = 0.5<_isGradient;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb70)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat66) * u_xlat16_2.xyz;
    u_xlat5.xyz = vec3(u_xlat16_80) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb66 = 0.5<_EnableVISInfluence;
#endif
    u_xlat4.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_3.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_23.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	vec4 _GlitteryControl;
uniform 	mediump vec3 _GlitterySPColor;
uniform 	int _LGMaskedGlitter;
uniform 	mediump float _Glitter_Offset;
uniform 	mediump float _GlitteryFresnelMaskPower;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
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
UNITY_LOCATION(4) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(7) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(8) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(9) uniform mediump sampler2D _GlitterMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump vec3 u_xlat16_1;
mediump vec3 u_xlat16_2;
mediump vec4 u_xlat16_3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
vec3 u_xlat5;
mediump vec3 u_xlat16_5;
vec3 u_xlat6;
vec3 u_xlat7;
mediump vec4 u_xlat16_7;
vec3 u_xlat8;
vec3 u_xlat9;
ivec3 u_xlati9;
vec3 u_xlat10;
vec3 u_xlat11;
mediump vec3 u_xlat16_12;
vec3 u_xlat13;
mediump vec4 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
vec3 u_xlat16;
vec3 u_xlat17;
mediump vec4 u_xlat16_18;
mediump vec3 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
vec3 u_xlat22;
mediump float u_xlat16_22;
int u_xlati22;
bool u_xlatb22;
mediump vec3 u_xlat16_23;
mediump float u_xlat16_24;
mediump vec3 u_xlat16_25;
vec3 u_xlat26;
mediump vec3 u_xlat16_41;
float u_xlat44;
bool u_xlatb44;
mediump vec2 u_xlat16_45;
mediump float u_xlat16_47;
float u_xlat52;
float u_xlat66;
bool u_xlatb66;
mediump float u_xlat16_68;
float u_xlat70;
mediump float u_xlat16_70;
int u_xlati70;
bool u_xlatb70;
float u_xlat71;
float u_xlat72;
float u_xlat73;
float u_xlat74;
float u_xlat75;
mediump float u_xlat16_78;
mediump float u_xlat16_80;
mediump float u_xlat16_81;
mediump float u_xlat16_84;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
    u_xlat0.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat16_1.x = max(u_xlat16_1.x, 6.10351563e-05);
    u_xlat16_23.x = u_xlat16_1.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_23.x = (-u_xlat16_23.x) * u_xlat16_23.x + 1.0;
    u_xlat16_23.x = max(u_xlat16_23.x, 0.0);
    u_xlat16_23.x = u_xlat16_23.x * u_xlat16_23.x;
    u_xlat16_45.x = float(1.0) / float(u_xlat16_1.x);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat16_1.xxx;
    u_xlat16_1.x = u_xlat16_23.x * u_xlat16_45.x;
    u_xlat16_23.x = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.00100000005>=abs(u_xlat16_23.x));
#else
    u_xlatb0 = 0.00100000005>=abs(u_xlat16_23.x);
#endif
    u_xlat16_23.xy = (bool(u_xlatb0)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_1.x = max(u_xlat16_23.x, u_xlat16_1.x);
    u_xlat16_3.xyz = u_xlat16_23.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_23.xyz = u_xlat16_2.xyz * u_xlat16_23.yyy + u_xlat16_3.xyz;
    u_xlat16_2.x = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_23.xyz);
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
    u_xlat16_24 = (u_xlatb0) ? 1.0 : 0.0;
    u_xlat16_2.x = max(u_xlat16_24, u_xlat16_2.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_2.x;
    u_xlat16_2.xyz = u_xlat16_1.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.y = u_xlat0.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.xy = u_xlat0.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb44 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb44 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat44 = (u_xlatb44) ? 1.0 : -1.0;
    u_xlat44 = u_xlat44 * vs_TEXCOORD2.w;
    u_xlat4.z = vs_TEXCOORD1.x;
    u_xlat16_1.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_3.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_1.xxx + vs_TEXCOORD2.yzx;
    u_xlat66 = dot(u_xlat16_3.xyz, u_xlat16_3.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat5.xyz = vec3(u_xlat66) * u_xlat16_3.xyz;
    u_xlat6.xyz = u_xlat5.xyz * vs_TEXCOORD1.zxy;
    u_xlat6.xyz = vs_TEXCOORD1.yzx * u_xlat5.yzx + (-u_xlat6.xyz);
    u_xlat6.xyz = u_xlat6.xzy * vs_TEXCOORD2.www;
    u_xlat4.y = u_xlat6.x;
    u_xlat16_7.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_3.xy = u_xlat16_7.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_1.x = dot(u_xlat16_3.xy, u_xlat16_3.xy);
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_1.x = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = sqrt(u_xlat16_1.x);
    u_xlat16_3.z = max(u_xlat16_1.x, 1.00000002e-16);
    u_xlat4.x = u_xlat5.z;
    u_xlat4.x = dot(u_xlat16_3.xyz, u_xlat4.xyz);
    u_xlat7.x = u_xlat5.x;
    u_xlat7.y = u_xlat6.z;
    u_xlat7.z = vs_TEXCOORD1.y;
    u_xlat4.y = dot(u_xlat16_3.xyz, u_xlat7.xyz);
    u_xlat6.x = u_xlat5.y;
    u_xlat6.z = vs_TEXCOORD1.z;
    u_xlat4.z = dot(u_xlat16_3.xyz, u_xlat6.xyz);
    u_xlat66 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat66 = max(u_xlat66, 1.17549435e-38);
    u_xlat66 = inversesqrt(u_xlat66);
    u_xlat6.xyz = vec3(u_xlat66) * u_xlat4.xyz;
    u_xlat70 = dot(u_xlat5.zxy, u_xlat6.xyz);
    u_xlat5.xyz = (-u_xlat6.yzx) * vec3(u_xlat70) + u_xlat5.xyz;
    u_xlat70 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat5.xyz = vec3(u_xlat70) * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.yzx * u_xlat6.xyz;
    u_xlat7.xyz = u_xlat6.zxy * u_xlat5.zxy + (-u_xlat7.xyz);
    u_xlat7.xyz = vec3(u_xlat44) * u_xlat7.xyz;
    u_xlat8.xyz = u_xlat0.yyy * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat8.xyz = u_xlat22.xxx * u_xlat8.xyz;
    u_xlat9.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_1.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat16_1.x = inversesqrt(u_xlat16_1.x);
    u_xlat10.xyz = u_xlat9.xyz * u_xlat16_1.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat22.x = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat22.x = inversesqrt(u_xlat22.x);
    u_xlat10.xyz = u_xlat22.xxx * u_xlat10.xyz;
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat10.xyz);
    u_xlat16_68 = _anisotropicMultiplier2nd + _anisotropicMultiplier2nd;
    u_xlat16_3.x = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat44 = u_xlat16_68 * u_xlat16_3.x;
    u_xlat44 = max(u_xlat44, 0.00100000005);
    u_xlat11.y = u_xlat22.x * u_xlat44;
    u_xlat16_68 = dot(u_xlat5.zxy, u_xlat10.xyz);
    u_xlat16_25.x = _anisotropicMultiplier2nd * 2.0 + -1.0;
    u_xlat22.x = (-u_xlat16_25.x) + 1.0;
    u_xlat22.x = u_xlat22.x * u_xlat16_3.x;
    u_xlat22.x = max(u_xlat22.x, 0.00100000005);
    u_xlat11.x = u_xlat16_68 * u_xlat22.x;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat71 = u_xlat22.x * u_xlat44;
    u_xlat11.z = u_xlat70 * u_xlat71;
    u_xlat72 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat71 / u_xlat72;
    u_xlat71 = u_xlat71 * 0.318309873;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat71 = min(u_xlat71, 16.0);
    u_xlat72 = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.z = u_xlat22.x * u_xlat72;
    u_xlat16_25.x = dot(u_xlat5.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat11.y = u_xlat44 * u_xlat16_25.x;
    u_xlat11.x = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat11.x = min(max(u_xlat11.x, 0.0), 1.0);
#else
    u_xlat11.x = clamp(u_xlat11.x, 0.0, 1.0);
#endif
    u_xlat72 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat72 = sqrt(u_xlat72);
    u_xlat72 = u_xlat72 + u_xlat11.x;
    u_xlat72 = u_xlat72 + 6.10351563e-05;
    u_xlat16_12.xyz = u_xlat16_1.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat73 = dot(u_xlat8.xyz, u_xlat16_12.xyz);
    u_xlat8.z = u_xlat22.x * u_xlat73;
    u_xlat22.x = dot(u_xlat5.zxy, u_xlat16_12.xyz);
    u_xlat8.y = u_xlat22.x * u_xlat44;
    u_xlat44 = dot(u_xlat6.xyz, u_xlat16_12.xyz);
    u_xlat8.x = u_xlat44;
#ifdef UNITY_ADRENO_ES3
    u_xlat8.x = min(max(u_xlat8.x, 0.0), 1.0);
#else
    u_xlat8.x = clamp(u_xlat8.x, 0.0, 1.0);
#endif
    u_xlat44 = max(u_xlat44, 0.00100000005);
    u_xlat44 = log2(u_xlat44);
    u_xlat73 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat8.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat72 = u_xlat73 * u_xlat72 + 6.10351563e-05;
    u_xlat72 = float(1.0) / u_xlat72;
    u_xlat71 = u_xlat71 * u_xlat72;
    u_xlat16_1.x = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_1.x) + 1.0;
    u_xlat16_1.x = u_xlat72 * u_xlat72;
    u_xlat16_1.x = u_xlat72 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat72 * u_xlat16_1.x;
    u_xlat16_47 = u_xlat72 * u_xlat16_1.x;
    u_xlat72 = (-u_xlat16_1.x) * u_xlat72 + 1.0;
    u_xlat16_13 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_14.xyz = u_xlat16_13.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_14.xyz = u_xlat16_13.xyz * u_xlat16_14.xyz;
    u_xlat16_15.xyz = u_xlat16_14.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_14.xyz = u_xlat16_14.xyz * _albedoColor.xyz;
    u_xlat16_15.xyz = vec3(_metallicMultiplier) * u_xlat16_15.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat13.xyz = vec3(u_xlat72) * u_xlat16_15.xyz;
    u_xlat72 = u_xlat16_15.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat13.xyz = vec3(u_xlat72) * vec3(u_xlat16_47) + u_xlat13.xyz;
    u_xlat16.xyz = vec3(u_xlat71) * u_xlat13.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _directSpecularColor2nd.xyz;
    u_xlat16.xyz = u_xlat11.xxx * u_xlat16.xyz;
    u_xlat16.xyz = u_xlat16.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat17.xyz = u_xlat0.xxx * u_xlat6.xyz + u_xlat7.zxy;
    u_xlat71 = dot(u_xlat17.xyz, u_xlat17.xyz);
    u_xlat71 = inversesqrt(u_xlat71);
    u_xlat17.xyz = vec3(u_xlat71) * u_xlat17.xyz;
    u_xlat71 = dot(u_xlat17.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_1.x = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat73 = (-u_xlat16_1.x) + 1.0;
    u_xlat73 = u_xlat16_3.x * u_xlat73;
    u_xlat73 = max(u_xlat73, 0.00100000005);
    u_xlat11.z = u_xlat71 * u_xlat73;
    u_xlat16_47 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat71 = u_xlat16_47 * u_xlat16_3.x;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat11.y = u_xlat16_25.x * u_xlat71;
    u_xlat74 = dot(u_xlat11.xyz, u_xlat11.xyz);
    u_xlat74 = sqrt(u_xlat74);
    u_xlat74 = u_xlat74 + u_xlat11.x;
    u_xlat74 = u_xlat74 + 6.10351563e-05;
    u_xlat75 = dot(u_xlat17.xyz, u_xlat16_12.xyz);
    u_xlat8.z = u_xlat73 * u_xlat75;
    u_xlat8.y = u_xlat22.x * u_xlat71;
    u_xlat22.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat22.x = sqrt(u_xlat22.x);
    u_xlat22.x = u_xlat22.x + u_xlat8.x;
    u_xlat22.x = u_xlat22.x + 6.10351563e-05;
    u_xlat52 = u_xlat22.x * u_xlat74 + 6.10351563e-05;
    u_xlat52 = float(1.0) / u_xlat52;
    u_xlat74 = dot(u_xlat17.xyz, u_xlat10.xyz);
    u_xlat10.y = u_xlat71 * u_xlat74;
    u_xlat10.x = u_xlat16_68 * u_xlat73;
    u_xlat74 = u_xlat73 * u_xlat71;
    u_xlat10.z = u_xlat70 * u_xlat74;
    u_xlat70 = dot(u_xlat10.xyz, u_xlat10.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat74 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat75 = u_xlat74 * 0.318309873;
    u_xlat70 = u_xlat70 * u_xlat75;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat70 = u_xlat52 * u_xlat70;
    u_xlat10.xyz = u_xlat13.xyz * vec3(u_xlat70);
    u_xlat10.xyz = u_xlat10.xyz * _directSpecularColor.xyz;
    u_xlat10.xyz = u_xlat11.xxx * u_xlat10.xyz;
    u_xlat10.xyz = u_xlat10.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16.xyz;
    u_xlat70 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat70) * u_xlat9.xyz;
    u_xlat70 = dot(u_xlat17.xyz, u_xlat9.xyz);
    u_xlat52 = dot(u_xlat17.xyz, u_xlat16_23.xyz);
    u_xlat13.z = u_xlat73 * u_xlat52;
    u_xlat16.y = u_xlat70 * u_xlat71;
    u_xlat16_68 = dot(u_xlat5.zxy, u_xlat9.xyz);
    u_xlat16.x = u_xlat16_68 * u_xlat73;
    u_xlat70 = dot(u_xlat6.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16_68 = dot(u_xlat16_23.xyz, u_xlat9.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat73 = (-u_xlat16_68) + 1.0;
    u_xlat16.z = u_xlat70 * u_xlat74;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat74 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat75 * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat16_68 = dot(u_xlat5.zxy, u_xlat16_23.xyz);
    u_xlat13.x = dot(u_xlat6.xyz, u_xlat16_23.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat13.x = min(max(u_xlat13.x, 0.0), 1.0);
#else
    u_xlat13.x = clamp(u_xlat13.x, 0.0, 1.0);
#endif
    u_xlat13.y = u_xlat16_68 * u_xlat71;
    u_xlat71 = dot(u_xlat13.xyz, u_xlat13.xyz);
    u_xlat71 = sqrt(u_xlat71);
    u_xlat71 = u_xlat71 + u_xlat13.x;
    u_xlat71 = u_xlat71 + 6.10351563e-05;
    u_xlat22.x = u_xlat22.x * u_xlat71 + 6.10351563e-05;
    u_xlat22.x = float(1.0) / u_xlat22.x;
    u_xlat22.x = u_xlat22.x * u_xlat70;
    u_xlat16_23.x = u_xlat73 * u_xlat73;
    u_xlat16_23.x = u_xlat73 * u_xlat16_23.x;
    u_xlat16_23.x = u_xlat73 * u_xlat16_23.x;
    u_xlat16_45.x = u_xlat73 * u_xlat16_23.x;
    u_xlat70 = (-u_xlat16_23.x) * u_xlat73 + 1.0;
    u_xlat9.xyz = u_xlat16_15.xyz * vec3(u_xlat70);
    u_xlat9.xyz = vec3(u_xlat72) * u_xlat16_45.xxx + u_xlat9.xyz;
    u_xlat9.xyz = u_xlat22.xxx * u_xlat9.xyz;
    u_xlat9.xyz = u_xlat9.xyz * _directSpecularColor.xyz;
    u_xlat9.xyz = u_xlat13.xxx * u_xlat9.xyz;
    u_xlat16_23.xyz = u_xlat9.xyz * u_xlat16_2.xyz + u_xlat10.xyz;
    u_xlat16_68 = (-_metallicMultiplier) + 1.0;
    u_xlat16_25.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_25.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat13.xxx * u_xlat16_2.xyz;
    u_xlat16_14.xyz = u_xlat16_25.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_2.xyz = u_xlat16_14.xyz * u_xlat11.xxx + u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat16_23.xyz + u_xlat16_2.xyz;
    u_xlat16_14.xyz = (-u_xlat4.xyz) * vec3(u_xlat66) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat6.xyz;
    u_xlat16_68 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_68 = inversesqrt(u_xlat16_68);
    u_xlat16_14.xyz = vec3(u_xlat16_68) * u_xlat16_14.xyz;
    u_xlat16_18.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_18.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_18.y = u_xlat16_14.y;
    u_xlati9.xyz = ivec3(uvec3(lessThan(u_xlat16_18.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_18.xyz;
    u_xlati22 = int(int_bitfieldInsert(2,u_xlati9.y,0,1) );
    u_xlat16_68 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_68 = min(max(u_xlat16_68, 0.0), 1.0);
#else
    u_xlat16_68 = clamp(u_xlat16_68, 0.0, 1.0);
#endif
    u_xlat16_68 = u_xlat16_68 + -1.0;
    u_xlat16_68 = _occlusionScale * u_xlat16_68 + 1.0;
    u_xlat16_18.xyz = vec3(u_xlat16_68) * u_xlat16_18.xyz;
    u_xlat16_19.xyz = u_xlat16_18.yyy * _IrradianceACCoeffs[u_xlati22].xyz;
    u_xlati22 = int(uint(uint(u_xlati9.x) & 1u));
    u_xlati70 = (u_xlati9.z != 0) ? 5 : 4;
    u_xlat16_18.xyw = u_xlat16_18.xxx * _IrradianceACCoeffs[u_xlati22].xyz + u_xlat16_19.xyz;
    u_xlat16_18.xyz = u_xlat16_18.zzz * _IrradianceACCoeffs[u_xlati70].xyz + u_xlat16_18.xyw;
    u_xlat16_19.xyz = u_xlat16_18.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_78 = dot(u_xlat16_18.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_18.xyz = u_xlat16_25.xyz * u_xlat16_19.xyz;
    u_xlat16_80 = dot(u_xlat16_14.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_80 = min(max(u_xlat16_80, 0.0), 1.0);
#else
    u_xlat16_80 = clamp(u_xlat16_80, 0.0, 1.0);
#endif
    u_xlat16_81 = u_xlat16_80 * 0.5 + 0.5;
    u_xlat16_81 = (-u_xlat16_80) + u_xlat16_81;
    u_xlat16_84 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_41.z = _occlusionScale * u_xlat16_84 + 1.0;
    u_xlat16_80 = u_xlat16_41.z * u_xlat16_81 + u_xlat16_80;
    u_xlat16_80 = u_xlat16_41.z * u_xlat16_80;
    u_xlat16_80 = u_xlat16_68 * u_xlat16_80;
    u_xlat16_81 = min(u_xlat16_80, 1.0);
    u_xlat16_84 = u_xlat16_81 * u_xlat16_81;
    u_xlat16_20.xyz = u_xlat16_25.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_20.xyz = vec3(u_xlat16_84) * u_xlat16_20.xyz;
    u_xlat16_21.xyz = u_xlat16_25.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_21.xyz = vec3(u_xlat16_84) * u_xlat16_21.xyz;
    u_xlat16_20.xyz = u_xlat16_20.xyz * vec3(u_xlat16_81) + (-u_xlat16_21.xyz);
    u_xlat16_25.xyz = u_xlat16_25.xyz * vec3(u_xlat16_81) + u_xlat16_20.xyz;
    u_xlat16_25.xyz = u_xlat16_25.xyz * _localDiffuseGI.xyz;
    u_xlat16_2.xyz = u_xlat16_18.xyz * u_xlat16_25.xyz + u_xlat16_2.xyz;
    u_xlat16_25.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_25.x = inversesqrt(u_xlat16_25.x);
    u_xlat16_25.xyz = u_xlat16_25.xxx * vs_TEXCOORD1.yzx;
    u_xlat7.xyz = u_xlat0.xxx * u_xlat16_25.xyz + u_xlat7.xyz;
    u_xlat0.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat7.xyz = u_xlat0.xxx * u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1.x>=0.0);
#else
    u_xlatb0 = u_xlat16_1.x>=0.0;
#endif
    u_xlat5.xyz = (bool(u_xlatb0)) ? u_xlat7.xyz : u_xlat5.xyz;
    u_xlat7.xyz = u_xlat16_12.xyz * u_xlat5.xyz;
    u_xlat7.xyz = u_xlat5.zxy * u_xlat16_12.yzx + (-u_xlat7.xyz);
    u_xlat9.xyz = u_xlat5.xyz * u_xlat7.xyz;
    u_xlat5.xyz = u_xlat7.zxy * u_xlat5.yzx + (-u_xlat9.xyz);
    u_xlat5.xyz = (-u_xlat4.xyz) * vec3(u_xlat66) + u_xlat5.xyz;
    u_xlat16_25.x = u_xlat16_3.x * 8.0;
    u_xlat16_3.x = u_xlat16_3.x * u_xlat16_3.x;
    u_xlat16_3.x = max(u_xlat16_3.x, 0.0078125);
    u_xlat16_25.x = min(u_xlat16_25.x, 1.0);
    u_xlat16_25.x = abs(u_xlat16_1.x) * u_xlat16_25.x;
    u_xlat5.xyz = u_xlat16_25.xxx * u_xlat5.xyz + u_xlat6.xyz;
    u_xlat0.x = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat0.x = inversesqrt(u_xlat0.x);
    u_xlat5.xyz = u_xlat0.xxx * u_xlat5.xyz;
    u_xlat16_25.x = dot((-u_xlat16_12.xyz), u_xlat5.xyz);
    u_xlat16_25.x = u_xlat16_25.x + u_xlat16_25.x;
    u_xlat5.xyz = (-u_xlat5.xyz) * u_xlat16_25.xxx + (-u_xlat16_12.xyz);
    u_xlat0.x = dot(vs_TEXCOORD2.xyz, u_xlat16_12.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(u_xlat66) + (-u_xlat5.xyz);
    u_xlat4.xyz = u_xlat16_3.xxx * u_xlat4.xyz + u_xlat5.xyz;
    u_xlat7.xyz = (-u_xlat4.xyz) + u_xlat5.xyz;
    u_xlat4.xyz = abs(u_xlat16_1.xxx) * u_xlat7.xyz + u_xlat4.xyz;
    u_xlat16_1.x = -abs(u_xlat16_1.x) * 0.800000012 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * _roughnessMultiplier;
    u_xlat16_1.x = u_xlat16_1.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_1.x);
    u_xlat22.x = dot(u_xlat16_14.xyz, u_xlat5.xyz);
    u_xlat66 = dot(u_xlat16_14.xyz, u_xlat6.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat66 = min(max(u_xlat66, 0.0), 1.0);
#else
    u_xlat66 = clamp(u_xlat66, 0.0, 1.0);
#endif
    u_xlat16_41.y = u_xlat22.x * 0.5;
    u_xlat16_3.x = dot(_IndirectCubemapRotationParams.xy, u_xlat4.xz);
    u_xlat4.z = dot(_IndirectCubemapRotationParams.zw, u_xlat4.xz);
    u_xlat4.x = u_xlat16_3.x;
    u_xlat16_3 = textureLod(_IndirectSpecularMap, u_xlat4.xyz, u_xlat16_1.x);
    u_xlat16_12.xyz = u_xlat16_3.www * u_xlat16_3.xyz;
    u_xlat4.xyz = u_xlat16_12.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat4.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_14.xyz = vec3(u_xlat16_78) * u_xlat16_12.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb22 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb22 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_12.xyz = (bool(u_xlatb22)) ? u_xlat16_14.xyz : u_xlat16_12.xyz;
    u_xlat8.y = _roughnessMultiplier;
    u_xlat16_4.xy = texture(_DfgTexture, u_xlat8.xy).xy;
    u_xlat16_14.xyz = u_xlat16_15.xyz * u_xlat16_4.xxx + u_xlat16_4.yyy;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_41.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_14.xyz = u_xlat16_41.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_14.xyz = min(max(u_xlat16_14.xyz, 0.0), 1.0);
#else
    u_xlat16_14.xyz = clamp(u_xlat16_14.xyz, 0.0, 1.0);
#endif
    u_xlat16_3.yzw = u_xlat16_14.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_1.x = floor(u_xlat16_3.w);
    u_xlat16_78 = u_xlat16_1.x + 1.0;
    u_xlat16_78 = min(u_xlat16_78, 15.0);
    u_xlat16_3.x = u_xlat16_78 * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_22 = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_3.x = u_xlat16_1.x * 16.0 + u_xlat16_3.z;
    u_xlat16_14.xy = u_xlat16_3.xy + vec2(0.5, 0.5);
    u_xlat16_14.xy = u_xlat16_14.xy * vec2(0.00390625, 0.0625);
    u_xlat16_4.x = texture(_SpecularOcclusionLut3D, u_xlat16_14.xy).x;
    u_xlat16_1.x = u_xlat16_14.z * 15.0 + (-u_xlat16_1.x);
    u_xlat16_78 = u_xlat16_22 + (-u_xlat16_4.x);
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_78 + u_xlat16_4.x;
    u_xlat16_1.x = u_xlat16_68 * u_xlat16_1.x;
    u_xlat22.x = u_xlat66 * u_xlat16_1.x;
    u_xlat16_1.x = u_xlat16_80 * 0.5;
    u_xlat16_68 = (-u_xlat16_80) * 0.5 + 1.0;
    u_xlat16_1.x = u_xlat22.x * u_xlat16_68 + u_xlat16_1.x;
    u_xlat16_68 = u_xlat16_1.x + u_xlat16_1.x;
    u_xlat16_78 = (-u_xlat16_1.x) * 2.0 + 1.0;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_78 + u_xlat16_68;
    u_xlat16_1.x = u_xlat16_1.x * u_xlat16_80;
    u_xlat16_1.x = min(u_xlat16_1.x, 1.0);
    u_xlat16_2.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_2.xyz;
    u_xlat16_1.xyz = u_xlat16_12.xyz * u_xlat16_1.xxx + u_xlat16_23.xyz;
    u_xlat16_1.x = dot(u_xlat16_1.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_1.x = u_xlat16_13.w * _albedoColor.w + u_xlat16_1.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_1.x = min(max(u_xlat16_1.x, 0.0), 1.0);
#else
    u_xlat16_1.x = clamp(u_xlat16_1.x, 0.0, 1.0);
#endif
    u_xlat16_23.x = u_xlat16_13.w * _albedoColor.w;
    u_xlat22.x = _emissiveBreathe.y * _Time.y;
    u_xlat22.x = sin(u_xlat22.x);
    u_xlat66 = (-_emissiveBreathe.z) + 1.0;
    u_xlat22.x = abs(u_xlat22.x) * u_xlat66 + _emissiveBreathe.z;
    u_xlat16_3 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * _emissiveColor.xyz;
    u_xlat4.xyz = u_xlat22.xxx * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat4.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat4.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_2.xyz = u_xlat4.xyz * u_xlat16_12.xyz + u_xlat16_2.xyz;
    u_xlat16_45.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_45.xy = u_xlat16_45.xx * vs_TEXCOORD3.xy;
    u_xlat16_45.xy = vec2(_UseFlowLight2U) * vs_TEXCOORD4.xy + u_xlat16_45.xy;
    u_xlat22.xz = _Time.yy * _FlowLightFactory.yz + u_xlat16_45.xy;
    u_xlat16_4.xyz = texture(_FlowLightMask, u_xlat16_45.xy).xyz;
    u_xlat16_45.xy = u_xlat22.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat22.xz = u_xlat22.xz * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat22.xz = u_xlat22.xz + vec2(_Glitter_Offset);
    u_xlat16_5.xyz = texture(_FlowLightTex, u_xlat22.xz).xyz;
    u_xlat5.xyz = u_xlat16_5.xyz * _FlowLightColor.xyz;
    u_xlat5.xyz = u_xlat5.xyz * _FlowLightFactory.xxx;
    u_xlat5.xyz = u_xlat16_4.xyz * u_xlat5.xyz;
    u_xlat16_7 = texture(_FlowLightTex, u_xlat16_45.xy);
    u_xlat16_12.xyz = u_xlat16_4.xyz * u_xlat16_7.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * _FlowLightFactory.xxx;
    u_xlat16_12.xyz = u_xlat16_7.www * u_xlat16_12.xyz;
    u_xlat16_2.xyz = u_xlat16_12.xyz * _FlowLightColor.xyz + u_xlat16_2.xyz;
    u_xlat16_12.xyz = (-u_xlat16_2.xyz) + _FogCol.xyz;
    u_xlat16_2.xyz = vs_TEXCOORD0.www * u_xlat16_12.xyz + u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat16_2.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat4.xyz = u_xlat16_2.xyz * u_xlat4.xyz;
    u_xlat7.xyz = u_xlat16_2.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat7.xyz = u_xlat16_2.xyz * u_xlat7.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat4.xyz = u_xlat4.xyz / u_xlat7.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xyz = min(max(u_xlat4.xyz, 0.0), 1.0);
#else
    u_xlat4.xyz = clamp(u_xlat4.xyz, 0.0, 1.0);
#endif
    u_xlat4.xyz = log2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat4.xyz = exp2(u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat4.xyz = max(u_xlat4.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_45.x = _GlitteryControl.x * -0.0500000007;
    u_xlat0.xy = u_xlat16_45.xx * u_xlat0.xx + vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy + vec2(-0.5, -0.5);
    u_xlat7.x = dot(u_xlat0.xy, vec2(-0.999998748, 0.00159265287));
    u_xlat7.y = dot(u_xlat0.xy, vec2(-0.00159265287, -0.999998748));
    u_xlat0.xy = u_xlat7.xy + vec2(0.5, 0.5);
    u_xlat16_45.xy = _GlitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat66 = u_xlat16_45.y * _GlitteryControl.y;
    u_xlat7.xy = u_xlat16_45.xx * vs_TEXCOORD3.xy;
    u_xlat7.xy = u_xlat7.xy * _GlitteryControl.yy;
    u_xlat16_7.xyz = texture(_GlitterMap, u_xlat7.xy).xyz;
    u_xlat0.xy = vec2(u_xlat66) * u_xlat0.xy;
    u_xlat16_0.xyw = texture(_GlitterMap, u_xlat0.xy).xyz;
    u_xlat16_70 = texture(_GlitterMap, vs_TEXCOORD3.xy).w;
    u_xlat0.xyw = u_xlat16_7.xyz * u_xlat16_0.xyw + vec3(u_xlat16_70);
    u_xlat0.xyw = u_xlat0.xyw + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyw = min(max(u_xlat0.xyw, 0.0), 1.0);
#else
    u_xlat0.xyw = clamp(u_xlat0.xyw, 0.0, 1.0);
#endif
    u_xlat0.xyw = u_xlat0.xyw * _GlitteryControl.www;
    u_xlat0.xyw = log2(u_xlat0.xyw);
    u_xlat0.xyw = u_xlat0.xyw * _GlitteryControl.zzz;
    u_xlat0.xyw = exp2(u_xlat0.xyw);
    u_xlat0.xyw = u_xlat0.xyw * _GlitterySPColor.xyz;
    u_xlat16_45.x = _GlitteryFresnelMaskPower * 32.0;
    u_xlat44 = u_xlat44 * u_xlat16_45.x;
    u_xlat44 = exp2(u_xlat44);
    u_xlat0.xyz = vec3(u_xlat44) * u_xlat0.xyw;
    u_xlat5.xyz = u_xlat5.xyz * u_xlat0.xyz;
    u_xlat66 = float(_LGMaskedGlitter);
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.5<u_xlat66);
#else
    u_xlatb66 = 0.5<u_xlat66;
#endif
    u_xlat0.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat4.xyz;
    u_xlat16_45.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat16_45.xy = u_xlat16_45.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_2.x = sin(u_xlat16_45.x);
    u_xlat16_12.x = cos(u_xlat16_45.x);
    u_xlat16_14.x = sin(u_xlat16_45.y);
    u_xlat16_15.x = cos(u_xlat16_45.y);
    u_xlat16_45.x = u_xlat16_12.x + u_xlat16_15.x;
    u_xlat16_2.y = u_xlat16_14.x;
    u_xlat16_2.z = u_xlat16_45.x * 0.5;
    u_xlat66 = dot(u_xlat16_2.xyz, u_xlat6.xyz);
    u_xlat66 = max(u_xlat66, 0.0);
    u_xlat66 = log2(u_xlat66);
    u_xlat4.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat66 = u_xlat66 * u_xlat4.x;
    u_xlat66 = exp2(u_xlat66);
    u_xlat66 = u_xlat66 * _Sanshe_Power;
    u_xlat4.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat26.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat4.x = (-u_xlat26.x) + u_xlat4.x;
    u_xlat4.x = u_xlat4.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat26.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat4.xyz = u_xlat4.xxx * u_xlat26.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.5<_isGradient);
#else
    u_xlatb70 = 0.5<_isGradient;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb70)) ? u_xlat4.xyz : _Sanshe_color.xyz;
    u_xlat4.xyz = vec3(u_xlat66) * u_xlat16_2.xyz;
    u_xlat5.xyz = vec3(u_xlat16_80) * u_xlat4.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb66 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb66 = 0.5<_EnableVISInfluence;
#endif
    u_xlat4.xyz = (bool(u_xlatb66)) ? u_xlat5.xyz : u_xlat4.xyz;
    u_xlat0.xyz = u_xlat4.xyz * u_xlat16_3.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_1.x : u_xlat16_23.x;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	vec4 _GlitteryControl;
uniform 	mediump vec3 _GlitterySPColor;
uniform 	int _LGMaskedGlitter;
uniform 	mediump float _Glitter_Offset;
uniform 	mediump float _GlitteryFresnelMaskPower;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _GlitterMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
int u_xlati23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat27;
float u_xlat30;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_43;
float u_xlat46;
bool u_xlatb46;
vec2 u_xlat49;
mediump float u_xlat16_56;
float u_xlat69;
mediump float u_xlat16_69;
int u_xlati69;
bool u_xlatb69;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_75;
float u_xlat76;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
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
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_75 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_75 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = sqrt(u_xlat16_75);
    u_xlat16_6.z = max(u_xlat16_75, 1.00000002e-16);
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat27.xyz);
    u_xlat27.x = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _ShadowBias.z;
    u_xlat27.xyz = (-u_xlat8.xyz) * u_xlat27.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat27.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat24.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat24.x = (-u_xlat1.x) + u_xlat24.x;
    u_xlat0.z = _ShadowBias.y * u_xlat24.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat23.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.y = u_xlat0.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.xy = u_xlat0.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb46 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat46 = (u_xlatb46) ? 1.0 : -1.0;
    u_xlat46 = u_xlat46 * vs_TEXCOORD2.w;
    u_xlat69 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat1.xyz = (-u_xlat8.yzx) * vec3(u_xlat69) + u_xlat7.xyz;
    u_xlat69 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat1.xyz = vec3(u_xlat69) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.zxy * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat46) * u_xlat2.xyz;
    u_xlat23.xyz = u_xlat0.yyy * u_xlat8.xyz + u_xlat2.zxy;
    u_xlat70 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat70);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat70 = dot(u_xlat23.xyz, u_xlat4.xyz);
    u_xlat16_10.x = _anisotropicMultiplier2nd + _anisotropicMultiplier2nd;
    u_xlat16_33.x = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_33.x = max(u_xlat16_33.x, 0.0078125);
    u_xlat71 = u_xlat16_10.x * u_xlat16_33.x;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat7.y = u_xlat70 * u_xlat71;
    u_xlat16_10.x = dot(u_xlat1.zxy, u_xlat4.xyz);
    u_xlat16_56 = _anisotropicMultiplier2nd * 2.0 + -1.0;
    u_xlat70 = (-u_xlat16_56) + 1.0;
    u_xlat70 = u_xlat70 * u_xlat16_33.x;
    u_xlat70 = max(u_xlat70, 0.00100000005);
    u_xlat7.x = u_xlat16_10.x * u_xlat70;
    u_xlat72 = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat70 * u_xlat71;
    u_xlat7.z = u_xlat72 * u_xlat73;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat73 / u_xlat7.x;
    u_xlat73 = u_xlat73 * 0.318309873;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat73 = u_xlat73 * u_xlat7.x;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat7.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.z = u_xlat70 * u_xlat7.x;
    u_xlat16_56 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.y = u_xlat71 * u_xlat16_56;
    u_xlat7.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat7.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_75);
    u_xlat23.x = dot(u_xlat23.xyz, u_xlat16_11.xyz);
    u_xlat9.z = u_xlat23.x * u_xlat70;
    u_xlat23.x = dot(u_xlat1.zxy, u_xlat16_11.xyz);
    u_xlat9.y = u_xlat23.x * u_xlat71;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat9.x = u_xlat46;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = log2(u_xlat46);
    u_xlat69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat76 + 6.10351563e-05;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = u_xlat73 * u_xlat69;
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat70 * u_xlat70;
    u_xlat16_79 = u_xlat70 * u_xlat16_79;
    u_xlat16_79 = u_xlat70 * u_xlat16_79;
    u_xlat16_80 = u_xlat70 * u_xlat16_79;
    u_xlat70 = (-u_xlat16_79) * u_xlat70 + 1.0;
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _albedoColor.xyz;
    u_xlat16_14.xyz = vec3(_metallicMultiplier) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat70) * u_xlat16_14.xyz;
    u_xlat70 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat70) * vec3(u_xlat16_80) + u_xlat12.xyz;
    u_xlat15.xyz = vec3(u_xlat69) * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor2nd.xyz;
    u_xlat15.xyz = u_xlat7.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_6.xyz * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat2.zxy;
    u_xlat69 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat69 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_79 = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat71 = (-u_xlat16_79) + 1.0;
    u_xlat71 = u_xlat71 * u_xlat16_33.x;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat7.z = u_xlat69 * u_xlat71;
    u_xlat16_80 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat69 = u_xlat16_33.x * u_xlat16_80;
    u_xlat69 = max(u_xlat69, 0.00100000005);
    u_xlat7.y = u_xlat16_56 * u_xlat69;
    u_xlat73 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat7.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat30 = dot(u_xlat16.xyz, u_xlat16_11.xyz);
    u_xlat9.z = u_xlat71 * u_xlat30;
    u_xlat9.y = u_xlat23.x * u_xlat69;
    u_xlat23.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat9.x;
    u_xlat23.x = u_xlat23.x + 6.10351563e-05;
    u_xlat73 = u_xlat23.x * u_xlat73 + 6.10351563e-05;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat4.y = u_xlat69 * u_xlat4.x;
    u_xlat4.x = u_xlat16_10.x * u_xlat71;
    u_xlat30 = u_xlat71 * u_xlat69;
    u_xlat4.z = u_xlat72 * u_xlat30;
    u_xlat72 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat30 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat4.x = u_xlat30 * 0.318309873;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat72 = u_xlat73 * u_xlat72;
    u_xlat27.xyz = u_xlat12.xyz * vec3(u_xlat72);
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat7.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_6.xyz + u_xlat15.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_56 = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = (-u_xlat16_56) * u_xlat16_56 + 1.0;
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_80 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_17.xyz = u_xlat16_10.xxx * u_xlat12.xyz;
    u_xlat16_10.x = u_xlat16_56 * u_xlat16_80;
    u_xlat16_56 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.00100000005>=abs(u_xlat16_56));
#else
    u_xlatb72 = 0.00100000005>=abs(u_xlat16_56);
#endif
    u_xlat16_18.xy = (bool(u_xlatb72)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_10.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_56 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_56 = u_xlat16_56 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_80);
    u_xlat16_10.x = u_xlat16_56 * u_xlat16_10.x;
    u_xlat16_18.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_75) + u_xlat16_17.xyz;
    u_xlat72 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat3.xyz = vec3(u_xlat72) * u_xlat3.xyz;
    u_xlat16_75 = dot(u_xlat16_17.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat72 * u_xlat72;
    u_xlat16_75 = u_xlat72 * u_xlat16_75;
    u_xlat16_75 = u_xlat72 * u_xlat16_75;
    u_xlat16_10.x = u_xlat72 * u_xlat16_75;
    u_xlat72 = (-u_xlat16_75) * u_xlat72 + 1.0;
    u_xlat12.xyz = u_xlat16_14.xyz * vec3(u_xlat72);
    u_xlat12.xyz = vec3(u_xlat70) * u_xlat16_10.xxx + u_xlat12.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat3.xyz);
    u_xlat72 = dot(u_xlat16.xyz, u_xlat16_17.xyz);
    u_xlat15.z = u_xlat71 * u_xlat72;
    u_xlat16.y = u_xlat69 * u_xlat70;
    u_xlat16_75 = dot(u_xlat1.zxy, u_xlat3.xyz);
    u_xlat70 = dot(u_xlat8.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat70 * u_xlat30;
    u_xlat16.x = u_xlat71 * u_xlat16_75;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat30 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat4.x * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat16_75 = dot(u_xlat1.zxy, u_xlat16_17.xyz);
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat15.y = u_xlat69 * u_xlat16_75;
    u_xlat69 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat15.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat23.x = u_xlat23.x * u_xlat69 + 6.10351563e-05;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat70;
    u_xlat3.xyz = u_xlat12.xyz * u_xlat23.xxx;
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat3.xyz;
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat16_18.xyz + u_xlat27.xyz;
    u_xlat16_75 = (-_metallicMultiplier) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_75) * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat15.xxx * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat7.xxx + u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_18.xyz = (-u_xlat5.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_occlusionScale) * u_xlat16_18.xyz + u_xlat8.xyz;
    u_xlat16_75 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = vec3(u_xlat16_75) * u_xlat16_18.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati69 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati69].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.x = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_56 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_56) + u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_56 = u_xlat16_43.z * u_xlat16_80 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_43.z * u_xlat16_56;
    u_xlat16_56 = u_xlat16_75 * u_xlat16_56;
    u_xlat16_80 = min(u_xlat16_56, 1.0);
    u_xlat16_82 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = vec3(u_xlat16_82) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat16_80) + (-u_xlat16_22.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_80) + u_xlat16_21.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_80 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_13.xyz = vec3(u_xlat16_80) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat2.xyz;
    u_xlat70 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat16_79>=0.0);
#else
    u_xlatb70 = u_xlat16_79>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb70)) ? u_xlat0.xyw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat0.xyw;
    u_xlat1.xyz = u_xlat0.wxy * u_xlat16_11.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyw * u_xlat1.xyz;
    u_xlat0.xyw = u_xlat1.zxy * u_xlat0.ywx + (-u_xlat2.xyz);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat74) + u_xlat0.xyw;
    u_xlat16_80 = u_xlat16_33.x * 8.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_33.x = max(u_xlat16_33.x, 0.0078125);
    u_xlat16_80 = min(u_xlat16_80, 1.0);
    u_xlat16_80 = abs(u_xlat16_79) * u_xlat16_80;
    u_xlat0.xyw = vec3(u_xlat16_80) * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat16_80 = dot((-u_xlat16_11.xyz), u_xlat0.xyw);
    u_xlat16_80 = u_xlat16_80 + u_xlat16_80;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_80) + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat24.xyz = u_xlat5.xyz * vec3(u_xlat74) + (-u_xlat0.xyw);
    u_xlat24.xyz = u_xlat16_33.xxx * u_xlat24.xyz + u_xlat0.xyw;
    u_xlat2.xyz = u_xlat0.xyw + (-u_xlat24.xyz);
    u_xlat24.xyz = abs(vec3(u_xlat16_79)) * u_xlat2.xyz + u_xlat24.xyz;
    u_xlat16_33.x = -abs(u_xlat16_79) * 0.800000012 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * _roughnessMultiplier;
    u_xlat16_33.x = u_xlat16_33.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_33.x);
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xyw);
    u_xlat23.x = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_79 = dot(_IndirectCubemapRotationParams.xy, u_xlat24.xz);
    u_xlat24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat24.xz);
    u_xlat24.x = u_xlat16_79;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_33.x);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat24.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat24.xyz * u_xlat24.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyw = u_xlat16_10.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyw = (bool(u_xlatb0)) ? u_xlat16_10.xyw : u_xlat16_11.xyz;
    u_xlat9.y = _roughnessMultiplier;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_10.xyw = u_xlat16_10.xyw * u_xlat16_11.xyz;
    u_xlat16_10.xyw = u_xlat16_10.xyw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_43.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_11.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_34.x = u_xlat16_11.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_2.x = u_xlat16_34.x * 16.0 + u_xlat16_2.z;
    u_xlat16_34.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_34.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_69 = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_34.x = (-u_xlat16_69) + u_xlat16_0.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_34.x + u_xlat16_69;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_11.x;
    u_xlat0.x = u_xlat23.x * u_xlat16_75;
    u_xlat16_75 = u_xlat16_56 * 0.5;
    u_xlat16_11.x = (-u_xlat16_56) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat0.x * u_xlat16_11.x + u_xlat16_75;
    u_xlat16_11.x = u_xlat16_75 + u_xlat16_75;
    u_xlat16_34.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_34.x + u_xlat16_11.x;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_56;
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_6.xyz = u_xlat16_10.xyw * vec3(u_xlat16_75) + u_xlat16_6.xyz;
    u_xlat16_10.xyw = u_xlat16_10.xyw * vec3(u_xlat16_75) + u_xlat16_17.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_12.w * _albedoColor.w + u_xlat16_75;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat23.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat23.x + _emissiveBreathe.z;
    u_xlat16_2 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyw * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat0.xyw * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_33.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_33.xz = u_xlat16_33.xx * vs_TEXCOORD3.xy;
    u_xlat16_33.xz = vec2(_UseFlowLight2U) * vs_TEXCOORD4.xy + u_xlat16_33.xz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_33.xz;
    u_xlat16_24.xyz = texture(_FlowLightMask, u_xlat16_33.xz).xyz;
    u_xlat16_33.xz = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(_Glitter_Offset);
    u_xlat16_0.xyw = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyw = u_xlat16_0.xyw * _FlowLightColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _FlowLightFactory.xxx;
    u_xlat0.xyw = u_xlat16_24.xyz * u_xlat0.xyw;
    u_xlat16_3 = texture(_FlowLightTex, u_xlat16_33.xz);
    u_xlat16_11.xyz = u_xlat16_24.xyz * u_xlat16_3.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _FlowLightFactory.xxx;
    u_xlat16_11.xyz = u_xlat16_3.www * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat24.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat3.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat24.xyz = u_xlat24.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = log2(u_xlat24.xyz);
    u_xlat24.xyz = u_xlat24.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat24.xyz = exp2(u_xlat24.xyz);
    u_xlat24.xyz = u_xlat24.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat24.xyz = max(u_xlat24.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.x = _GlitteryControl.x * -0.0500000007;
    u_xlat3.xy = u_xlat16_6.xx * u_xlat1.xx + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat3.xy, vec2(-0.999998748, 0.00159265287));
    u_xlat4.y = dot(u_xlat3.xy, vec2(-0.00159265287, -0.999998748));
    u_xlat3.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = _GlitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat16_6.y * _GlitteryControl.y;
    u_xlat49.xy = u_xlat16_6.xx * vs_TEXCOORD3.xy;
    u_xlat49.xy = u_xlat49.xy * _GlitteryControl.yy;
    u_xlat16_4.xyz = texture(_GlitterMap, u_xlat49.xy).xyz;
    u_xlat3.xy = u_xlat1.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterMap, u_xlat3.xy).xyz;
    u_xlat16_1 = texture(_GlitterMap, vs_TEXCOORD3.xy).w;
    u_xlat3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(u_xlat16_1);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _GlitteryControl.www;
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _GlitteryControl.zzz;
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _GlitterySPColor.xyz;
    u_xlat16_6.x = _GlitteryFresnelMaskPower * 32.0;
    u_xlat46 = u_xlat46 * u_xlat16_6.x;
    u_xlat46 = exp2(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyw * u_xlat3.xyz;
    u_xlat69 = float(_LGMaskedGlitter);
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.5<u_xlat69);
#else
    u_xlatb69 = 0.5<u_xlat69;
#endif
    u_xlat0.xyz = (bool(u_xlatb69)) ? u_xlat0.xyz : u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat24.xyz;
    u_xlat16_6.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_11.x = sin(u_xlat16_6.x);
    u_xlat16_6.x = cos(u_xlat16_6.x);
    u_xlat16_13.x = sin(u_xlat16_6.y);
    u_xlat16_14.x = cos(u_xlat16_6.y);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_14.x;
    u_xlat16_11.y = u_xlat16_13.x;
    u_xlat16_11.z = u_xlat16_6.x * 0.5;
    u_xlat69 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = log2(u_xlat69);
    u_xlat1.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat69 = u_xlat69 * u_xlat1.x;
    u_xlat69 = exp2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Power;
    u_xlat1.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat24.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat1.x = (-u_xlat24.x) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat24.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.5<_isGradient);
#else
    u_xlatb70 = 0.5<_isGradient;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb70)) ? u_xlat1.xyz : _Sanshe_color.xyz;
    u_xlat1.xyz = vec3(u_xlat69) * u_xlat16_6.xyz;
    u_xlat3.xyz = vec3(u_xlat16_56) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb69 = 0.5<_EnableVISInfluence;
#endif
    u_xlat1.xyz = (bool(u_xlatb69)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_75 : u_xlat16_10.x;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _anisotropicMultiplier2nd;
uniform 	mediump vec4 _directSpecularColor2nd;
uniform 	mediump float _sunShift2nd;
uniform 	mediump float _sunShiftOffset2nd;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
uniform 	mediump vec4 _FlowLightTex_ST;
uniform 	mediump float _UseFlowLight2U;
uniform 	mediump vec4 _FlowLightColor;
uniform 	mediump vec4 _FlowLightFactory;
uniform 	vec4 _GlitteryControl;
uniform 	mediump vec3 _GlitterySPColor;
uniform 	int _LGMaskedGlitter;
uniform 	mediump float _Glitter_Offset;
uniform 	mediump float _GlitteryFresnelMaskPower;
uniform 	mediump float _EnableVISInfluence;
uniform 	float _isGradient;
uniform 	vec4 _Sanshe_color_low;
uniform 	float _Sanshe_GradientRange;
uniform 	float _Sanshe_GradientCenter;
uniform 	float _Sanshe_Fw;
uniform 	float _Sanshe_Power;
uniform 	vec4 _Sanshe_color;
uniform 	float _Sanshe_X;
uniform 	float _Sanshe_Y;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
UNITY_LOCATION(9) uniform mediump sampler2D _FlowLightMask;
UNITY_LOCATION(10) uniform mediump sampler2D _FlowLightTex;
UNITY_LOCATION(11) uniform mediump sampler2D _GlitterMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump float u_xlat16_1;
vec4 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
mediump vec3 u_xlat16_4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec4 u_xlat16_10;
mediump vec3 u_xlat16_11;
vec3 u_xlat12;
mediump vec4 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
vec3 u_xlat15;
vec3 u_xlat16;
mediump vec3 u_xlat16_17;
mediump vec4 u_xlat16_18;
mediump vec4 u_xlat16_19;
mediump vec3 u_xlat16_20;
mediump vec3 u_xlat16_21;
mediump vec3 u_xlat16_22;
vec3 u_xlat23;
int u_xlati23;
vec3 u_xlat24;
mediump vec3 u_xlat16_24;
vec3 u_xlat27;
float u_xlat30;
mediump vec3 u_xlat16_33;
mediump vec3 u_xlat16_34;
mediump vec3 u_xlat16_43;
float u_xlat46;
bool u_xlatb46;
vec2 u_xlat49;
mediump float u_xlat16_56;
float u_xlat69;
mediump float u_xlat16_69;
int u_xlati69;
bool u_xlatb69;
float u_xlat70;
bool u_xlatb70;
float u_xlat71;
float u_xlat72;
bool u_xlatb72;
float u_xlat73;
float u_xlat74;
mediump float u_xlat16_75;
float u_xlat76;
mediump float u_xlat16_79;
mediump float u_xlat16_80;
mediump float u_xlat16_82;
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
    u_xlat27.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat27.xyz, u_xlat27.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat27.xyz = u_xlat27.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat74 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat7.xyz = vec3(u_xlat74) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_75 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_75 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = sqrt(u_xlat16_75);
    u_xlat16_6.z = max(u_xlat16_75, 1.00000002e-16);
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat74 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat74 = max(u_xlat74, 1.17549435e-38);
    u_xlat74 = inversesqrt(u_xlat74);
    u_xlat8.xyz = vec3(u_xlat74) * u_xlat5.xyz;
    u_xlat27.x = dot(u_xlat8.xyz, u_xlat27.xyz);
    u_xlat27.x = (-u_xlat27.x) * u_xlat27.x + 1.0;
    u_xlat27.x = sqrt(u_xlat27.x);
    u_xlat27.x = u_xlat27.x * _ShadowBias.z;
    u_xlat27.xyz = (-u_xlat8.xyz) * u_xlat27.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat27.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat24.x = max((-u_xlat0.w), u_xlat1.x);
    u_xlat24.x = (-u_xlat1.x) + u_xlat24.x;
    u_xlat0.z = _ShadowBias.y * u_xlat24.x + u_xlat1.x;
    u_xlat0.xyz = u_xlat0.xyz / u_xlat0.www;
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.5, 0.5, 0.5) + vec3(0.5, 0.5, 0.5);
    u_xlat1.xy = _ShadowMapTexture_TexelSize.xy * vec2(-0.5, -0.5);
    u_xlat1.z = 0.0;
    u_xlat0.w = max(u_xlat0.z, 9.99999975e-05);
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
    u_xlat23.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat23.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.y = u_xlat0.x * _sunShift2nd + _sunShiftOffset2nd;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.xy = u_xlat0.xy + vec2(vs_TEXCOORD5);
#ifdef UNITY_ADRENO_ES3
    u_xlatb46 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb46 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat46 = (u_xlatb46) ? 1.0 : -1.0;
    u_xlat46 = u_xlat46 * vs_TEXCOORD2.w;
    u_xlat69 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat1.xyz = (-u_xlat8.yzx) * vec3(u_xlat69) + u_xlat7.xyz;
    u_xlat69 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat1.xyz = vec3(u_xlat69) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.zxy * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat2.xyz = vec3(u_xlat46) * u_xlat2.xyz;
    u_xlat23.xyz = u_xlat0.yyy * u_xlat8.xyz + u_xlat2.zxy;
    u_xlat70 = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat23.xyz = u_xlat23.xyz * vec3(u_xlat70);
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_75 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_75) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat70 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat4.xyz = vec3(u_xlat70) * u_xlat4.xyz;
    u_xlat70 = dot(u_xlat23.xyz, u_xlat4.xyz);
    u_xlat16_10.x = _anisotropicMultiplier2nd + _anisotropicMultiplier2nd;
    u_xlat16_33.x = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_33.x = max(u_xlat16_33.x, 0.0078125);
    u_xlat71 = u_xlat16_10.x * u_xlat16_33.x;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat7.y = u_xlat70 * u_xlat71;
    u_xlat16_10.x = dot(u_xlat1.zxy, u_xlat4.xyz);
    u_xlat16_56 = _anisotropicMultiplier2nd * 2.0 + -1.0;
    u_xlat70 = (-u_xlat16_56) + 1.0;
    u_xlat70 = u_xlat70 * u_xlat16_33.x;
    u_xlat70 = max(u_xlat70, 0.00100000005);
    u_xlat7.x = u_xlat16_10.x * u_xlat70;
    u_xlat72 = dot(u_xlat8.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat72 = min(max(u_xlat72, 0.0), 1.0);
#else
    u_xlat72 = clamp(u_xlat72, 0.0, 1.0);
#endif
    u_xlat73 = u_xlat70 * u_xlat71;
    u_xlat7.z = u_xlat72 * u_xlat73;
    u_xlat7.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat7.x = max(u_xlat7.x, 6.10351563e-05);
    u_xlat7.x = u_xlat73 / u_xlat7.x;
    u_xlat73 = u_xlat73 * 0.318309873;
    u_xlat7.x = u_xlat7.x * u_xlat7.x;
    u_xlat73 = u_xlat73 * u_xlat7.x;
    u_xlat73 = min(u_xlat73, 16.0);
    u_xlat7.x = dot(u_xlat23.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.z = u_xlat70 * u_xlat7.x;
    u_xlat16_56 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat7.y = u_xlat71 * u_xlat16_56;
    u_xlat7.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat76 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat76 = sqrt(u_xlat76);
    u_xlat76 = u_xlat76 + u_xlat7.x;
    u_xlat76 = u_xlat76 + 6.10351563e-05;
    u_xlat16_11.xyz = u_xlat3.xyz * vec3(u_xlat16_75);
    u_xlat23.x = dot(u_xlat23.xyz, u_xlat16_11.xyz);
    u_xlat9.z = u_xlat23.x * u_xlat70;
    u_xlat23.x = dot(u_xlat1.zxy, u_xlat16_11.xyz);
    u_xlat9.y = u_xlat23.x * u_xlat71;
    u_xlat46 = dot(u_xlat8.xyz, u_xlat16_11.xyz);
    u_xlat9.x = u_xlat46;
#ifdef UNITY_ADRENO_ES3
    u_xlat9.x = min(max(u_xlat9.x, 0.0), 1.0);
#else
    u_xlat9.x = clamp(u_xlat9.x, 0.0, 1.0);
#endif
    u_xlat46 = max(u_xlat46, 0.00100000005);
    u_xlat46 = log2(u_xlat46);
    u_xlat69 = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat9.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat69 = u_xlat69 * u_xlat76 + 6.10351563e-05;
    u_xlat69 = float(1.0) / u_xlat69;
    u_xlat69 = u_xlat73 * u_xlat69;
    u_xlat16_79 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_79 = min(max(u_xlat16_79, 0.0), 1.0);
#else
    u_xlat16_79 = clamp(u_xlat16_79, 0.0, 1.0);
#endif
    u_xlat70 = (-u_xlat16_79) + 1.0;
    u_xlat16_79 = u_xlat70 * u_xlat70;
    u_xlat16_79 = u_xlat70 * u_xlat16_79;
    u_xlat16_79 = u_xlat70 * u_xlat16_79;
    u_xlat16_80 = u_xlat70 * u_xlat16_79;
    u_xlat70 = (-u_xlat16_79) * u_xlat70 + 1.0;
    u_xlat16_12 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_13.xyz = u_xlat16_12.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_13.xyz = u_xlat16_12.xyz * u_xlat16_13.xyz;
    u_xlat16_14.xyz = u_xlat16_13.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_13.xyz = u_xlat16_13.xyz * _albedoColor.xyz;
    u_xlat16_14.xyz = vec3(_metallicMultiplier) * u_xlat16_14.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat12.xyz = vec3(u_xlat70) * u_xlat16_14.xyz;
    u_xlat70 = u_xlat16_14.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat12.xyz = vec3(u_xlat70) * vec3(u_xlat16_80) + u_xlat12.xyz;
    u_xlat15.xyz = vec3(u_xlat69) * u_xlat12.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _directSpecularColor2nd.xyz;
    u_xlat15.xyz = u_xlat7.xxx * u_xlat15.xyz;
    u_xlat15.xyz = u_xlat15.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat15.xyz = u_xlat16_6.xyz * u_xlat15.xyz;
    u_xlat16.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat2.zxy;
    u_xlat69 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat69 = inversesqrt(u_xlat69);
    u_xlat16.xyz = vec3(u_xlat69) * u_xlat16.xyz;
    u_xlat69 = dot(u_xlat16.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat16_79 = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat71 = (-u_xlat16_79) + 1.0;
    u_xlat71 = u_xlat71 * u_xlat16_33.x;
    u_xlat71 = max(u_xlat71, 0.00100000005);
    u_xlat7.z = u_xlat69 * u_xlat71;
    u_xlat16_80 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat69 = u_xlat16_33.x * u_xlat16_80;
    u_xlat69 = max(u_xlat69, 0.00100000005);
    u_xlat7.y = u_xlat16_56 * u_xlat69;
    u_xlat73 = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat73 = sqrt(u_xlat73);
    u_xlat73 = u_xlat73 + u_xlat7.x;
    u_xlat73 = u_xlat73 + 6.10351563e-05;
    u_xlat30 = dot(u_xlat16.xyz, u_xlat16_11.xyz);
    u_xlat9.z = u_xlat71 * u_xlat30;
    u_xlat9.y = u_xlat23.x * u_xlat69;
    u_xlat23.x = dot(u_xlat9.xyz, u_xlat9.xyz);
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x + u_xlat9.x;
    u_xlat23.x = u_xlat23.x + 6.10351563e-05;
    u_xlat73 = u_xlat23.x * u_xlat73 + 6.10351563e-05;
    u_xlat73 = float(1.0) / u_xlat73;
    u_xlat4.x = dot(u_xlat16.xyz, u_xlat4.xyz);
    u_xlat4.y = u_xlat69 * u_xlat4.x;
    u_xlat4.x = u_xlat16_10.x * u_xlat71;
    u_xlat30 = u_xlat71 * u_xlat69;
    u_xlat4.z = u_xlat72 * u_xlat30;
    u_xlat72 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat72 = max(u_xlat72, 6.10351563e-05);
    u_xlat72 = u_xlat30 / u_xlat72;
    u_xlat72 = u_xlat72 * u_xlat72;
    u_xlat4.x = u_xlat30 * 0.318309873;
    u_xlat72 = u_xlat72 * u_xlat4.x;
    u_xlat72 = min(u_xlat72, 16.0);
    u_xlat72 = u_xlat73 * u_xlat72;
    u_xlat27.xyz = u_xlat12.xyz * vec3(u_xlat72);
    u_xlat27.xyz = u_xlat27.xyz * _directSpecularColor.xyz;
    u_xlat27.xyz = u_xlat7.xxx * u_xlat27.xyz;
    u_xlat27.xyz = u_xlat27.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat27.xyz = u_xlat27.xyz * u_xlat16_6.xyz + u_xlat15.xyz;
    u_xlat12.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_10.x = dot(u_xlat12.xyz, u_xlat12.xyz);
    u_xlat16_10.x = max(u_xlat16_10.x, 6.10351563e-05);
    u_xlat16_56 = u_xlat16_10.x * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_56 = (-u_xlat16_56) * u_xlat16_56 + 1.0;
    u_xlat16_56 = max(u_xlat16_56, 0.0);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
    u_xlat16_80 = float(1.0) / float(u_xlat16_10.x);
    u_xlat16_10.x = inversesqrt(u_xlat16_10.x);
    u_xlat16_17.xyz = u_xlat16_10.xxx * u_xlat12.xyz;
    u_xlat16_10.x = u_xlat16_56 * u_xlat16_80;
    u_xlat16_56 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.00100000005>=abs(u_xlat16_56));
#else
    u_xlatb72 = 0.00100000005>=abs(u_xlat16_56);
#endif
    u_xlat16_18.xy = (bool(u_xlatb72)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_10.x = max(u_xlat16_10.x, u_xlat16_18.x);
    u_xlat16_18.xzw = u_xlat16_18.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_17.xyz = u_xlat16_17.xyz * u_xlat16_18.yyy + u_xlat16_18.xzw;
    u_xlat16_56 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_17.xyz);
    u_xlat16_56 = u_xlat16_56 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_56 = u_xlat16_56 * u_xlat16_56;
#ifdef UNITY_ADRENO_ES3
    u_xlatb72 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb72 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_80 = (u_xlatb72) ? 1.0 : 0.0;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_80);
    u_xlat16_10.x = u_xlat16_56 * u_xlat16_10.x;
    u_xlat16_18.xyz = u_xlat16_10.xxx * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat3.xyz = u_xlat3.xyz * vec3(u_xlat16_75) + u_xlat16_17.xyz;
    u_xlat72 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat72 = inversesqrt(u_xlat72);
    u_xlat3.xyz = vec3(u_xlat72) * u_xlat3.xyz;
    u_xlat16_75 = dot(u_xlat16_17.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat72 = (-u_xlat16_75) + 1.0;
    u_xlat16_75 = u_xlat72 * u_xlat72;
    u_xlat16_75 = u_xlat72 * u_xlat16_75;
    u_xlat16_75 = u_xlat72 * u_xlat16_75;
    u_xlat16_10.x = u_xlat72 * u_xlat16_75;
    u_xlat72 = (-u_xlat16_75) * u_xlat72 + 1.0;
    u_xlat12.xyz = u_xlat16_14.xyz * vec3(u_xlat72);
    u_xlat12.xyz = vec3(u_xlat70) * u_xlat16_10.xxx + u_xlat12.xyz;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat3.xyz);
    u_xlat72 = dot(u_xlat16.xyz, u_xlat16_17.xyz);
    u_xlat15.z = u_xlat71 * u_xlat72;
    u_xlat16.y = u_xlat69 * u_xlat70;
    u_xlat16_75 = dot(u_xlat1.zxy, u_xlat3.xyz);
    u_xlat70 = dot(u_xlat8.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat70 = min(max(u_xlat70, 0.0), 1.0);
#else
    u_xlat70 = clamp(u_xlat70, 0.0, 1.0);
#endif
    u_xlat16.z = u_xlat70 * u_xlat30;
    u_xlat16.x = u_xlat71 * u_xlat16_75;
    u_xlat70 = dot(u_xlat16.xyz, u_xlat16.xyz);
    u_xlat70 = max(u_xlat70, 6.10351563e-05);
    u_xlat70 = u_xlat30 / u_xlat70;
    u_xlat70 = u_xlat70 * u_xlat70;
    u_xlat70 = u_xlat4.x * u_xlat70;
    u_xlat70 = min(u_xlat70, 16.0);
    u_xlat16_75 = dot(u_xlat1.zxy, u_xlat16_17.xyz);
    u_xlat15.x = dot(u_xlat8.xyz, u_xlat16_17.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat15.x = min(max(u_xlat15.x, 0.0), 1.0);
#else
    u_xlat15.x = clamp(u_xlat15.x, 0.0, 1.0);
#endif
    u_xlat15.y = u_xlat69 * u_xlat16_75;
    u_xlat69 = dot(u_xlat15.xyz, u_xlat15.xyz);
    u_xlat69 = sqrt(u_xlat69);
    u_xlat69 = u_xlat69 + u_xlat15.x;
    u_xlat69 = u_xlat69 + 6.10351563e-05;
    u_xlat23.x = u_xlat23.x * u_xlat69 + 6.10351563e-05;
    u_xlat23.x = float(1.0) / u_xlat23.x;
    u_xlat23.x = u_xlat23.x * u_xlat70;
    u_xlat3.xyz = u_xlat12.xyz * u_xlat23.xxx;
    u_xlat3.xyz = u_xlat3.xyz * _directSpecularColor.xyz;
    u_xlat3.xyz = u_xlat15.xxx * u_xlat3.xyz;
    u_xlat16_17.xyz = u_xlat3.xyz * u_xlat16_18.xyz + u_xlat27.xyz;
    u_xlat16_75 = (-_metallicMultiplier) + 1.0;
    u_xlat16_13.xyz = vec3(u_xlat16_75) * u_xlat16_13.xyz;
    u_xlat16_19.xyz = u_xlat16_13.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat16_19.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat16_18.xyz * u_xlat16_13.xyz;
    u_xlat16_18.xyz = u_xlat16_18.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_18.xyz = u_xlat15.xxx * u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_6.xyz * u_xlat7.xxx + u_xlat16_18.xyz;
    u_xlat16_6.xyz = u_xlat16_17.xyz + u_xlat16_6.xyz;
    u_xlat16_18.xyz = (-u_xlat5.xyz) * vec3(u_xlat74) + vs_TEXCOORD4.xyz;
    u_xlat16_18.xyz = vec3(_occlusionScale) * u_xlat16_18.xyz + u_xlat8.xyz;
    u_xlat16_75 = dot(u_xlat16_18.xyz, u_xlat16_18.xyz);
    u_xlat16_75 = inversesqrt(u_xlat16_75);
    u_xlat16_18.xyz = vec3(u_xlat16_75) * u_xlat16_18.xyz;
    u_xlat16_19.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_18.xz);
    u_xlat16_19.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_18.xz);
    u_xlat16_19.y = u_xlat16_18.y;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_19.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_19.xyz = u_xlat16_19.xyz * u_xlat16_19.xyz;
    u_xlati23 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_75 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_75 + -1.0;
    u_xlat16_75 = _occlusionScale * u_xlat16_75 + 1.0;
    u_xlat16_19.xyz = vec3(u_xlat16_75) * u_xlat16_19.xyz;
    u_xlat16_20.xyz = u_xlat16_19.yyy * _IrradianceACCoeffs[u_xlati23].xyz;
    u_xlati23 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati69 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_19.xyw = u_xlat16_19.xxx * _IrradianceACCoeffs[u_xlati23].xyz + u_xlat16_20.xyz;
    u_xlat16_19.xyz = u_xlat16_19.zzz * _IrradianceACCoeffs[u_xlati69].xyz + u_xlat16_19.xyw;
    u_xlat16_20.xyz = u_xlat16_19.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_10.x = dot(u_xlat16_19.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_19.xyz = u_xlat16_13.xyz * u_xlat16_20.xyz;
    u_xlat16_56 = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_80 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_80 = (-u_xlat16_56) + u_xlat16_80;
    u_xlat16_82 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_43.z = _occlusionScale * u_xlat16_82 + 1.0;
    u_xlat16_56 = u_xlat16_43.z * u_xlat16_80 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_43.z * u_xlat16_56;
    u_xlat16_56 = u_xlat16_75 * u_xlat16_56;
    u_xlat16_80 = min(u_xlat16_56, 1.0);
    u_xlat16_82 = u_xlat16_80 * u_xlat16_80;
    u_xlat16_21.xyz = u_xlat16_13.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_21.xyz = vec3(u_xlat16_82) * u_xlat16_21.xyz;
    u_xlat16_22.xyz = u_xlat16_13.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_22.xyz = vec3(u_xlat16_82) * u_xlat16_22.xyz;
    u_xlat16_21.xyz = u_xlat16_21.xyz * vec3(u_xlat16_80) + (-u_xlat16_22.xyz);
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(u_xlat16_80) + u_xlat16_21.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * _localDiffuseGI.xyz;
    u_xlat16_6.xyz = u_xlat16_19.xyz * u_xlat16_13.xyz + u_xlat16_6.xyz;
    u_xlat16_80 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_80 = inversesqrt(u_xlat16_80);
    u_xlat16_13.xyz = vec3(u_xlat16_80) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_13.xyz + u_xlat2.xyz;
    u_xlat70 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat70 = inversesqrt(u_xlat70);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat70);
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(u_xlat16_79>=0.0);
#else
    u_xlatb70 = u_xlat16_79>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb70)) ? u_xlat0.xyw : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_11.xyz * u_xlat0.xyw;
    u_xlat1.xyz = u_xlat0.wxy * u_xlat16_11.yzx + (-u_xlat1.xyz);
    u_xlat2.xyz = u_xlat0.xyw * u_xlat1.xyz;
    u_xlat0.xyw = u_xlat1.zxy * u_xlat0.ywx + (-u_xlat2.xyz);
    u_xlat0.xyw = (-u_xlat5.xyz) * vec3(u_xlat74) + u_xlat0.xyw;
    u_xlat16_80 = u_xlat16_33.x * 8.0;
    u_xlat16_33.x = u_xlat16_33.x * u_xlat16_33.x;
    u_xlat16_33.x = max(u_xlat16_33.x, 0.0078125);
    u_xlat16_80 = min(u_xlat16_80, 1.0);
    u_xlat16_80 = abs(u_xlat16_79) * u_xlat16_80;
    u_xlat0.xyw = vec3(u_xlat16_80) * u_xlat0.xyw + u_xlat8.xyz;
    u_xlat1.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat1.xxx;
    u_xlat16_80 = dot((-u_xlat16_11.xyz), u_xlat0.xyw);
    u_xlat16_80 = u_xlat16_80 + u_xlat16_80;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_80) + (-u_xlat16_11.xyz);
    u_xlat1.x = dot(vs_TEXCOORD2.xyz, u_xlat16_11.xyz);
    u_xlat24.xyz = u_xlat5.xyz * vec3(u_xlat74) + (-u_xlat0.xyw);
    u_xlat24.xyz = u_xlat16_33.xxx * u_xlat24.xyz + u_xlat0.xyw;
    u_xlat2.xyz = u_xlat0.xyw + (-u_xlat24.xyz);
    u_xlat24.xyz = abs(vec3(u_xlat16_79)) * u_xlat2.xyz + u_xlat24.xyz;
    u_xlat16_33.x = -abs(u_xlat16_79) * 0.800000012 + 1.0;
    u_xlat16_33.x = u_xlat16_33.x * _roughnessMultiplier;
    u_xlat16_33.x = u_xlat16_33.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_33.x);
    u_xlat0.x = dot(u_xlat16_18.xyz, u_xlat0.xyw);
    u_xlat23.x = dot(u_xlat16_18.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat23.x = min(max(u_xlat23.x, 0.0), 1.0);
#else
    u_xlat23.x = clamp(u_xlat23.x, 0.0, 1.0);
#endif
    u_xlat16_43.y = u_xlat0.x * 0.5;
    u_xlat16_79 = dot(_IndirectCubemapRotationParams.xy, u_xlat24.xz);
    u_xlat24.z = dot(_IndirectCubemapRotationParams.zw, u_xlat24.xz);
    u_xlat24.x = u_xlat16_79;
    u_xlat16_2 = textureLod(_IndirectSpecularMap, u_xlat24.xyz, u_xlat16_33.x);
    u_xlat16_11.xyz = u_xlat16_2.www * u_xlat16_2.xyz;
    u_xlat24.xyz = u_xlat16_11.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_11.xyz = u_xlat24.xyz * u_xlat24.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_10.xyw = u_xlat16_10.xxx * u_xlat16_11.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyw = (bool(u_xlatb0)) ? u_xlat16_10.xyw : u_xlat16_11.xyz;
    u_xlat9.y = _roughnessMultiplier;
    u_xlat16_0.xw = texture(_DfgTexture, u_xlat9.xy).xy;
    u_xlat16_11.xyz = u_xlat16_14.xyz * u_xlat16_0.xxx + u_xlat16_0.www;
    u_xlat16_10.xyw = u_xlat16_10.xyw * u_xlat16_11.xyz;
    u_xlat16_10.xyw = u_xlat16_10.xyw * _indirectSpecularIntensityScale.xyz;
    u_xlat16_43.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_11.xyz = u_xlat16_43.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_11.xyz = min(max(u_xlat16_11.xyz, 0.0), 1.0);
#else
    u_xlat16_11.xyz = clamp(u_xlat16_11.xyz, 0.0, 1.0);
#endif
    u_xlat16_2.yzw = u_xlat16_11.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_11.x = floor(u_xlat16_2.w);
    u_xlat16_34.x = u_xlat16_11.x + 1.0;
    u_xlat16_34.x = min(u_xlat16_34.x, 15.0);
    u_xlat16_2.x = u_xlat16_34.x * 16.0 + u_xlat16_2.z;
    u_xlat16_34.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_2.x = u_xlat16_11.x * 16.0 + u_xlat16_2.z;
    u_xlat16_34.xz = u_xlat16_2.xy + vec2(0.5, 0.5);
    u_xlat16_34.xz = u_xlat16_34.xz * vec2(0.00390625, 0.0625);
    u_xlat16_69 = texture(_SpecularOcclusionLut3D, u_xlat16_34.xz).x;
    u_xlat16_11.x = u_xlat16_11.z * 15.0 + (-u_xlat16_11.x);
    u_xlat16_34.x = (-u_xlat16_69) + u_xlat16_0.x;
    u_xlat16_11.x = u_xlat16_11.x * u_xlat16_34.x + u_xlat16_69;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_11.x;
    u_xlat0.x = u_xlat23.x * u_xlat16_75;
    u_xlat16_75 = u_xlat16_56 * 0.5;
    u_xlat16_11.x = (-u_xlat16_56) * 0.5 + 1.0;
    u_xlat16_75 = u_xlat0.x * u_xlat16_11.x + u_xlat16_75;
    u_xlat16_11.x = u_xlat16_75 + u_xlat16_75;
    u_xlat16_34.x = (-u_xlat16_75) * 2.0 + 1.0;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_34.x + u_xlat16_11.x;
    u_xlat16_75 = u_xlat16_75 * u_xlat16_56;
    u_xlat16_75 = min(u_xlat16_75, 1.0);
    u_xlat16_6.xyz = u_xlat16_10.xyw * vec3(u_xlat16_75) + u_xlat16_6.xyz;
    u_xlat16_10.xyw = u_xlat16_10.xyw * vec3(u_xlat16_75) + u_xlat16_17.xyz;
    u_xlat16_75 = dot(u_xlat16_10.xyw, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_75 = u_xlat16_12.w * _albedoColor.w + u_xlat16_75;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_75 = min(max(u_xlat16_75, 0.0), 1.0);
#else
    u_xlat16_75 = clamp(u_xlat16_75, 0.0, 1.0);
#endif
    u_xlat16_10.x = u_xlat16_12.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat23.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat23.x + _emissiveBreathe.z;
    u_xlat16_2 = texture(_emissiveMap, vs_TEXCOORD3.xy);
    u_xlat16_11.xyz = u_xlat16_2.xyz * _emissiveColor.xyz;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_11.xyz;
    u_xlat16_11.xyz = u_xlat0.xyw * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_11.xyz = u_xlat0.xyw * u_xlat16_11.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_6.xyz = u_xlat0.xyw * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat16_33.x = (-_UseFlowLight2U) + 1.0;
    u_xlat16_33.xz = u_xlat16_33.xx * vs_TEXCOORD3.xy;
    u_xlat16_33.xz = vec2(_UseFlowLight2U) * vs_TEXCOORD4.xy + u_xlat16_33.xz;
    u_xlat0.xy = _Time.yy * _FlowLightFactory.yz + u_xlat16_33.xz;
    u_xlat16_24.xyz = texture(_FlowLightMask, u_xlat16_33.xz).xyz;
    u_xlat16_33.xz = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy * _FlowLightTex_ST.xy + _FlowLightTex_ST.zw;
    u_xlat0.xy = u_xlat0.xy + vec2(_Glitter_Offset);
    u_xlat16_0.xyw = texture(_FlowLightTex, u_xlat0.xy).xyz;
    u_xlat0.xyw = u_xlat16_0.xyw * _FlowLightColor.xyz;
    u_xlat0.xyw = u_xlat0.xyw * _FlowLightFactory.xxx;
    u_xlat0.xyw = u_xlat16_24.xyz * u_xlat0.xyw;
    u_xlat16_3 = texture(_FlowLightTex, u_xlat16_33.xz);
    u_xlat16_11.xyz = u_xlat16_24.xyz * u_xlat16_3.xyz;
    u_xlat16_11.xyz = u_xlat16_11.xyz * _FlowLightFactory.xxx;
    u_xlat16_11.xyz = u_xlat16_3.www * u_xlat16_11.xyz;
    u_xlat16_6.xyz = u_xlat16_11.xyz * _FlowLightColor.xyz + u_xlat16_6.xyz;
    u_xlat16_11.xyz = (-u_xlat16_6.xyz) + _FogCol.xyz;
    u_xlat16_6.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_6.xyz;
    u_xlat24.xyz = u_xlat16_6.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat24.xyz = u_xlat24.xyz * u_xlat16_6.xyz;
    u_xlat3.xyz = u_xlat16_6.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat3.xyz = u_xlat16_6.xyz * u_xlat3.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat24.xyz = u_xlat24.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat24.xyz = min(max(u_xlat24.xyz, 0.0), 1.0);
#else
    u_xlat24.xyz = clamp(u_xlat24.xyz, 0.0, 1.0);
#endif
    u_xlat24.xyz = log2(u_xlat24.xyz);
    u_xlat24.xyz = u_xlat24.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat24.xyz = exp2(u_xlat24.xyz);
    u_xlat24.xyz = u_xlat24.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat24.xyz = max(u_xlat24.xyz, vec3(0.0, 0.0, 0.0));
    u_xlat16_6.x = _GlitteryControl.x * -0.0500000007;
    u_xlat3.xy = u_xlat16_6.xx * u_xlat1.xx + vs_TEXCOORD3.xy;
    u_xlat3.xy = u_xlat3.xy + vec2(-0.5, -0.5);
    u_xlat4.x = dot(u_xlat3.xy, vec2(-0.999998748, 0.00159265287));
    u_xlat4.y = dot(u_xlat3.xy, vec2(-0.00159265287, -0.999998748));
    u_xlat3.xy = u_xlat4.xy + vec2(0.5, 0.5);
    u_xlat16_6.xy = _GlitteryControl.xx * vec2(0.5, -0.318309873) + vec2(1.0, 1.0);
    u_xlat1.x = u_xlat16_6.y * _GlitteryControl.y;
    u_xlat49.xy = u_xlat16_6.xx * vs_TEXCOORD3.xy;
    u_xlat49.xy = u_xlat49.xy * _GlitteryControl.yy;
    u_xlat16_4.xyz = texture(_GlitterMap, u_xlat49.xy).xyz;
    u_xlat3.xy = u_xlat1.xx * u_xlat3.xy;
    u_xlat16_3.xyz = texture(_GlitterMap, u_xlat3.xy).xyz;
    u_xlat16_1 = texture(_GlitterMap, vs_TEXCOORD3.xy).w;
    u_xlat3.xyz = u_xlat16_4.xyz * u_xlat16_3.xyz + vec3(u_xlat16_1);
    u_xlat3.xyz = u_xlat3.xyz + vec3(-1.0, -1.0, -1.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat3.xyz = min(max(u_xlat3.xyz, 0.0), 1.0);
#else
    u_xlat3.xyz = clamp(u_xlat3.xyz, 0.0, 1.0);
#endif
    u_xlat3.xyz = u_xlat3.xyz * _GlitteryControl.www;
    u_xlat3.xyz = log2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _GlitteryControl.zzz;
    u_xlat3.xyz = exp2(u_xlat3.xyz);
    u_xlat3.xyz = u_xlat3.xyz * _GlitterySPColor.xyz;
    u_xlat16_6.x = _GlitteryFresnelMaskPower * 32.0;
    u_xlat46 = u_xlat46 * u_xlat16_6.x;
    u_xlat46 = exp2(u_xlat46);
    u_xlat3.xyz = vec3(u_xlat46) * u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyw * u_xlat3.xyz;
    u_xlat69 = float(_LGMaskedGlitter);
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.5<u_xlat69);
#else
    u_xlatb69 = 0.5<u_xlat69;
#endif
    u_xlat0.xyz = (bool(u_xlatb69)) ? u_xlat0.xyz : u_xlat3.xyz;
    u_xlat0.xyz = u_xlat0.xyz + u_xlat24.xyz;
    u_xlat16_6.xy = (-vec2(_Sanshe_X, _Sanshe_Y)) + vec2(1.0, 1.0);
    u_xlat16_6.xy = u_xlat16_6.xy * vec2(3.1400001, 3.1400001);
    u_xlat16_11.x = sin(u_xlat16_6.x);
    u_xlat16_6.x = cos(u_xlat16_6.x);
    u_xlat16_13.x = sin(u_xlat16_6.y);
    u_xlat16_14.x = cos(u_xlat16_6.y);
    u_xlat16_6.x = u_xlat16_6.x + u_xlat16_14.x;
    u_xlat16_11.y = u_xlat16_13.x;
    u_xlat16_11.z = u_xlat16_6.x * 0.5;
    u_xlat69 = dot(u_xlat16_11.xyz, u_xlat8.xyz);
    u_xlat69 = max(u_xlat69, 0.0);
    u_xlat69 = log2(u_xlat69);
    u_xlat1.x = max(_Sanshe_Fw, 0.00999999978);
    u_xlat69 = u_xlat69 * u_xlat1.x;
    u_xlat69 = exp2(u_xlat69);
    u_xlat69 = u_xlat69 * _Sanshe_Power;
    u_xlat1.x = _Sanshe_GradientRange * 0.5 + vs_TEXCOORD0.y;
    u_xlat24.x = _Sanshe_GradientCenter + hlslcc_mtx4x4unity_ObjectToWorld[3].y;
    u_xlat1.x = (-u_xlat24.x) + u_xlat1.x;
    u_xlat1.x = u_xlat1.x / _Sanshe_GradientRange;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.x = min(max(u_xlat1.x, 0.0), 1.0);
#else
    u_xlat1.x = clamp(u_xlat1.x, 0.0, 1.0);
#endif
    u_xlat24.xyz = (-_Sanshe_color_low.xyz) + _Sanshe_color.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat24.xyz + _Sanshe_color_low.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb70 = !!(0.5<_isGradient);
#else
    u_xlatb70 = 0.5<_isGradient;
#endif
    u_xlat16_6.xyz = (bool(u_xlatb70)) ? u_xlat1.xyz : _Sanshe_color.xyz;
    u_xlat1.xyz = vec3(u_xlat69) * u_xlat16_6.xyz;
    u_xlat3.xyz = vec3(u_xlat16_56) * u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb69 = !!(0.5<_EnableVISInfluence);
#else
    u_xlatb69 = 0.5<_EnableVISInfluence;
#endif
    u_xlat1.xyz = (bool(u_xlatb69)) ? u_xlat3.xyz : u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.xyz * u_xlat16_2.www + u_xlat0.xyz;
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_75 : u_xlat16_10.x;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(4) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _anisotropicMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
ivec3 u_xlati8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
vec3 u_xlat24;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_32;
float u_xlat36;
mediump vec2 u_xlat16_36;
mediump float u_xlat16_45;
float u_xlat54;
int u_xlati54;
float u_xlat55;
bool u_xlatb55;
mediump float u_xlat16_56;
float u_xlat57;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18.x = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat18.x = u_xlat18.x * vs_TEXCOORD2.w;
    u_xlat1.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat1.y = u_xlat4.x;
    u_xlat16_36.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_2.xy = u_xlat16_36.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_56 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = sqrt(u_xlat16_56);
    u_xlat16_2.z = max(u_xlat16_56, 1.00000002e-16);
    u_xlat1.x = u_xlat3.z;
    u_xlat1.x = dot(u_xlat16_2.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat1.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat1.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat4.xyz = vec3(u_xlat36) * u_xlat1.xyz;
    u_xlat54 = dot(u_xlat3.zxy, u_xlat4.xyz);
    u_xlat3.xyz = (-u_xlat4.yzx) * vec3(u_xlat54) + u_xlat3.xyz;
    u_xlat54 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xyz;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat18.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat18.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat6.xyz = u_xlat18.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat7.xyz;
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat7.xyz = u_xlat18.xxx * u_xlat8.xyz;
    u_xlat18.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_56 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat16_9.x = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat54 = u_xlat16_56 * u_xlat16_9.x;
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat8.y = u_xlat18.x * u_xlat54;
    u_xlat16_56 = dot(u_xlat3.zxy, u_xlat7.xyz);
    u_xlat16_27 = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat18.x = (-u_xlat16_27) + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat16_9.x;
    u_xlat18.x = max(u_xlat18.x, 0.00100000005);
    u_xlat8.x = u_xlat16_56 * u_xlat18.x;
    u_xlat55 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_56 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_56) + 1.0;
    u_xlat58 = u_xlat18.x * u_xlat54;
    u_xlat8.z = u_xlat55 * u_xlat58;
    u_xlat55 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat55 = max(u_xlat55, 6.10351563e-05);
    u_xlat55 = u_xlat58 / u_xlat55;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat58 * u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat58 = dot(u_xlat6.xyz, u_xlat16_2.xyz);
    u_xlat59 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat18.x * u_xlat59;
    u_xlat7.z = u_xlat18.x * u_xlat58;
    u_xlat18.x = dot(u_xlat3.zxy, u_xlat16_2.xyz);
    u_xlat7.y = u_xlat18.x * u_xlat54;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat7.x;
    u_xlat16_56 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat54 * u_xlat16_56;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat18.z = u_xlat54 + u_xlat6.x;
    u_xlat18.xz = u_xlat18.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat18.x = u_xlat18.x * u_xlat18.z + 6.10351563e-05;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat16_56 = u_xlat57 * u_xlat57;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_45 = u_xlat57 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat57 + 1.0;
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.xyz;
    u_xlat16_11.xyz = vec3(_metallicMultiplier) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat54) * u_xlat16_11.xyz;
    u_xlat54 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat24.xyz = vec3(u_xlat54) * vec3(u_xlat16_45) + u_xlat24.xyz;
    u_xlat24.xyz = u_xlat18.xxx * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat24.xyz = u_xlat6.xxx * u_xlat24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_56 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_45 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_45);
    u_xlat16_12.xyz = u_xlat8.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_13.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat18.x = dot(u_xlat16_2.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_63);
    u_xlat16_63 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_45 = float(1.0) / float(u_xlat16_45);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_45 = u_xlat16_63 * u_xlat16_45;
    u_xlat16_45 = max(u_xlat16_13.x, u_xlat16_45);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_45;
    u_xlat16_12.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_56 = (-_metallicMultiplier) + 1.0;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat6.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = (-u_xlat1.xyz) * vec3(u_xlat36) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(_occlusionScale) * u_xlat16_13.xyz + u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_45 = (-u_xlat16_56) + u_xlat16_45;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_56 = u_xlat16_32.z * u_xlat16_45 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_32.z * u_xlat16_56;
    u_xlat16_45 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_45 + -1.0;
    u_xlat16_45 = _occlusionScale * u_xlat16_45 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_45;
    u_xlat16_63 = min(u_xlat16_56, 1.0);
    u_xlat16_64 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_15.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_64) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_63) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_45) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati18 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati54 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_64 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_12.xyz = vec3(u_xlat16_64) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_12.xyz + u_xlat5.xyz;
    u_xlat55 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat16_27>=0.0);
#else
    u_xlatb55 = u_xlat16_27>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb55)) ? u_xlat0.xyw : u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat0.xyw;
    u_xlat3.xyz = u_xlat0.wxy * u_xlat16_2.yzx + (-u_xlat3.xyz);
    u_xlat5.xyz = u_xlat0.xyw * u_xlat3.xyz;
    u_xlat0.xyw = u_xlat3.zxy * u_xlat0.ywx + (-u_xlat5.xyz);
    u_xlat0.xyw = (-u_xlat1.xyz) * vec3(u_xlat36) + u_xlat0.xyw;
    u_xlat16_64 = u_xlat16_9.x * 8.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = abs(u_xlat16_27) * u_xlat16_64;
    u_xlat0.xyw = vec3(u_xlat16_64) * u_xlat0.xyw + u_xlat4.xyz;
    u_xlat55 = dot(u_xlat16_13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat16_64 = dot((-u_xlat16_2.xyz), u_xlat0.xyw);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_64) + (-u_xlat16_2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat36) + (-u_xlat0.xyw);
    u_xlat1.xyz = u_xlat16_9.xxx * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat3.xyz = u_xlat0.xyw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_27)) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_2.x = -abs(u_xlat16_27) * 0.800000012 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _roughnessMultiplier;
    u_xlat16_2.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat0.xyw);
    u_xlat16_32.y = u_xlat0.x * 0.5;
    u_xlat16_20 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_20;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyw = vec3(u_xlat16_63) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyw : u_xlat16_2.xyz;
    u_xlat7.y = _roughnessMultiplier;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_9.xyw = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_32.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_9.xyw = u_xlat16_32.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyw = min(max(u_xlat16_9.xyw, 0.0), 1.0);
#else
    u_xlat16_9.xyw = clamp(u_xlat16_9.xyw, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_9.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_0.w);
    u_xlat16_27 = u_xlat16_9.x + 1.0;
    u_xlat16_27 = min(u_xlat16_27, 15.0);
    u_xlat16_0.x = u_xlat16_27 * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_9.x * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_9.x = u_xlat16_9.w * 15.0 + (-u_xlat16_9.x);
    u_xlat16_27 = (-u_xlat16_19.x) + u_xlat16_1;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_27 + u_xlat16_19.x;
    u_xlat16_9.x = u_xlat16_45 * u_xlat16_9.x;
    u_xlat1.x = u_xlat55 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_56 * 0.5;
    u_xlat16_27 = (-u_xlat16_56) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat1.x * u_xlat16_27 + u_xlat16_9.x;
    u_xlat16_27 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_45 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_45 + u_xlat16_27;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_9.x;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_9.xyz = u_xlat16_2.xyz * vec3(u_xlat16_56) + u_xlat16_10.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_8.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat19 = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = abs(u_xlat1.x) * u_xlat19 + _emissiveBreathe.z;
    u_xlat16_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_19.xyz * _emissiveColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_9.xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat3.xyz = u_xlat16_9.xyz * u_xlat3.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat1.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_20;
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
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(4) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(5) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(6) uniform mediump sampler2D _anisotropicMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
vec3 u_xlat1;
mediump float u_xlat16_1;
bool u_xlatb1;
mediump vec3 u_xlat16_2;
vec3 u_xlat3;
vec3 u_xlat4;
vec3 u_xlat5;
vec3 u_xlat6;
vec3 u_xlat7;
vec3 u_xlat8;
mediump vec4 u_xlat16_8;
ivec3 u_xlati8;
mediump vec4 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec3 u_xlat16_15;
mediump vec4 u_xlat16_16;
mediump vec3 u_xlat16_17;
vec3 u_xlat18;
int u_xlati18;
bool u_xlatb18;
float u_xlat19;
mediump vec3 u_xlat16_19;
mediump float u_xlat16_20;
vec3 u_xlat24;
mediump float u_xlat16_27;
mediump vec3 u_xlat16_32;
float u_xlat36;
mediump vec2 u_xlat16_36;
mediump float u_xlat16_45;
float u_xlat54;
int u_xlati54;
float u_xlat55;
bool u_xlatb55;
mediump float u_xlat16_56;
float u_xlat57;
float u_xlat58;
float u_xlat59;
mediump float u_xlat16_63;
mediump float u_xlat16_64;
int int_bitfieldInsert(int base, int insert, int offset, int bits) {
    uint mask = ~(uint(0xffffffff) << uint(bits)) << uint(offset);
    return int((uint(base) & ~mask) | ((uint(insert) << uint(offset)) & mask));
}

void main()
{
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb18 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat18.x = (u_xlatb18) ? 1.0 : -1.0;
    u_xlat18.x = u_xlat18.x * vs_TEXCOORD2.w;
    u_xlat1.z = vs_TEXCOORD1.x;
    u_xlat16_2.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_2.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_2.xxx + vs_TEXCOORD2.yzx;
    u_xlat36 = dot(u_xlat16_2.xyz, u_xlat16_2.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat3.xyz = vec3(u_xlat36) * u_xlat16_2.xyz;
    u_xlat4.xyz = u_xlat3.xyz * vs_TEXCOORD1.zxy;
    u_xlat4.xyz = vs_TEXCOORD1.yzx * u_xlat3.yzx + (-u_xlat4.xyz);
    u_xlat4.xyz = u_xlat4.xzy * vs_TEXCOORD2.www;
    u_xlat1.y = u_xlat4.x;
    u_xlat16_36.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_2.xy = u_xlat16_36.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_56 = dot(u_xlat16_2.xy, u_xlat16_2.xy);
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_56 = (-u_xlat16_56) + 1.0;
    u_xlat16_56 = sqrt(u_xlat16_56);
    u_xlat16_2.z = max(u_xlat16_56, 1.00000002e-16);
    u_xlat1.x = u_xlat3.z;
    u_xlat1.x = dot(u_xlat16_2.xyz, u_xlat1.xyz);
    u_xlat5.x = u_xlat3.x;
    u_xlat5.y = u_xlat4.z;
    u_xlat5.z = vs_TEXCOORD1.y;
    u_xlat1.y = dot(u_xlat16_2.xyz, u_xlat5.xyz);
    u_xlat4.x = u_xlat3.y;
    u_xlat4.z = vs_TEXCOORD1.z;
    u_xlat1.z = dot(u_xlat16_2.xyz, u_xlat4.xyz);
    u_xlat36 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat36 = max(u_xlat36, 1.17549435e-38);
    u_xlat36 = inversesqrt(u_xlat36);
    u_xlat4.xyz = vec3(u_xlat36) * u_xlat1.xyz;
    u_xlat54 = dot(u_xlat3.zxy, u_xlat4.xyz);
    u_xlat3.xyz = (-u_xlat4.yzx) * vec3(u_xlat54) + u_xlat3.xyz;
    u_xlat54 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat54 = inversesqrt(u_xlat54);
    u_xlat3.xyz = vec3(u_xlat54) * u_xlat3.xyz;
    u_xlat5.xyz = u_xlat3.yzx * u_xlat4.xyz;
    u_xlat5.xyz = u_xlat4.zxy * u_xlat3.zxy + (-u_xlat5.xyz);
    u_xlat5.xyz = u_xlat18.xxx * u_xlat5.xyz;
    u_xlat6.xyz = u_xlat0.xxx * u_xlat4.xyz + u_xlat5.zxy;
    u_xlat18.x = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat6.xyz = u_xlat18.xxx * u_xlat6.xyz;
    u_xlat7.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_2.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat16_2.x = inversesqrt(u_xlat16_2.x);
    u_xlat8.xyz = u_xlat7.xyz * u_xlat16_2.xxx + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xxx * u_xlat7.xyz;
    u_xlat18.x = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat18.x = inversesqrt(u_xlat18.x);
    u_xlat7.xyz = u_xlat18.xxx * u_xlat8.xyz;
    u_xlat18.x = dot(u_xlat6.xyz, u_xlat7.xyz);
    u_xlat16_56 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat16_9.x = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat54 = u_xlat16_56 * u_xlat16_9.x;
    u_xlat54 = max(u_xlat54, 0.00100000005);
    u_xlat8.y = u_xlat18.x * u_xlat54;
    u_xlat16_56 = dot(u_xlat3.zxy, u_xlat7.xyz);
    u_xlat16_27 = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat18.x = (-u_xlat16_27) + 1.0;
    u_xlat18.x = u_xlat18.x * u_xlat16_9.x;
    u_xlat18.x = max(u_xlat18.x, 0.00100000005);
    u_xlat8.x = u_xlat16_56 * u_xlat18.x;
    u_xlat55 = dot(u_xlat4.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat16_56 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat7.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat57 = (-u_xlat16_56) + 1.0;
    u_xlat58 = u_xlat18.x * u_xlat54;
    u_xlat8.z = u_xlat55 * u_xlat58;
    u_xlat55 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat55 = max(u_xlat55, 6.10351563e-05);
    u_xlat55 = u_xlat58 / u_xlat55;
    u_xlat58 = u_xlat58 * 0.318309873;
    u_xlat55 = u_xlat55 * u_xlat55;
    u_xlat55 = u_xlat58 * u_xlat55;
    u_xlat55 = min(u_xlat55, 16.0);
    u_xlat58 = dot(u_xlat6.xyz, u_xlat16_2.xyz);
    u_xlat59 = dot(u_xlat6.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.z = u_xlat18.x * u_xlat59;
    u_xlat7.z = u_xlat18.x * u_xlat58;
    u_xlat18.x = dot(u_xlat3.zxy, u_xlat16_2.xyz);
    u_xlat7.y = u_xlat18.x * u_xlat54;
    u_xlat7.x = dot(u_xlat4.xyz, u_xlat16_2.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat7.x = min(max(u_xlat7.x, 0.0), 1.0);
#else
    u_xlat7.x = clamp(u_xlat7.x, 0.0, 1.0);
#endif
    u_xlat18.x = dot(u_xlat7.xyz, u_xlat7.xyz);
    u_xlat18.x = sqrt(u_xlat18.x);
    u_xlat18.x = u_xlat18.x + u_xlat7.x;
    u_xlat16_56 = dot(u_xlat3.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat6.y = u_xlat54 * u_xlat16_56;
    u_xlat6.x = dot(u_xlat4.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat6.x = min(max(u_xlat6.x, 0.0), 1.0);
#else
    u_xlat6.x = clamp(u_xlat6.x, 0.0, 1.0);
#endif
    u_xlat54 = dot(u_xlat6.xyz, u_xlat6.xyz);
    u_xlat54 = sqrt(u_xlat54);
    u_xlat18.z = u_xlat54 + u_xlat6.x;
    u_xlat18.xz = u_xlat18.xz + vec2(6.10351563e-05, 6.10351563e-05);
    u_xlat18.x = u_xlat18.x * u_xlat18.z + 6.10351563e-05;
    u_xlat18.x = float(1.0) / u_xlat18.x;
    u_xlat18.x = u_xlat18.x * u_xlat55;
    u_xlat16_56 = u_xlat57 * u_xlat57;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_56 = u_xlat57 * u_xlat16_56;
    u_xlat16_45 = u_xlat57 * u_xlat16_56;
    u_xlat54 = (-u_xlat16_56) * u_xlat57 + 1.0;
    u_xlat16_8 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_10.xyz = u_xlat16_8.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat16_8.xyz * u_xlat16_10.xyz;
    u_xlat16_11.xyz = u_xlat16_10.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_10.xyz = u_xlat16_10.xyz * _albedoColor.xyz;
    u_xlat16_11.xyz = vec3(_metallicMultiplier) * u_xlat16_11.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat24.xyz = vec3(u_xlat54) * u_xlat16_11.xyz;
    u_xlat54 = u_xlat16_11.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat54 = min(max(u_xlat54, 0.0), 1.0);
#else
    u_xlat54 = clamp(u_xlat54, 0.0, 1.0);
#endif
    u_xlat24.xyz = vec3(u_xlat54) * vec3(u_xlat16_45) + u_xlat24.xyz;
    u_xlat24.xyz = u_xlat18.xxx * u_xlat24.xyz;
    u_xlat24.xyz = u_xlat24.xyz * _directSpecularColor.xyz;
    u_xlat24.xyz = u_xlat6.xxx * u_xlat24.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb18 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_56 = (u_xlatb18) ? 1.0 : 0.0;
    u_xlat8.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_45 = dot(u_xlat8.xyz, u_xlat8.xyz);
    u_xlat16_45 = max(u_xlat16_45, 6.10351563e-05);
    u_xlat16_63 = inversesqrt(u_xlat16_45);
    u_xlat16_12.xyz = u_xlat8.xyz * vec3(u_xlat16_63);
    u_xlat16_63 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb18 = !!(0.00100000005>=abs(u_xlat16_63));
#else
    u_xlatb18 = 0.00100000005>=abs(u_xlat16_63);
#endif
    u_xlat16_13.xy = (bool(u_xlatb18)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_14.xyz = u_xlat16_13.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_13.yyy + u_xlat16_14.xyz;
    u_xlat16_63 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_12.xyz);
    u_xlat18.x = dot(u_xlat16_2.xyz, u_xlat16_12.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat18.x = min(max(u_xlat18.x, 0.0), 1.0);
#else
    u_xlat18.x = clamp(u_xlat18.x, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_56 = max(u_xlat16_56, u_xlat16_63);
    u_xlat16_63 = u_xlat16_45 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_45 = float(1.0) / float(u_xlat16_45);
    u_xlat16_63 = (-u_xlat16_63) * u_xlat16_63 + 1.0;
    u_xlat16_63 = max(u_xlat16_63, 0.0);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_45 = u_xlat16_63 * u_xlat16_45;
    u_xlat16_45 = max(u_xlat16_13.x, u_xlat16_45);
    u_xlat16_56 = u_xlat16_56 * u_xlat16_45;
    u_xlat16_12.xyz = vec3(u_xlat16_56) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_56 = (-_metallicMultiplier) + 1.0;
    u_xlat16_10.xyz = vec3(u_xlat16_56) * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat16_10.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat18.xxx * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_10.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_13.xyz = u_xlat16_13.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat6.xxx + u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_12.xyz;
    u_xlat16_13.xyz = (-u_xlat1.xyz) * vec3(u_xlat36) + vs_TEXCOORD4.xyz;
    u_xlat16_13.xyz = vec3(_occlusionScale) * u_xlat16_13.xyz + u_xlat4.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat16_13.xyz);
    u_xlat16_56 = inversesqrt(u_xlat16_56);
    u_xlat16_13.xyz = vec3(u_xlat16_56) * u_xlat16_13.xyz;
    u_xlat16_56 = dot(u_xlat16_13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_56 = min(max(u_xlat16_56, 0.0), 1.0);
#else
    u_xlat16_56 = clamp(u_xlat16_56, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_56 * 0.5 + 0.5;
    u_xlat16_45 = (-u_xlat16_56) + u_xlat16_45;
    u_xlat16_63 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_32.z = _occlusionScale * u_xlat16_63 + 1.0;
    u_xlat16_56 = u_xlat16_32.z * u_xlat16_45 + u_xlat16_56;
    u_xlat16_56 = u_xlat16_32.z * u_xlat16_56;
    u_xlat16_45 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_45 = min(max(u_xlat16_45, 0.0), 1.0);
#else
    u_xlat16_45 = clamp(u_xlat16_45, 0.0, 1.0);
#endif
    u_xlat16_45 = u_xlat16_45 + -1.0;
    u_xlat16_45 = _occlusionScale * u_xlat16_45 + 1.0;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_45;
    u_xlat16_63 = min(u_xlat16_56, 1.0);
    u_xlat16_64 = u_xlat16_63 * u_xlat16_63;
    u_xlat16_15.xyz = u_xlat16_10.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_15.xyz = vec3(u_xlat16_64) * u_xlat16_15.xyz;
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_16.xyz = vec3(u_xlat16_64) * u_xlat16_16.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * vec3(u_xlat16_63) + (-u_xlat16_16.xyz);
    u_xlat16_16.xyz = u_xlat16_10.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_15.xyz = u_xlat16_16.xyz * vec3(u_xlat16_63) + u_xlat16_15.xyz;
    u_xlat16_15.xyz = u_xlat16_15.xyz * _localDiffuseGI.xyz;
    u_xlat16_16.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_13.xz);
    u_xlat16_16.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_13.xz);
    u_xlat16_16.y = u_xlat16_13.y;
    u_xlat16_17.xyz = u_xlat16_16.xyz * u_xlat16_16.xyz;
    u_xlati8.xyz = ivec3(uvec3(lessThan(u_xlat16_16.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_16.xyz = vec3(u_xlat16_45) * u_xlat16_17.xyz;
    u_xlati18 = int(int_bitfieldInsert(2,u_xlati8.y,0,1) );
    u_xlat16_17.xyz = u_xlat16_16.yyy * _IrradianceACCoeffs[u_xlati18].xyz;
    u_xlati18 = int(uint(uint(u_xlati8.x) & 1u));
    u_xlati54 = (u_xlati8.z != 0) ? 5 : 4;
    u_xlat16_16.xyw = u_xlat16_16.xxx * _IrradianceACCoeffs[u_xlati18].xyz + u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.zzz * _IrradianceACCoeffs[u_xlati54].xyz + u_xlat16_16.xyw;
    u_xlat16_17.xyz = u_xlat16_16.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_63 = dot(u_xlat16_16.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_17.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_15.xyz + u_xlat16_12.xyz;
    u_xlat16_64 = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_64 = inversesqrt(u_xlat16_64);
    u_xlat16_12.xyz = vec3(u_xlat16_64) * vs_TEXCOORD1.yzx;
    u_xlat0.xyw = u_xlat0.xxx * u_xlat16_12.xyz + u_xlat5.xyz;
    u_xlat55 = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat55 = inversesqrt(u_xlat55);
    u_xlat0.xyw = u_xlat0.xyw * vec3(u_xlat55);
#ifdef UNITY_ADRENO_ES3
    u_xlatb55 = !!(u_xlat16_27>=0.0);
#else
    u_xlatb55 = u_xlat16_27>=0.0;
#endif
    u_xlat0.xyw = (bool(u_xlatb55)) ? u_xlat0.xyw : u_xlat3.xyz;
    u_xlat3.xyz = u_xlat16_2.xyz * u_xlat0.xyw;
    u_xlat3.xyz = u_xlat0.wxy * u_xlat16_2.yzx + (-u_xlat3.xyz);
    u_xlat5.xyz = u_xlat0.xyw * u_xlat3.xyz;
    u_xlat0.xyw = u_xlat3.zxy * u_xlat0.ywx + (-u_xlat5.xyz);
    u_xlat0.xyw = (-u_xlat1.xyz) * vec3(u_xlat36) + u_xlat0.xyw;
    u_xlat16_64 = u_xlat16_9.x * 8.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_9.x;
    u_xlat16_9.x = max(u_xlat16_9.x, 0.0078125);
    u_xlat16_64 = min(u_xlat16_64, 1.0);
    u_xlat16_64 = abs(u_xlat16_27) * u_xlat16_64;
    u_xlat0.xyw = vec3(u_xlat16_64) * u_xlat0.xyw + u_xlat4.xyz;
    u_xlat55 = dot(u_xlat16_13.xyz, u_xlat4.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat55 = min(max(u_xlat55, 0.0), 1.0);
#else
    u_xlat55 = clamp(u_xlat55, 0.0, 1.0);
#endif
    u_xlat3.x = dot(u_xlat0.xyw, u_xlat0.xyw);
    u_xlat3.x = inversesqrt(u_xlat3.x);
    u_xlat0.xyw = u_xlat0.xyw * u_xlat3.xxx;
    u_xlat16_64 = dot((-u_xlat16_2.xyz), u_xlat0.xyw);
    u_xlat16_64 = u_xlat16_64 + u_xlat16_64;
    u_xlat0.xyw = (-u_xlat0.xyw) * vec3(u_xlat16_64) + (-u_xlat16_2.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(u_xlat36) + (-u_xlat0.xyw);
    u_xlat1.xyz = u_xlat16_9.xxx * u_xlat1.xyz + u_xlat0.xyw;
    u_xlat3.xyz = u_xlat0.xyw + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(vec3(u_xlat16_27)) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_2.x = -abs(u_xlat16_27) * 0.800000012 + 1.0;
    u_xlat16_2.x = u_xlat16_2.x * _roughnessMultiplier;
    u_xlat16_2.x = u_xlat16_2.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_2.x);
    u_xlat0.x = dot(u_xlat16_13.xyz, u_xlat0.xyw);
    u_xlat16_32.y = u_xlat0.x * 0.5;
    u_xlat16_20 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_20;
    u_xlat16_0 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_2.x);
    u_xlat16_2.xyz = u_xlat16_0.www * u_xlat16_0.xyz;
    u_xlat0.xyz = u_xlat16_2.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_2.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_2.xyz = u_xlat16_2.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_9.xyw = vec3(u_xlat16_63) * u_xlat16_2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_2.xyz = (bool(u_xlatb0)) ? u_xlat16_9.xyw : u_xlat16_2.xyz;
    u_xlat7.y = _roughnessMultiplier;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat7.xy).xy;
    u_xlat16_9.xyw = u_xlat16_11.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_2.xyz = u_xlat16_2.xyz * u_xlat16_9.xyw;
    u_xlat16_2.xyz = u_xlat16_2.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_32.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_9.xyw = u_xlat16_32.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_9.xyw = min(max(u_xlat16_9.xyw, 0.0), 1.0);
#else
    u_xlat16_9.xyw = clamp(u_xlat16_9.xyw, 0.0, 1.0);
#endif
    u_xlat16_0.yzw = u_xlat16_9.yxw * vec3(15.0, 15.0, 15.0);
    u_xlat16_9.x = floor(u_xlat16_0.w);
    u_xlat16_27 = u_xlat16_9.x + 1.0;
    u_xlat16_27 = min(u_xlat16_27, 15.0);
    u_xlat16_0.x = u_xlat16_27 * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_1 = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_0.x = u_xlat16_9.x * 16.0 + u_xlat16_0.z;
    u_xlat16_11.xy = u_xlat16_0.xy + vec2(0.5, 0.5);
    u_xlat16_11.xy = u_xlat16_11.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_11.xy).x;
    u_xlat16_9.x = u_xlat16_9.w * 15.0 + (-u_xlat16_9.x);
    u_xlat16_27 = (-u_xlat16_19.x) + u_xlat16_1;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_27 + u_xlat16_19.x;
    u_xlat16_9.x = u_xlat16_45 * u_xlat16_9.x;
    u_xlat1.x = u_xlat55 * u_xlat16_9.x;
    u_xlat16_9.x = u_xlat16_56 * 0.5;
    u_xlat16_27 = (-u_xlat16_56) * 0.5 + 1.0;
    u_xlat16_9.x = u_xlat1.x * u_xlat16_27 + u_xlat16_9.x;
    u_xlat16_27 = u_xlat16_9.x + u_xlat16_9.x;
    u_xlat16_45 = (-u_xlat16_9.x) * 2.0 + 1.0;
    u_xlat16_9.x = u_xlat16_9.x * u_xlat16_45 + u_xlat16_27;
    u_xlat16_56 = u_xlat16_56 * u_xlat16_9.x;
    u_xlat16_56 = min(u_xlat16_56, 1.0);
    u_xlat16_9.xyz = u_xlat16_2.xyz * vec3(u_xlat16_56) + u_xlat16_10.xyz;
    u_xlat16_2.xyz = vec3(u_xlat16_56) * u_xlat16_2.xyz;
    u_xlat16_2.xyz = u_xlat24.xyz * _MainLightIntensityAndAngleScale.xyz + u_xlat16_2.xyz;
    u_xlat16_2.x = dot(u_xlat16_2.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_2.x = u_xlat16_8.w * _albedoColor.w + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_2.x = min(max(u_xlat16_2.x, 0.0), 1.0);
#else
    u_xlat16_2.x = clamp(u_xlat16_2.x, 0.0, 1.0);
#endif
    u_xlat16_20 = u_xlat16_8.w * _albedoColor.w;
    u_xlat1.x = _emissiveBreathe.y * _Time.y;
    u_xlat1.x = sin(u_xlat1.x);
    u_xlat19 = (-_emissiveBreathe.z) + 1.0;
    u_xlat1.x = abs(u_xlat1.x) * u_xlat19 + _emissiveBreathe.z;
    u_xlat16_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_19.xyz * _emissiveColor.xyz;
    u_xlat1.xyz = u_xlat1.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat1.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat1.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_9.xyz = u_xlat1.xyz * u_xlat16_10.xyz + u_xlat16_9.xyz;
    u_xlat16_10.xyz = (-u_xlat16_9.xyz) + _FogCol.xyz;
    u_xlat16_9.xyz = vs_TEXCOORD0.www * u_xlat16_10.xyz + u_xlat16_9.xyz;
    u_xlat1.xyz = u_xlat16_9.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat1.xyz = u_xlat1.xyz * u_xlat16_9.xyz;
    u_xlat3.xyz = u_xlat16_9.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat3.xyz = u_xlat16_9.xyz * u_xlat3.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat1.xyz = u_xlat1.xyz / u_xlat3.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat1.xyz = min(max(u_xlat1.xyz, 0.0), 1.0);
#else
    u_xlat1.xyz = clamp(u_xlat1.xyz, 0.0, 1.0);
#endif
    u_xlat1.xyz = log2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat1.xyz = exp2(u_xlat1.xyz);
    u_xlat1.xyz = u_xlat1.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat1.xyz = max(u_xlat1.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat1.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb1 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb1 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb1) ? u_xlat16_2.x : u_xlat16_20;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
int u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
float u_xlat20;
vec3 u_xlat21;
float u_xlat22;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat38;
float u_xlat41;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
int u_xlati58;
bool u_xlatb58;
float u_xlat59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
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
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_63 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = sqrt(u_xlat16_63);
    u_xlat16_6.z = max(u_xlat16_63, 1.00000002e-16);
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat23.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat8.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat38 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat1.xyz = (-u_xlat8.yzx) * vec3(u_xlat38) + u_xlat7.xyz;
    u_xlat38 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat1.xyz = vec3(u_xlat38) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.zxy * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat19.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat19.zxy;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * vec3(u_xlat16_63);
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat3.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat16_63 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat16_67 = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_67 = max(u_xlat16_67, 0.0078125);
    u_xlat59 = u_xlat16_63 * u_xlat16_67;
    u_xlat59 = max(u_xlat59, 0.00100000005);
    u_xlat4.y = u_xlat58 * u_xlat59;
    u_xlat16_63 = dot(u_xlat1.zxy, u_xlat3.xyz);
    u_xlat16_11.x = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat58 = (-u_xlat16_11.x) + 1.0;
    u_xlat58 = u_xlat58 * u_xlat16_67;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat4.x = u_xlat16_63 * u_xlat58;
    u_xlat60 = dot(u_xlat8.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_63) + 1.0;
    u_xlat22 = u_xlat58 * u_xlat59;
    u_xlat4.z = u_xlat60 * u_xlat22;
    u_xlat41 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41 = max(u_xlat41, 6.10351563e-05);
    u_xlat41 = u_xlat22 / u_xlat41;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat22 = u_xlat22 * u_xlat41;
    u_xlat22 = min(u_xlat22, 16.0);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat16_10.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat2.z = u_xlat58 * u_xlat2.x;
    u_xlat4.z = u_xlat58 * u_xlat41;
    u_xlat58 = dot(u_xlat1.zxy, u_xlat16_10.xyz);
    u_xlat4.y = u_xlat58 * u_xlat59;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat4.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat16_63 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat2.y = u_xlat59 * u_xlat16_63;
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat2.x;
    u_xlat21.x = u_xlat21.x + 6.10351563e-05;
    u_xlat58 = u_xlat58 * u_xlat21.x + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat22;
    u_xlat16_63 = u_xlat3.x * u_xlat3.x;
    u_xlat16_63 = u_xlat3.x * u_xlat16_63;
    u_xlat16_63 = u_xlat3.x * u_xlat16_63;
    u_xlat16_30.x = u_xlat3.x * u_xlat16_63;
    u_xlat21.x = (-u_xlat16_63) * u_xlat3.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * _albedoColor.xyz;
    u_xlat16_13.xyz = vec3(_metallicMultiplier) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_13.xyz;
    u_xlat3.x = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat3.xxx * u_xlat16_30.xxx + u_xlat21.xyz;
    u_xlat21.xyz = vec3(u_xlat58) * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_63 = (-_metallicMultiplier) + 1.0;
    u_xlat16_30.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_30.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_69);
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_15.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_70);
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_15.x, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_69;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_30.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat2.xxx + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat21.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat8.xyz;
    u_xlat16_63 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
    u_xlat16_63 = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_63) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_69 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_63;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_69;
    u_xlat16_70 = min(u_xlat16_63, 1.0);
    u_xlat16_71 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_16.xyz = u_xlat16_30.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat16_71) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_70) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_30.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_70) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati2 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati2].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_18.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_12.xyz + u_xlat19.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_11.x>=0.0);
#else
    u_xlatb57 = u_xlat16_11.x>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb57)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.zxy * u_xlat16_10.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.zxy * u_xlat0.yzx + (-u_xlat3.xyz);
    u_xlat0.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + u_xlat0.xyz;
    u_xlat16_12.x = u_xlat16_67 * 8.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = max(u_xlat16_67, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_11.x) * u_xlat16_12.x;
    u_xlat0.xyz = u_xlat16_12.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat57 = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat16_12.x = dot((-u_xlat16_10.xyz), u_xlat0.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_12.xxx + (-u_xlat16_10.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat16_67) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(u_xlat16_11.xxx) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_10.x = -abs(u_xlat16_11.x) * 0.800000012 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * _roughnessMultiplier;
    u_xlat16_10.x = u_xlat16_10.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_10.x);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat0.xyz);
    u_xlat16_34.y = u_xlat0.x * 0.5;
    u_xlat16_29 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_29;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_10.x);
    u_xlat16_10.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = vec3(u_xlat16_70) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_10.xyz;
    u_xlat4.y = _roughnessMultiplier;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_34.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_12.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_67 = floor(u_xlat16_1.w);
    u_xlat16_11.x = u_xlat16_67 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_1.x = u_xlat16_11.x * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_1.x = u_xlat16_67 * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_67 = u_xlat16_12.z * 15.0 + (-u_xlat16_67);
    u_xlat16_11.x = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_11.x + u_xlat16_19.x;
    u_xlat16_67 = u_xlat16_69 * u_xlat16_67;
    u_xlat0.x = u_xlat57 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_63 * 0.5;
    u_xlat16_11.x = (-u_xlat16_63) * 0.5 + 1.0;
    u_xlat16_67 = u_xlat0.x * u_xlat16_11.x + u_xlat16_67;
    u_xlat16_11.x = u_xlat16_67 + u_xlat16_67;
    u_xlat16_12.x = (-u_xlat16_67) * 2.0 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_12.x + u_xlat16_11.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(u_xlat16_63) + u_xlat16_30.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat21.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_3.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_3.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat19.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat19.x + _emissiveBreathe.z;
    u_xlat16_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_19.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_10.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_25;
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
uniform 	vec4 hlslcc_mtx4x4customShadowProjM[4];
uniform 	vec4 hlslcc_mtx4x4customShadowViewM[4];
uniform 	mediump vec4 _ShadowBias;
uniform 	vec4 _ShadowMapTexture_TexelSize;
uniform 	mediump vec4 _indirectSpecularIntensityScale;
uniform 	mediump vec4 _localDiffuseGI;
uniform 	mediump float _specularAlphaMode;
uniform 	mediump vec4 _albedoColor;
uniform 	mediump vec4 _emissiveColor;
uniform 	mediump vec4 _emissiveBreathe;
uniform 	mediump vec4 _directSpecularColor;
uniform 	mediump vec4 _anisotropicMap_ST;
uniform 	mediump float _anisoUse2U;
uniform 	mediump float _sunShift;
uniform 	mediump float _sunShiftOffset;
uniform 	mediump float _anisotropicMultiplier;
uniform 	mediump float _occlusionScale;
uniform 	mediump float _shadowStrength;
uniform 	mediump vec4 _shadowColor;
uniform 	mediump float _metallicMultiplier;
uniform 	mediump float _roughnessMultiplier;
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
UNITY_LOCATION(6) uniform mediump sampler2D _emissiveMap;
UNITY_LOCATION(7) uniform mediump sampler2D _normalMap;
UNITY_LOCATION(8) uniform mediump sampler2D _anisotropicMap;
in highp vec4 vs_TEXCOORD0;
in mediump vec4 vs_TEXCOORD1;
in mediump vec4 vs_TEXCOORD2;
in mediump vec4 vs_TEXCOORD3;
in mediump vec4 vs_TEXCOORD4;
in mediump float vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec2 u_xlat16_0;
bool u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
vec4 u_xlat2;
int u_xlati2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
ivec3 u_xlati3;
vec3 u_xlat4;
bool u_xlatb4;
vec3 u_xlat5;
mediump vec3 u_xlat16_6;
vec3 u_xlat7;
vec3 u_xlat8;
vec3 u_xlat9;
mediump vec2 u_xlat16_9;
mediump vec3 u_xlat16_10;
mediump vec3 u_xlat16_11;
mediump vec3 u_xlat16_12;
mediump vec3 u_xlat16_13;
mediump vec3 u_xlat16_14;
mediump vec2 u_xlat16_15;
mediump vec3 u_xlat16_16;
mediump vec4 u_xlat16_17;
mediump vec3 u_xlat16_18;
vec3 u_xlat19;
mediump vec3 u_xlat16_19;
bool u_xlatb19;
float u_xlat20;
vec3 u_xlat21;
float u_xlat22;
vec3 u_xlat23;
mediump float u_xlat16_25;
mediump float u_xlat16_29;
mediump vec3 u_xlat16_30;
mediump vec3 u_xlat16_34;
float u_xlat38;
float u_xlat41;
float u_xlat57;
bool u_xlatb57;
float u_xlat58;
int u_xlati58;
bool u_xlatb58;
float u_xlat59;
float u_xlat60;
float u_xlat62;
mediump float u_xlat16_63;
mediump float u_xlat16_67;
mediump float u_xlat16_69;
mediump float u_xlat16_70;
mediump float u_xlat16_71;
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
    u_xlat23.xyz = (-vs_TEXCOORD0.xyz) + _MainLightPositionAndFalloff.xyz;
    u_xlat5.x = dot(u_xlat23.xyz, u_xlat23.xyz);
    u_xlat5.x = inversesqrt(u_xlat5.x);
    u_xlat23.xyz = u_xlat23.xyz * u_xlat5.xxx;
    u_xlat5.z = vs_TEXCOORD1.x;
    u_xlat16_6.x = dot(vs_TEXCOORD2.xyz, vs_TEXCOORD1.xyz);
    u_xlat16_6.xyz = (-vs_TEXCOORD1.yzx) * u_xlat16_6.xxx + vs_TEXCOORD2.yzx;
    u_xlat62 = dot(u_xlat16_6.xyz, u_xlat16_6.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat7.xyz = vec3(u_xlat62) * u_xlat16_6.xyz;
    u_xlat8.xyz = u_xlat7.xyz * vs_TEXCOORD1.zxy;
    u_xlat8.xyz = vs_TEXCOORD1.yzx * u_xlat7.yzx + (-u_xlat8.xyz);
    u_xlat8.xyz = u_xlat8.xzy * vs_TEXCOORD2.www;
    u_xlat5.y = u_xlat8.x;
    u_xlat16_9.xy = texture(_normalMap, vs_TEXCOORD3.xy).xw;
    u_xlat16_6.xy = u_xlat16_9.xy * vec2(2.0, 2.0) + vec2(-1.0, -1.0);
    u_xlat16_63 = dot(u_xlat16_6.xy, u_xlat16_6.xy);
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_63 = (-u_xlat16_63) + 1.0;
    u_xlat16_63 = sqrt(u_xlat16_63);
    u_xlat16_6.z = max(u_xlat16_63, 1.00000002e-16);
    u_xlat5.x = u_xlat7.z;
    u_xlat5.x = dot(u_xlat16_6.xyz, u_xlat5.xyz);
    u_xlat9.x = u_xlat7.x;
    u_xlat9.y = u_xlat8.z;
    u_xlat9.z = vs_TEXCOORD1.y;
    u_xlat5.y = dot(u_xlat16_6.xyz, u_xlat9.xyz);
    u_xlat8.x = u_xlat7.y;
    u_xlat8.z = vs_TEXCOORD1.z;
    u_xlat5.z = dot(u_xlat16_6.xyz, u_xlat8.xyz);
    u_xlat62 = dot(u_xlat5.xyz, u_xlat5.xyz);
    u_xlat62 = max(u_xlat62, 1.17549435e-38);
    u_xlat62 = inversesqrt(u_xlat62);
    u_xlat8.xyz = vec3(u_xlat62) * u_xlat5.xyz;
    u_xlat23.x = dot(u_xlat8.xyz, u_xlat23.xyz);
    u_xlat23.x = (-u_xlat23.x) * u_xlat23.x + 1.0;
    u_xlat23.x = sqrt(u_xlat23.x);
    u_xlat23.x = u_xlat23.x * _ShadowBias.z;
    u_xlat23.xyz = (-u_xlat8.xyz) * u_xlat23.xxx + vs_TEXCOORD0.xyz;
    u_xlat4.xyz = (bool(u_xlatb4)) ? u_xlat23.xyz : vs_TEXCOORD0.xyz;
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
    u_xlat20 = max((-u_xlat0.w), u_xlat1.x);
    u_xlat20 = (-u_xlat1.x) + u_xlat20;
    u_xlat0.z = _ShadowBias.y * u_xlat20 + u_xlat1.x;
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
    u_xlat19.x = (-u_xlat16_6.x) + 1.0;
    u_xlat0.x = u_xlat0.x * u_xlat19.x + u_xlat16_6.x;
    u_xlat0.x = (-u_xlat0.x) + 1.0;
    u_xlat0.x = (-u_xlat0.x) * _shadowStrength + 1.0;
    u_xlat0.x = max(u_xlat0.x, 0.0);
    u_xlat16_6.xyz = _shadowColor.xyz * _shadowColor.www;
    u_xlat16_10.xyz = (-_shadowColor.www) * _shadowColor.xyz + vec3(1.0, 1.0, 1.0);
    u_xlat16_6.xyz = u_xlat0.xxx * u_xlat16_10.xyz + u_xlat16_6.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.5<_anisoUse2U);
#else
    u_xlatb0 = 0.5<_anisoUse2U;
#endif
    u_xlat0.xy = (bool(u_xlatb0)) ? vs_TEXCOORD3.zw : vs_TEXCOORD3.xy;
    u_xlat0.xy = u_xlat0.xy * _anisotropicMap_ST.xy + _anisotropicMap_ST.zw;
    u_xlat16_0.x = texture(_anisotropicMap, u_xlat0.xy).x;
    u_xlat0.x = u_xlat16_0.x * 2.0 + -1.0;
    u_xlat0.x = u_xlat0.x * _sunShift + _sunShiftOffset;
    u_xlat0.x = u_xlat0.x + vs_TEXCOORD5;
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(unity_WorldTransformParams.w>=0.0);
#else
    u_xlatb19 = unity_WorldTransformParams.w>=0.0;
#endif
    u_xlat19.x = (u_xlatb19) ? 1.0 : -1.0;
    u_xlat19.x = u_xlat19.x * vs_TEXCOORD2.w;
    u_xlat38 = dot(u_xlat7.zxy, u_xlat8.xyz);
    u_xlat1.xyz = (-u_xlat8.yzx) * vec3(u_xlat38) + u_xlat7.xyz;
    u_xlat38 = dot(u_xlat1.xyz, u_xlat1.xyz);
    u_xlat38 = inversesqrt(u_xlat38);
    u_xlat1.xyz = vec3(u_xlat38) * u_xlat1.xyz;
    u_xlat2.xyz = u_xlat1.yzx * u_xlat8.xyz;
    u_xlat2.xyz = u_xlat8.zxy * u_xlat1.zxy + (-u_xlat2.xyz);
    u_xlat19.xyz = u_xlat19.xxx * u_xlat2.xyz;
    u_xlat2.xyz = u_xlat0.xxx * u_xlat8.xyz + u_xlat19.zxy;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat2.xyz = vec3(u_xlat58) * u_xlat2.xyz;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _WorldSpaceCameraPos.xyz;
    u_xlat16_63 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat4.xyz = u_xlat3.xyz * vec3(u_xlat16_63) + _MainLightDirectionAndAngleOffset.xyz;
    u_xlat16_10.xyz = u_xlat3.xyz * vec3(u_xlat16_63);
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = inversesqrt(u_xlat58);
    u_xlat3.xyz = vec3(u_xlat58) * u_xlat4.xyz;
    u_xlat58 = dot(u_xlat2.xyz, u_xlat3.xyz);
    u_xlat16_63 = _anisotropicMultiplier + _anisotropicMultiplier;
    u_xlat16_67 = _roughnessMultiplier * _roughnessMultiplier;
    u_xlat16_67 = max(u_xlat16_67, 0.0078125);
    u_xlat59 = u_xlat16_63 * u_xlat16_67;
    u_xlat59 = max(u_xlat59, 0.00100000005);
    u_xlat4.y = u_xlat58 * u_xlat59;
    u_xlat16_63 = dot(u_xlat1.zxy, u_xlat3.xyz);
    u_xlat16_11.x = _anisotropicMultiplier * 2.0 + -1.0;
    u_xlat58 = (-u_xlat16_11.x) + 1.0;
    u_xlat58 = u_xlat58 * u_xlat16_67;
    u_xlat58 = max(u_xlat58, 0.00100000005);
    u_xlat4.x = u_xlat16_63 * u_xlat58;
    u_xlat60 = dot(u_xlat8.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat60 = min(max(u_xlat60, 0.0), 1.0);
#else
    u_xlat60 = clamp(u_xlat60, 0.0, 1.0);
#endif
    u_xlat16_63 = dot(_MainLightDirectionAndAngleOffset.xyz, u_xlat3.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat3.x = (-u_xlat16_63) + 1.0;
    u_xlat22 = u_xlat58 * u_xlat59;
    u_xlat4.z = u_xlat60 * u_xlat22;
    u_xlat41 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat41 = max(u_xlat41, 6.10351563e-05);
    u_xlat41 = u_xlat22 / u_xlat41;
    u_xlat22 = u_xlat22 * 0.318309873;
    u_xlat41 = u_xlat41 * u_xlat41;
    u_xlat22 = u_xlat22 * u_xlat41;
    u_xlat22 = min(u_xlat22, 16.0);
    u_xlat41 = dot(u_xlat2.xyz, u_xlat16_10.xyz);
    u_xlat2.x = dot(u_xlat2.xyz, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat2.z = u_xlat58 * u_xlat2.x;
    u_xlat4.z = u_xlat58 * u_xlat41;
    u_xlat58 = dot(u_xlat1.zxy, u_xlat16_10.xyz);
    u_xlat4.y = u_xlat58 * u_xlat59;
    u_xlat4.x = dot(u_xlat8.xyz, u_xlat16_10.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat4.x = min(max(u_xlat4.x, 0.0), 1.0);
#else
    u_xlat4.x = clamp(u_xlat4.x, 0.0, 1.0);
#endif
    u_xlat58 = dot(u_xlat4.xyz, u_xlat4.xyz);
    u_xlat58 = sqrt(u_xlat58);
    u_xlat58 = u_xlat58 + u_xlat4.x;
    u_xlat58 = u_xlat58 + 6.10351563e-05;
    u_xlat16_63 = dot(u_xlat1.zxy, _MainLightDirectionAndAngleOffset.xyz);
    u_xlat2.y = u_xlat59 * u_xlat16_63;
    u_xlat2.x = dot(u_xlat8.xyz, _MainLightDirectionAndAngleOffset.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat2.x = min(max(u_xlat2.x, 0.0), 1.0);
#else
    u_xlat2.x = clamp(u_xlat2.x, 0.0, 1.0);
#endif
    u_xlat21.x = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21.x = sqrt(u_xlat21.x);
    u_xlat21.x = u_xlat21.x + u_xlat2.x;
    u_xlat21.x = u_xlat21.x + 6.10351563e-05;
    u_xlat58 = u_xlat58 * u_xlat21.x + 6.10351563e-05;
    u_xlat58 = float(1.0) / u_xlat58;
    u_xlat58 = u_xlat58 * u_xlat22;
    u_xlat16_63 = u_xlat3.x * u_xlat3.x;
    u_xlat16_63 = u_xlat3.x * u_xlat16_63;
    u_xlat16_63 = u_xlat3.x * u_xlat16_63;
    u_xlat16_30.x = u_xlat3.x * u_xlat16_63;
    u_xlat21.x = (-u_xlat16_63) * u_xlat3.x + 1.0;
    u_xlat16_3 = texture(_albedoMap, vs_TEXCOORD3.xy);
    u_xlat16_12.xyz = u_xlat16_3.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_12.xyz = u_xlat16_3.xyz * u_xlat16_12.xyz;
    u_xlat16_13.xyz = u_xlat16_12.xyz * _albedoColor.xyz + vec3(-0.0399999991, -0.0399999991, -0.0399999991);
    u_xlat16_12.xyz = u_xlat16_12.xyz * _albedoColor.xyz;
    u_xlat16_13.xyz = vec3(_metallicMultiplier) * u_xlat16_13.xyz + vec3(0.0399999991, 0.0399999991, 0.0399999991);
    u_xlat21.xyz = u_xlat21.xxx * u_xlat16_13.xyz;
    u_xlat3.x = u_xlat16_13.y * 50.0;
#ifdef UNITY_ADRENO_ES3
    u_xlat3.x = min(max(u_xlat3.x, 0.0), 1.0);
#else
    u_xlat3.x = clamp(u_xlat3.x, 0.0, 1.0);
#endif
    u_xlat21.xyz = u_xlat3.xxx * u_xlat16_30.xxx + u_xlat21.xyz;
    u_xlat21.xyz = vec3(u_xlat58) * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _directSpecularColor.xyz;
    u_xlat21.xyz = u_xlat2.xxx * u_xlat21.xyz;
    u_xlat21.xyz = u_xlat21.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_63 = (-_metallicMultiplier) + 1.0;
    u_xlat16_30.xyz = vec3(u_xlat16_63) * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_30.xyz * _MainLightIntensityAndAngleScale.xyz;
    u_xlat16_12.xyz = u_xlat16_6.xyz * u_xlat16_12.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.0>=_AdditionalLightIntensityAndAngleScale[0].w);
#else
    u_xlatb58 = 0.0>=_AdditionalLightIntensityAndAngleScale[0].w;
#endif
    u_xlat16_63 = (u_xlatb58) ? 1.0 : 0.0;
    u_xlat3.xyz = (-vs_TEXCOORD0.xyz) + _AdditionalLightPositionAndFalloff[0].xyz;
    u_xlat16_69 = dot(u_xlat3.xyz, u_xlat3.xyz);
    u_xlat16_69 = max(u_xlat16_69, 6.10351563e-05);
    u_xlat16_70 = inversesqrt(u_xlat16_69);
    u_xlat16_14.xyz = u_xlat3.xyz * vec3(u_xlat16_70);
    u_xlat16_70 = _AdditionalLightIntensityAndAngleScale[0].w + 1.0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb58 = !!(0.00100000005>=abs(u_xlat16_70));
#else
    u_xlatb58 = 0.00100000005>=abs(u_xlat16_70);
#endif
    u_xlat16_15.xy = (bool(u_xlatb58)) ? vec2(1.0, 0.0) : vec2(0.0, 1.0);
    u_xlat16_16.xyz = u_xlat16_15.xxx * _AdditionalLightDirectionAndAngleOffset[0].xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * u_xlat16_15.yyy + u_xlat16_16.xyz;
    u_xlat16_70 = dot(_AdditionalLightDirectionAndAngleOffset[0].xyz, u_xlat16_14.xyz);
    u_xlat58 = dot(u_xlat16_10.xyz, u_xlat16_14.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat58 = min(max(u_xlat58, 0.0), 1.0);
#else
    u_xlat58 = clamp(u_xlat58, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * _AdditionalLightIntensityAndAngleScale[0].w + _AdditionalLightDirectionAndAngleOffset[0].w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_70 = min(max(u_xlat16_70, 0.0), 1.0);
#else
    u_xlat16_70 = clamp(u_xlat16_70, 0.0, 1.0);
#endif
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_63 = max(u_xlat16_63, u_xlat16_70);
    u_xlat16_70 = u_xlat16_69 * _AdditionalLightPositionAndFalloff[0].w;
    u_xlat16_69 = float(1.0) / float(u_xlat16_69);
    u_xlat16_70 = (-u_xlat16_70) * u_xlat16_70 + 1.0;
    u_xlat16_70 = max(u_xlat16_70, 0.0);
    u_xlat16_70 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_69 = u_xlat16_69 * u_xlat16_70;
    u_xlat16_69 = max(u_xlat16_15.x, u_xlat16_69);
    u_xlat16_63 = u_xlat16_63 * u_xlat16_69;
    u_xlat16_14.xyz = vec3(u_xlat16_63) * _AdditionalLightIntensityAndAngleScale[0].xyz;
    u_xlat16_14.xyz = u_xlat16_30.xyz * u_xlat16_14.xyz;
    u_xlat16_14.xyz = u_xlat16_14.xyz * vec3(0.318309873, 0.318309873, 0.318309873);
    u_xlat16_14.xyz = vec3(u_xlat58) * u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat16_12.xyz * u_xlat2.xxx + u_xlat16_14.xyz;
    u_xlat16_12.xyz = u_xlat21.xyz * u_xlat16_6.xyz + u_xlat16_12.xyz;
    u_xlat16_14.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + vs_TEXCOORD4.xyz;
    u_xlat16_14.xyz = vec3(_occlusionScale) * u_xlat16_14.xyz + u_xlat8.xyz;
    u_xlat16_63 = dot(u_xlat16_14.xyz, u_xlat16_14.xyz);
    u_xlat16_63 = inversesqrt(u_xlat16_63);
    u_xlat16_14.xyz = vec3(u_xlat16_63) * u_xlat16_14.xyz;
    u_xlat16_63 = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_63 = min(max(u_xlat16_63, 0.0), 1.0);
#else
    u_xlat16_63 = clamp(u_xlat16_63, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_63 * 0.5 + 0.5;
    u_xlat16_69 = (-u_xlat16_63) + u_xlat16_69;
    u_xlat16_70 = vs_TEXCOORD4.w + -1.0;
    u_xlat16_34.z = _occlusionScale * u_xlat16_70 + 1.0;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_69 + u_xlat16_63;
    u_xlat16_63 = u_xlat16_34.z * u_xlat16_63;
    u_xlat16_69 = vs_TEXCOORD1.w;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_69 = min(max(u_xlat16_69, 0.0), 1.0);
#else
    u_xlat16_69 = clamp(u_xlat16_69, 0.0, 1.0);
#endif
    u_xlat16_69 = u_xlat16_69 + -1.0;
    u_xlat16_69 = _occlusionScale * u_xlat16_69 + 1.0;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_69;
    u_xlat16_70 = min(u_xlat16_63, 1.0);
    u_xlat16_71 = u_xlat16_70 * u_xlat16_70;
    u_xlat16_16.xyz = u_xlat16_30.xyz * vec3(2.04040003, 2.04040003, 2.04040003) + vec3(-0.332399994, -0.332399994, -0.332399994);
    u_xlat16_16.xyz = vec3(u_xlat16_71) * u_xlat16_16.xyz;
    u_xlat16_17.xyz = u_xlat16_30.xyz * vec3(4.79510021, 4.79510021, 4.79510021) + vec3(-0.641700029, -0.641700029, -0.641700029);
    u_xlat16_17.xyz = vec3(u_xlat16_71) * u_xlat16_17.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * vec3(u_xlat16_70) + (-u_xlat16_17.xyz);
    u_xlat16_17.xyz = u_xlat16_30.xyz * vec3(2.75519991, 2.75519991, 2.75519991) + vec3(0.690299988, 0.690299988, 0.690299988);
    u_xlat16_16.xyz = u_xlat16_17.xyz * vec3(u_xlat16_70) + u_xlat16_16.xyz;
    u_xlat16_16.xyz = u_xlat16_16.xyz * _localDiffuseGI.xyz;
    u_xlat16_17.x = dot(_IndirectSpecularMapRotationParams.xy, u_xlat16_14.xz);
    u_xlat16_17.z = dot(_IndirectSpecularMapRotationParams.zw, u_xlat16_14.xz);
    u_xlat16_17.y = u_xlat16_14.y;
    u_xlat16_18.xyz = u_xlat16_17.xyz * u_xlat16_17.xyz;
    u_xlati3.xyz = ivec3(uvec3(lessThan(u_xlat16_17.xyzx, vec4(0.0, 0.0, 0.0, 0.0)).xyz) * 0xFFFFFFFFu);
    u_xlat16_17.xyz = vec3(u_xlat16_69) * u_xlat16_18.xyz;
    u_xlati58 = int(int_bitfieldInsert(2,u_xlati3.y,0,1) );
    u_xlat16_18.xyz = u_xlat16_17.yyy * _IrradianceACCoeffs[u_xlati58].xyz;
    u_xlati58 = int(uint(uint(u_xlati3.x) & 1u));
    u_xlati2 = (u_xlati3.z != 0) ? 5 : 4;
    u_xlat16_17.xyw = u_xlat16_17.xxx * _IrradianceACCoeffs[u_xlati58].xyz + u_xlat16_18.xyz;
    u_xlat16_17.xyz = u_xlat16_17.zzz * _IrradianceACCoeffs[u_xlati2].xyz + u_xlat16_17.xyw;
    u_xlat16_18.xyz = u_xlat16_17.xyz * vec3(_IrradianceACCoeffsIntensity);
    u_xlat16_70 = dot(u_xlat16_17.xyz, vec3(0.333000004, 0.333000004, 0.333000004));
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_18.xyz;
    u_xlat16_30.xyz = u_xlat16_30.xyz * u_xlat16_16.xyz + u_xlat16_12.xyz;
    u_xlat16_12.x = dot(vs_TEXCOORD1, vs_TEXCOORD1);
    u_xlat16_12.x = inversesqrt(u_xlat16_12.x);
    u_xlat16_12.xyz = u_xlat16_12.xxx * vs_TEXCOORD1.yzx;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_12.xyz + u_xlat19.xyz;
    u_xlat57 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat57 = inversesqrt(u_xlat57);
    u_xlat0.xyz = vec3(u_xlat57) * u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb57 = !!(u_xlat16_11.x>=0.0);
#else
    u_xlatb57 = u_xlat16_11.x>=0.0;
#endif
    u_xlat0.xyz = (bool(u_xlatb57)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1.xyz = u_xlat16_10.xyz * u_xlat0.xyz;
    u_xlat1.xyz = u_xlat0.zxy * u_xlat16_10.yzx + (-u_xlat1.xyz);
    u_xlat3.xyz = u_xlat0.xyz * u_xlat1.xyz;
    u_xlat0.xyz = u_xlat1.zxy * u_xlat0.yzx + (-u_xlat3.xyz);
    u_xlat0.xyz = (-u_xlat5.xyz) * vec3(u_xlat62) + u_xlat0.xyz;
    u_xlat16_12.x = u_xlat16_67 * 8.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_67;
    u_xlat16_67 = max(u_xlat16_67, 0.0078125);
    u_xlat16_12.x = min(u_xlat16_12.x, 1.0);
    u_xlat16_12.x = abs(u_xlat16_11.x) * u_xlat16_12.x;
    u_xlat0.xyz = u_xlat16_12.xxx * u_xlat0.xyz + u_xlat8.xyz;
    u_xlat57 = dot(u_xlat16_14.xyz, u_xlat8.xyz);
#ifdef UNITY_ADRENO_ES3
    u_xlat57 = min(max(u_xlat57, 0.0), 1.0);
#else
    u_xlat57 = clamp(u_xlat57, 0.0, 1.0);
#endif
    u_xlat1.x = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat1.x = inversesqrt(u_xlat1.x);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat1.xxx;
    u_xlat16_12.x = dot((-u_xlat16_10.xyz), u_xlat0.xyz);
    u_xlat16_12.x = u_xlat16_12.x + u_xlat16_12.x;
    u_xlat0.xyz = (-u_xlat0.xyz) * u_xlat16_12.xxx + (-u_xlat16_10.xyz);
    u_xlat1.xyz = u_xlat5.xyz * vec3(u_xlat62) + (-u_xlat0.xyz);
    u_xlat1.xyz = vec3(u_xlat16_67) * u_xlat1.xyz + u_xlat0.xyz;
    u_xlat3.xyz = u_xlat0.xyz + (-u_xlat1.xyz);
    u_xlat1.xyz = abs(u_xlat16_11.xxx) * u_xlat3.xyz + u_xlat1.xyz;
    u_xlat16_10.x = -abs(u_xlat16_11.x) * 0.800000012 + 1.0;
    u_xlat16_10.x = u_xlat16_10.x * _roughnessMultiplier;
    u_xlat16_10.x = u_xlat16_10.x * _IndirectSpecularMapMipLevelUsed + (-u_xlat16_10.x);
    u_xlat0.x = dot(u_xlat16_14.xyz, u_xlat0.xyz);
    u_xlat16_34.y = u_xlat0.x * 0.5;
    u_xlat16_29 = dot(_IndirectCubemapRotationParams.xy, u_xlat1.xz);
    u_xlat1.z = dot(_IndirectCubemapRotationParams.zw, u_xlat1.xz);
    u_xlat1.x = u_xlat16_29;
    u_xlat16_1 = textureLod(_IndirectSpecularMap, u_xlat1.xyz, u_xlat16_10.x);
    u_xlat16_10.xyz = u_xlat16_1.www * u_xlat16_1.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(6.0, 6.0, 6.0);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat0.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * vec3(vec3(_IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity, _IndirectSpecularMapIntensity));
    u_xlat16_12.xyz = vec3(u_xlat16_70) * u_xlat16_10.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_indirectSpecularIntensityScale.w);
#else
    u_xlatb0 = 0.0<_indirectSpecularIntensityScale.w;
#endif
    u_xlat16_10.xyz = (bool(u_xlatb0)) ? u_xlat16_12.xyz : u_xlat16_10.xyz;
    u_xlat4.y = _roughnessMultiplier;
    u_xlat16_0.xy = texture(_DfgTexture, u_xlat4.xy).xy;
    u_xlat16_12.xyz = u_xlat16_13.xyz * u_xlat16_0.xxx + u_xlat16_0.yyy;
    u_xlat16_10.xyz = u_xlat16_10.xyz * u_xlat16_12.xyz;
    u_xlat16_10.xyz = u_xlat16_10.xyz * _indirectSpecularIntensityScale.xyz;
    u_xlat16_34.x = _roughnessMultiplier * 1.09769487;
    u_xlat16_12.xyz = u_xlat16_34.xyz + vec3(-0.097694844, 0.5, -0.0);
#ifdef UNITY_ADRENO_ES3
    u_xlat16_12.xyz = min(max(u_xlat16_12.xyz, 0.0), 1.0);
#else
    u_xlat16_12.xyz = clamp(u_xlat16_12.xyz, 0.0, 1.0);
#endif
    u_xlat16_1.yzw = u_xlat16_12.yxz * vec3(15.0, 15.0, 15.0);
    u_xlat16_67 = floor(u_xlat16_1.w);
    u_xlat16_11.x = u_xlat16_67 + 1.0;
    u_xlat16_11.x = min(u_xlat16_11.x, 15.0);
    u_xlat16_1.x = u_xlat16_11.x * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_0.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_1.x = u_xlat16_67 * 16.0 + u_xlat16_1.z;
    u_xlat16_12.xy = u_xlat16_1.xy + vec2(0.5, 0.5);
    u_xlat16_12.xy = u_xlat16_12.xy * vec2(0.00390625, 0.0625);
    u_xlat16_19.x = texture(_SpecularOcclusionLut3D, u_xlat16_12.xy).x;
    u_xlat16_67 = u_xlat16_12.z * 15.0 + (-u_xlat16_67);
    u_xlat16_11.x = (-u_xlat16_19.x) + u_xlat16_0.x;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_11.x + u_xlat16_19.x;
    u_xlat16_67 = u_xlat16_69 * u_xlat16_67;
    u_xlat0.x = u_xlat57 * u_xlat16_67;
    u_xlat16_67 = u_xlat16_63 * 0.5;
    u_xlat16_11.x = (-u_xlat16_63) * 0.5 + 1.0;
    u_xlat16_67 = u_xlat0.x * u_xlat16_11.x + u_xlat16_67;
    u_xlat16_11.x = u_xlat16_67 + u_xlat16_67;
    u_xlat16_12.x = (-u_xlat16_67) * 2.0 + 1.0;
    u_xlat16_67 = u_xlat16_67 * u_xlat16_12.x + u_xlat16_11.x;
    u_xlat16_63 = u_xlat16_63 * u_xlat16_67;
    u_xlat16_63 = min(u_xlat16_63, 1.0);
    u_xlat16_11.xyz = u_xlat16_10.xyz * vec3(u_xlat16_63) + u_xlat16_30.xyz;
    u_xlat16_10.xyz = vec3(u_xlat16_63) * u_xlat16_10.xyz;
    u_xlat16_6.xyz = u_xlat21.xyz * u_xlat16_6.xyz + u_xlat16_10.xyz;
    u_xlat16_6.x = dot(u_xlat16_6.xyz, vec3(0.212672904, 0.715152204, 0.0721750036));
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_6.x = u_xlat16_3.w * _albedoColor.w + u_xlat16_6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlat16_6.x = min(max(u_xlat16_6.x, 0.0), 1.0);
#else
    u_xlat16_6.x = clamp(u_xlat16_6.x, 0.0, 1.0);
#endif
    u_xlat16_25 = u_xlat16_3.w * _albedoColor.w;
    u_xlat0.x = _emissiveBreathe.y * _Time.y;
    u_xlat0.x = sin(u_xlat0.x);
    u_xlat19.x = (-_emissiveBreathe.z) + 1.0;
    u_xlat0.x = abs(u_xlat0.x) * u_xlat19.x + _emissiveBreathe.z;
    u_xlat16_19.xyz = texture(_emissiveMap, vs_TEXCOORD3.xy).xyz;
    u_xlat16_10.xyz = u_xlat16_19.xyz * _emissiveColor.xyz;
    u_xlat0.xyz = u_xlat0.xxx * u_xlat16_10.xyz;
    u_xlat16_10.xyz = u_xlat0.xyz * vec3(0.305306017, 0.305306017, 0.305306017) + vec3(0.682171106, 0.682171106, 0.682171106);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + vec3(0.0125228781, 0.0125228781, 0.0125228781);
    u_xlat16_10.xyz = u_xlat0.xyz * u_xlat16_10.xyz + u_xlat16_11.xyz;
    u_xlat16_11.xyz = (-u_xlat16_10.xyz) + _FogCol.xyz;
    u_xlat16_10.xyz = vs_TEXCOORD0.www * u_xlat16_11.xyz + u_xlat16_10.xyz;
    u_xlat0.xyz = u_xlat16_10.xyz * vec3(2.50999999, 2.50999999, 2.50999999) + vec3(0.0299999993, 0.0299999993, 0.0299999993);
    u_xlat0.xyz = u_xlat0.xyz * u_xlat16_10.xyz;
    u_xlat2.xyz = u_xlat16_10.xyz * vec3(2.43000007, 2.43000007, 2.43000007) + vec3(0.589999974, 0.589999974, 0.589999974);
    u_xlat2.xyz = u_xlat16_10.xyz * u_xlat2.xyz + vec3(0.140000001, 0.140000001, 0.140000001);
    u_xlat0.xyz = u_xlat0.xyz / u_xlat2.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xyz = min(max(u_xlat0.xyz, 0.0), 1.0);
#else
    u_xlat0.xyz = clamp(u_xlat0.xyz, 0.0, 1.0);
#endif
    u_xlat0.xyz = log2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(0.416666657, 0.416666657, 0.416666657);
    u_xlat0.xyz = exp2(u_xlat0.xyz);
    u_xlat0.xyz = u_xlat0.xyz * vec3(1.05499995, 1.05499995, 1.05499995) + vec3(-0.0549999997, -0.0549999997, -0.0549999997);
    u_xlat0.xyz = max(u_xlat0.xyz, vec3(0.0, 0.0, 0.0));
    SV_Target0.xyz = u_xlat0.xyz;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(0.0<_specularAlphaMode);
#else
    u_xlatb0 = 0.0<_specularAlphaMode;
#endif
    SV_Target0.w = (u_xlatb0) ? u_xlat16_6.x : u_xlat16_25;
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
}
}
 Pass {
 Name "ShadowCaster"
  Tags { "LIGHTMODE" = "SHADOWCASTER" "RenderType" = "Opaque" }
  GpuProgramID 95825
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
CustomEditor "FTheseusShaderGUI.HairShaderGUI"
}